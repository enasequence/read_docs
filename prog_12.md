# Module 12: Submit Annotated Flat Files

Annotated sequences can be submitted in flat file format using Analysis XML.

In most cases it is not necessary to use flat files because
[Interactive Webin](https://www.ebi.ac.uk/ena/submit/sra/#home) provides spreadsheet templates for various types of 
annotated sequences. This allows you to submit tab separated files (TSV) which you can fill in using a 
spreadsheet editor. 
You can see the types of sequences with support for spreadsheet submissions here:
[http://www.ebi.ac.uk/ena/submit/annotation-checklists](http://www.ebi.ac.uk/ena/submit/annotation-checklists).
Please do not submit flat files for any of these sequence types. 

Some annotated sequences can't be submitted using tab separated file (TSV) submissions.
For example, the [HLA gene](http://www.ebi.ac.uk/ena/data/view/KU963029&display=text) has multiple
exons and this is difficult to describe in a spreadsheet. Typically the more complicated sequences
with multiple and repeating features are the ones which must be submitted using flat files.

You can see examples of types of sequences submitted using flat files here:
[http://www.ebi.ac.uk/ena/submit/entry-upload-templates](http://www.ebi.ac.uk/ena/submit/entry-upload-templates) 

## Object relationships

Annotated sequence are submitted using Analysis XML and are required to be 
part of a study.

![annotated sequences](images/webin_data_model_analysis.png)

Studies are used to group other objects together and are typically used across multiple analyses and experiments.

## Accession numbers

The analysis XML will be assigned an ERZ accession at time of submission. However, this
accession is never used when citing the submission. Instead, refer to your data either using the
study accession (ERP or PRJ) or the assigned individual sequence accessions.

The sequence accessions will be assigned only when the submission has been fully
processed by ENA. This will happen some time after the submission has been made.
The sequence accessions will be send to you by e-mail and are also available 
through the [Webin XML and reports portal](prog_11.html). 

## Step 1: Register a study

If you have already registered a study then you can add your new analysis to it. If not then
you should register a new study:

- [Register a new study using interactive Webin](mod_02.html)
- [Register a new study using programmatic Webin](prog_02.html)

## Step 2: Upload data files

Please see [Data Upload](upload_01.html).

You must upload gz compressed flat files into your Webin upload area before you can
submit them using analysis XML. Once the analysis has been submitted the files
will be moved from the Webin upload area into the archive.

## Step 3: Create Analysis XML

Here is an example of an analysis XML:

```xml
<ANALYSIS_SET>
   <ANALYSIS alias="Human_parvovirus_B19_entryupload">
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

Note the file type attribute: `filetype="flatfile"`. 

Remember that the above analysis XML is an example. You must provide your own details
in the analysis XML. 

## Step 4: Create the Submission XML

To submit a study or any other object(s), you need an accompanying submission XML in a separate file. 
Let's call this file `submission.xml`. 

```xml
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

## Step 5: Submit the XMLs

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



