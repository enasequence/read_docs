# Module 3: Entry Upload - Submit an EMBL Sequence File

Annotated sequence entries are stored in the ENA as EMBL format sequence files. [Here](http://www.ebi.ac.uk/ena/data/view/KU963029&display=text) is an example of an HLA gene in EMBL format. It is a text file that is computer readable due to the 2 character line beginnings (ID, AC, DE ...). The ENA browser renders the text file into a friendlier and more graphical [view](http://www.ebi.ac.uk/ena/data/view/KU963029) but the computer readable version is still available so that automatic pipelines down stream of the ENA can download and parse large numbers of sequence entries.

## Create your own EMBL sequence file

It is not trivial to submit an EMBL sequence file because of the specific formatting that is required. In most cases it is not necessary because the interactive tool [Webin](https://www.ebi.ac.uk/ena/submit/sra/#home) provides spreadsheet templates for various types of sequences so that you can submit using a tab separated file (TSV) which you can fill in using any spreadsheet editor. After the submission via Webin or via <a href="./prog_02.html">programmatic REST API</a> the TSV is converted into an EMBL format sequence file and validated, and accessions are delivered. 

Not all sequence types are available as a TSV spreadsheet template. For instance the HLA gene above has multiple exons and this is difficult for us to turn into a template. Typically the more complicated sequences with multiple and repeating features are the hardest to make into TSV templates. For these types of sequences you can create an EMBL sequence file yourself and submit it to the ENA using the programmatic REST API. This is called "submission by entry upload".

For a list of sequence types that are available for TSV spreadsheet submission see here:
[http://www.ebi.ac.uk/ena/submit/annotation-checklists](http://www.ebi.ac.uk/ena/submit/annotation-checklists)

Please do not use submission by entry upload for any sequence type listed on the above webpage. The spreadsheet submission route is more robust because we do the file conversion.

For examples of EMBL sequence files that are not available for submission by spreadsheet see here: 
[http://www.ebi.ac.uk/ena/submit/entry-upload-templates](http://www.ebi.ac.uk/ena/submit/entry-upload-templates) 

Pay close attention to how the sequences are files are formatted. Use the web page above to construct your sequence file. This will be submitted by entry upload. As with a TSV submission (module 2) you need to create an analysis object in XML format to wrap the EMBL sequence file. Please check <a href="./prog_02.html#the-analysis-object">module 2: Analysis object</a> for more information.  To see how the analysis object and the sequence entries will be accessioned please refer to <a href="./prog_02.html#a-word-about-accession-numbers">module 2: A word about Accession Numbers</a>


## Submission by Entry Upload

Submitting an EMBL sequence file is the same as submitting a tab separated file, so much of the detail is in <a href="./prog_02.html">module 2</a>). The main difference is that for tsv spreadsheet submissions the tab/tsv file is converted to an EMBL sequence file and then validation is applied. For a submission by entry upload, the conversion is omitted because the file is already in EMBL format. The system will try to validate your EMBL sequence file after only minimal processing. There is more opportunity for error but this can be remedied by following the [guidelines](http://www.ebi.ac.uk/ena/submit/entry-upload-templates) closely.

### Step 1: Create a project

As with a TSV submission (module 2), a project is required. If you already have a study you can add your annotated sequence entries to it. If not, create one first. Use either the <a href="./mod_02.html">interactive submission route</a> or the <a href="./prog_01.html">programmatic submission route</a> to do this. Note the project accession number when you receive it.

### Step 2: Compress and upload the sequence file

As with a TSV submission, the sequence file must be compressed and uploaded to your Webin ftp directory. You may also need to calculate the MD5 checksum. Check <a href="./prog_02.html#step-3-upload-the-tsv-file-to-your-ftp-directory">here</a> and <a href="./file_prep.html">here</a> for instructions.
In this example I have an EMBL file called **Human_parvovirus_B19_entryupload.embl** which I have compressed to create file **Human_parvovirus_B19_entryupload.embl.gz**. The checksum of **Human_parvovirus_B19_entryupload.embl.gz** is `7138bf3320cad8d215b7e9930ded114b`.

### Step 3: Create the analysis and submission XMLs

First check how the analysis file was created in module 2 <a href="./prog_02.html#step-4-prepare-the-analysis-xml-file">step 4</a>

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

In this case there is no ERT number/checklist attribute because no TSV checklist template is being used. Also the file type attribute is different: `filetype="flatfile"`. The title and description can be a brief description of what is presented in the sequence file. Make sure to add all your own attributes and field values as the above is for example purposes.

The submission XML in this example looks like this:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<SUBMISSION alias="entry_upload_Human_parvovirus_B19" center_name="EBI">
   <ACTIONS>
      <ACTION>
         <ADD source="analysis.xml" schema="analysis"/>
      </ACTION>
   </ACTIONS>
</SUBMISSION>
```

As in module 2 <a href="./prog_02.html#step-5-prepare-a-submission-xml-file">step 5</a>, complete a submission XML file. Provide a unique alias for submission object and reference the file containing the analysis object (in this case I called it 'analysis.xml').

### Step 4: Send both XMLs to ENA using REST API

This step is the same as module 2 <a href="prog_02.html#step-6-send-the-xmls-to-ena-through-the-rest-api">step 6</a>.

Use cURL or the web form to send the XMLs to ENA and register the EMBL file submission. Use the test server first and if successful and you are happy with the receipt proceed to submit to the production server.

In this example I obtained the following receipt

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="receipt.xsl"?>
<RECEIPT receiptDate="2017-05-08T12:51:53.601+01:00" submissionFile="sub.xml" success="true">
   <ANALYSIS accession="ERZ408000" alias="Human_parvovirus_B19_entryupload" status="PRIVATE" />
   <SUBMISSION accession="ERA911540" alias="entry_upload" />
   <ACTIONS>ADD</ACTIONS>
</RECEIPT>
```

In this example the analysis received accession ERZ408000 and the submission received accession ERA911540. You will not need the submission accession, whereas the analysis accession may be useful if you need to enquire about the progress of the submission. After the sequence entries are processed they will be accessioned and you will receive the accession (or accession range if multiple sequences were in the file) via the email address that is registered with your Webin account. Do not quote the analysis accession in any publication, always quote the sequence accessions (which come later by email). You can also quote the project accession, especially if you have used the project to group several submissions across different domains.


