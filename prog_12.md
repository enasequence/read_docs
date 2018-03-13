# Module 12: Flat File upload - Submit an ENA Supported Sequence File

Annotated sequence entries are stored in the ENA as ENA supported sequence files. [Here](http://www.ebi.ac.uk/ena/data/view/KU963029&display=text) is an example of an HLA gene in ENA supported format. It is a text file that is computer readable due to the 2 character line beginnings (ID, AC, DE ...). The ENA browser renders the text file into a friendlier and more graphical [view](http://www.ebi.ac.uk/ena/data/view/KU963029) but the computer readable version is still available so that automatic pipelines down stream of the ENA can download and parse large numbers of sequence entries.

## Create your own ENA supported sequence file

In most cases it is not necessary to submit an ENA supported sequence file because the interactive tool [Webin](https://www.ebi.ac.uk/ena/submit/sra/#home) provides spreadsheet templates for various types of sequences so that you can submit using a tab separated file (TSV) which you can fill in using any spreadsheet editor. These are called 'annotation checklists'. After the submission via Webin or via <a href="./prog_04.html">programmatic REST API</a> the TSV is converted into an ENA supported sequence file (or 'flat file') and validated before accessions are delivered. 

Not all sequence types are available as a TSV spreadsheet template/annotation checklist. For instance the HLA gene above has multiple exons and this is difficult for us to turn into a template. Typically the more complicated sequences with multiple and repeating features are the hardest to make into TSV templates. For these types of sequences you can create an ENA supported sequence file yourself and submit it to the ENA using the programmatic REST API (this is submission by "flat file upload", previously "entry upload").

For a list of sequence types that are available as annotation checklists (TSV spreadsheets) see here:
[http://www.ebi.ac.uk/ena/submit/annotation-checklists](http://www.ebi.ac.uk/ena/submit/annotation-checklists)

Please do not use submission by flat file for any sequence type listed on the above webpage. The spreadsheet/annotation checklist submission route is more robust because we do the file conversion.

For examples of ENA flat files that are not available for submission using annotation checklists/TSV see here:
[http://www.ebi.ac.uk/ena/submit/entry-upload-templates](http://www.ebi.ac.uk/ena/submit/entry-upload-templates) 

Pay close attention to how the flat files are formatted. Use the web page above to construct your sequence flat file. This will be submitted by flat file upload. As with a TSV/annotation checklist submission (module 2) you need to create an analysis object in XML format to wrap the ENA flat file. Please check <a href="./prog_04.html#the-analysis-object">module 2: Analysis object</a> for more information.  To see how the analysis object and the sequence entries will be accessioned please refer to <a href="./prog_04.html#a-word-about-accession-numbers">module 2: A word about Accession Numbers</a>


## Submission by Flat File Upload

Submitting an ENA flat file is the same as submitting a tab separated file, so much of the detail is in <a href="./prog_04.html">module 2</a>). The main difference is that for tsv spreadsheet submissions the tab/tsv file is converted to an ENA flat file and then validation is applied. For a submission by flat file upload, the conversion is omitted because the file is already in the ENA supported format. The system will try to validate your ENA flat file after only minimal processing. There is a little more opportunity for error but this can be remedied by following the [guidelines](http://www.ebi.ac.uk/ena/submit/entry-upload-templates) closely.

### Step 1: Create a project

As with a TSV/annotation checklist submission (module 2), a project/study is required. If you already have a study you can add your annotated sequence entries to it. If not, create one first. Use either the <a href="./mod_02.html">interactive submission route</a> or the <a href="./prog_02.html">programmatic submission route</a> to do this. Note the project accession number when you receive it.

### Step 2: Compress and upload the sequence flat file

As with a TSV/annotation checklist submission, the sequence flat file must be compressed and uploaded to your Webin ftp directory. You may also need to calculate the MD5 checksum. Check <a href="./prog_04.html#step-3-upload-the-tsv-file-to-your-ftp-directory">here</a> and <a href="./file_prep.html">here</a> for instructions.
In this example I have an ENA flat file called **Human_parvovirus_B19_entryupload.embl** which I have compressed to create file **Human_parvovirus_B19_entryupload.embl.gz**. The checksum of **Human_parvovirus_B19_entryupload.embl.gz** is `7138bf3320cad8d215b7e9930ded114b`.

### Step 3: Create the analysis XML

First check how the analysis file was created in module 2 <a href="./prog_04.html#step-4-prepare-the-analysis-xml-file">step 4</a>

In this example the analysis file looks like this

```xml
<?xml version = '1.0' encoding = 'UTF-8'?>
<ANALYSIS_SET>
   <ANALYSIS alias="Human_parvovirus_B19_entryupload" center_name="EBI">
      <TITLE>Human parvovirus B19 isolate IRB_1_2008 NS1 and VP1 unique region genes, partial cds</TITLE>
      <DESCRIPTION>Human parvovirus B19 isolate IRB_1_2008 NS1 and VP1 unique region genes, partial cds</DESCRIPTION>
      <STUDY_REF accession="PRJEBXXXX">
      </STUDY_REF>
      <ANALYSIS_TYPE>
         <SEQUENCE_FLATFILE/>
      </ANALYSIS_TYPE>
      <FILES>
         <FILE checksum="7138bf3320cad8d215b7e9930ded114b" checksum_method="MD5" filename="Human_parvovirus_B19_entryupload.embl.gz" filetype="flatfile"/>
      </FILES>
   </ANALYSIS>
</ANALYSIS_SET>
```

In this case there is no ERT number/checklist attribute because no TSV annotation checklist template is being used. Also the file type attribute is different: `filetype="flatfile"`. The title and description can be a brief description of what is presented in the sequence flat file. Make sure to add all your own attributes and field values as the above is only for example purposes.

### Step 4: Create the submission XML

To submit a study or any other object(s), you need an accompanying submission XML in a separate file. 
Let's call this file `submission.xml`. 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<SUBMISSION>
   <ACTIONS>
      <ACTION>
         <ADD/>
      </ACTION>
   </ACTIONS>
</SUBMISSION>
```

The submission XML declares one or more Webin submission service actions. 
In this case the action is `<ADD/>` which is used to submit new objects. 

The XMLs can be submitted programmatically, using CURL on command line or 
using the [Webin XML and reports portal](prog_11.html).

### Step 5: Submit the XMLs

CURL is a Linux/Unix command line program which you can use to send the `analysis.xml` and `submission.xml`
to the Webin submission service.

```bash
curl -u username:password -F "SUBMISSION=@submission.xml" -F "ANALYSIS=@analysis.xml" "https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/"
```

Please provide your Webin submission account credentials using the `username` and `password`.

After running the command above a receipt XML is returned. It will look like the one below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="receipt.xsl"?>
<RECEIPT receiptDate="2017-05-05T15:28:38.557+01:00" submissionFile="submission.xml" success="true">
   <ANALYSIS accession="ERZ408000" alias="Human_parvovirus_B19_entryupload" status="PRIVATE" />
   <SUBMISSION accession="ERA911540" alias="entry_upload_Human_parvovirus_B19" />
   <MESSAGES>
      <INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
   </MESSAGES>
   <ACTIONS>ADD</ACTIONS>
</RECEIPT>
```

### Submit the XMLs using Webin XML and reports portal

XMLs can also be submitted interactively using the [Webin XML and reports portal](prog_11.html).
Please refer to the [Webin XML and reports portal](prog_11.html) document for an example how
to submit a study using XML. Other types of XMLs can be submitted using the same approach. 

### The Receipt XML

To know if the submission was successful look in the first line of the `<RECEIPT>` block. 

The attribute `success` will have value `true` or `false`. If the value 
is false then the submission did not succeed. In this case check the rest of 
the receipt for error messages and after making corrections, try the submission again. 

If the success attribute is true then the submission was successful. The receipt will 
contain the accession numbers of the objects that you have submitted.

### Accession numbers in the Receipt XML

In this example the analysis received accession ERZ408000 and the submission received accession ERA911540. 
You will not need the submission accession, whereas the analysis accession may be useful if you need to 
enquire about the progress of the submission. 

After the sequence entries are processed they will be accessioned and you will receive the accession 
(or accession range if multiple sequences were submitted) via the email address that is registered 
with your Webin account. Do not quote the analysis accession in any publication, always quote the 
sequence accessions (which come later by email). You can also quote the study (project) accession,
especially if you have used the study to group several submissions together.

### Test and production services

Note the message in the receipt:
```xml
<INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
```

It is advisable to first test your submissions using the Webin test service where changes are not permanent 
and are erased every 24 hours. 

Once you are happy with the result of the submission you can use the CURL command again 
but this time using the production service. Simply change the part in the URL from `wwwdev.ebi.ac.uk` to 
`www.ebi.ac.uk`:

```bash
curl -u username:password -F "SUBMISSION=@submission.xml" -F "ANALYSIS=@analysis.xml" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/"
```

Similarly, if you are using the [Webin XML and reports portal](prog_11.html) change the URL from 
`wwwdev.ebi.ac.uk` to `www.ebi.ac.uk`.



