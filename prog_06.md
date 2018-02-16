# Module 6: Updating Sample objects using REST API

<!-- ERA980084 -->

Editing existing samples in the ENA using the REST API is an almost identical process to submitting new sample objects by XML REST API. This is outlined in <a href="prog_05.html">module 5</a> of this section and it is necessary to review module 5 before following this tutorial as it is shortened to avoid repeating the same information. 

## Halfway editing: Sample XML, one at a time 

The interactive [Webin](https://www.ebi.ac.uk/ena/submit/sra/#home) submission system provides some editing capacity for your existing ENA samples. Guidelines for using this webform based editor are <a href="mod_05.html#sample-edit">here</a>. Samples are stored in the ENA as XML objects and you may find that some edits that are not possible to do from the webform editor (purple rectangle below) **are** possible to do by editing the XML version of the sample directly. You can access the XML version of the sample from the same place as the webform editor (see the <a href="mod_05.html#sample-edit">sample edit module</a>). Using the 'edit XML' tab (red oval) you can change most of the field values in the SAMPLE_ATTRIBUTES block, for example 'collection_date', as in the example below (green arrow). Remember to click 'save' (blue oval) when you are happy with the changes. Validation will be applied according to which checklist is being used for that sample (more on checklists <a href="prog_05.html#apply-an-ena-minimum-information-standard-checklist-to-your-samples">here</a>). If successful you will see a confirmation message but if there is a problem the changes will not be saved and you can try again.

![webform_xml](images/prog_06_p01.png)

## Sample XML edit by REST API

You may notice that while you can use the interactive submission system to edit the sample XML directly you can only do this one sample at a time so it quickly becomes unfeasible for editing many samples in bulk. Using the REST API however you can combine many samples in the same XML file and then send this file to the ENA sever for validation and incorporation into the ENA database. The only difference between doing this for new samples and existing samples is that if the samples are existing, no new accessions are administered and the new versions will replace the existing versions. for this reason it is imperative that the samples are identified as already existing. To do this:

1. Do not change the original alias of the sample or the system will not know which existing sample is being replaced.
2. Instead of step 1 above you can provide the sample accession (which is guaranteed to be unique, even outside of your submission account) instead of the alias to the same effect. You can even change the alias if the accession is present.
3. The other important difference when updating ore editing a sample is that the `ADD` keyword in the submission XML file is not used and instead the keyword `MODIFY` is used.

## Step 1: Get hold of the samples in XML format

You must start with the samples that need editing in an XML formatted file. There are 3 ways to do this:

### 1: Use your original sample XML

Ideally you will have the samples in XML format from your original submission if you used the REST API to submit them. If you do not change the alias of the samples you can use this XML to register new changes to the samples.

### 2: Grab a live version of your samples

If you did not submit the samples as an XML file then you need to build the XML file. If your samples are in the public domain you can find XML versions in the ENA browser by using this URL and appending `http://www.ebi.ac.uk/ena/data/view/` and appending the sample accessions as a range or a comma separated list, and then appending `&display=xml` to the end. For example: [http://www.ebi.ac.uk/ena/data/view/ERS1835108-ERS1835125&display=xml](http://www.ebi.ac.uk/ena/data/view/ERS1835108-ERS1835125&display=xml).

However these are not submittable because they are browser-specific and are created for writing html webpages. When you understand the difference between the browser XMLs and the ENA database XMLs you can convert them.

#### Web version

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ROOT request="ERS1835108&amp;display=xml">
<SAMPLE alias="16S_ArcMicro_NICE15_1" center_name="CIIMAR - Interdisciplinary Centre of Marine and Environmental Research" accession="ERS1835108">
     <IDENTIFIERS>
          <PRIMARY_ID>ERS1835108</PRIMARY_ID>
          <EXTERNAL_ID namespace="BioSample">SAMEA104176090</EXTERNAL_ID>
          <SUBMITTER_ID namespace="CIIMAR - Interdisciplinary Centre of Marine and Environmental Research">16S_ArcMicro_NICE15_1</SUBMITTER_ID>
     </IDENTIFIERS>
     <TITLE>Arctic Microbiota during Winter-Spring Transition</TITLE>
     <SAMPLE_NAME>
          <TAXON_ID>408172</TAXON_ID>
          <SCIENTIFIC_NAME>marine metagenome</SCIENTIFIC_NAME>
     </SAMPLE_NAME>
     <DESCRIPTION>During the Norwegian young sea Ice cruise 2015 (N-ICE2015), that took place in drifting pack ice north of Svalbard between January-June 2015, seawater was collected, at 5, 20 or 50, 250 m depth in 9th March, 27th April and 16th June, together with physical and biogeochemical data. Through the massively parallel sequencing of SSU rRNA amplicon we expect to get a snapshot of the Arctic microbiota diversity and structure through the dark-light transition.</DESCRIPTION>
     <SAMPLE_LINKS>
          <SAMPLE_LINK>
               <XREF_LINK>
                    <DB>ENA-STUDY</DB>
                    <ID>ERP024265</ID>
               </XREF_LINK>
          </SAMPLE_LINK>
          <SAMPLE_LINK>
               <XREF_LINK>
                    <DB>ENA-EXPERIMENT</DB>
                    <ID>ERX2103719</ID>
               </XREF_LINK>
          </SAMPLE_LINK>
          <SAMPLE_LINK>
               <XREF_LINK>
                    <DB>ENA-RUN</DB>
                    <ID>ERR2044662</ID>
               </XREF_LINK>
          </SAMPLE_LINK>
          <SAMPLE_LINK>
               <XREF_LINK>
                    <DB>ENA-SUBMISSION</DB>
                    <ID>ERA980084</ID>
               </XREF_LINK>
          </SAMPLE_LINK>
          <SAMPLE_LINK>
               <XREF_LINK>
                    <DB>ENA-FASTQ-FILES</DB>
                    <ID><![CDATA[http://www.ebi.ac.uk/ena/data/warehouse/filereport?accession=ERS1835108&result=read_run&fields=run_accession,fastq_ftp,fastq_md5,fastq_bytes]]></ID>
               </XREF_LINK>
          </SAMPLE_LINK>
          <SAMPLE_LINK>
               <XREF_LINK>
                    <DB>ENA-SUBMITTED-FILES</DB>
                    <ID><![CDATA[http://www.ebi.ac.uk/ena/data/warehouse/filereport?accession=ERS1835108&result=read_run&fields=run_accession,submitted_ftp,submitted_md5,submitted_bytes,submitted_format]]></ID>
               </XREF_LINK>
          </SAMPLE_LINK>
     </SAMPLE_LINKS>
     <SAMPLE_ATTRIBUTES>
          <SAMPLE_ATTRIBUTE>
               <TAG>environment (biome)</TAG>
               <VALUE>ENVO:01000048</VALUE>
          </SAMPLE_ATTRIBUTE>
          <SAMPLE_ATTRIBUTE>
               <TAG>environment (feature)</TAG>
               <VALUE>ENVO:00000015</VALUE>
          </SAMPLE_ATTRIBUTE>
          <SAMPLE_ATTRIBUTE>
               <TAG>environment (material)</TAG>
               <VALUE>ENVO:00002151</VALUE>
          </SAMPLE_ATTRIBUTE>
          <SAMPLE_ATTRIBUTE>
               <TAG>geographic location (country and/or sea)</TAG>
               <VALUE>Arctic Ocean</VALUE>
          </SAMPLE_ATTRIBUTE>
          <SAMPLE_ATTRIBUTE>
               <TAG>ENA-SPOT-COUNT</TAG>
               <VALUE>137793</VALUE>
          </SAMPLE_ATTRIBUTE>
          <SAMPLE_ATTRIBUTE>
               <TAG>ENA-BASE-COUNT</TAG>
               <VALUE>74587968</VALUE>
          </SAMPLE_ATTRIBUTE>
     </SAMPLE_ATTRIBUTES>
</SAMPLE>
</ROOT>
```

#### Submitted version

```xml
<?xml version = '1.0' encoding = 'UTF-8'?><SAMPLE_SET>
   <SAMPLE alias="16S_ArcMicro_NICE15_1" center_name="CIIMAR - Interdisciplinary Centre of Marine and Environmental Research" accession="ERS1835108">
      <TITLE>Arctic Microbiota during Winter-Spring Transition</TITLE>
      <SAMPLE_NAME>
         <TAXON_ID>408172</TAXON_ID>
         <SCIENTIFIC_NAME>marine metagenome</SCIENTIFIC_NAME>
      </SAMPLE_NAME>
      <DESCRIPTION>During the Norwegian young sea Ice cruise 2015 (N-ICE2015), that took place in drifting pack ice north of Svalbard between January-June 2015, seawater was collected, at 5, 20 or 50, 250 m depth in 9th March, 27th April and 16th June, together with physical and biogeochemical data. Through the massively parallel sequencing of SSU rRNA amplicon we expect to get a snapshot of the Arctic microbiota diversity and structure through the dark-light transition.</DESCRIPTION>
      <SAMPLE_ATTRIBUTES>
         <SAMPLE_ATTRIBUTE>
            <TAG>environment (biome)</TAG>
            <VALUE>ENVO:01000048</VALUE>
         </SAMPLE_ATTRIBUTE>
         <SAMPLE_ATTRIBUTE>
            <TAG>environment (feature)</TAG>
            <VALUE>ENVO:00000015</VALUE>
         </SAMPLE_ATTRIBUTE>
         <SAMPLE_ATTRIBUTE>
            <TAG>environment (material)</TAG>
            <VALUE>ENVO:00002151</VALUE>
         </SAMPLE_ATTRIBUTE>
         <SAMPLE_ATTRIBUTE>
            <TAG>geographic location (country and/or sea)</TAG>
            <VALUE>Arctic Ocean</VALUE>
         </SAMPLE_ATTRIBUTE>
      </SAMPLE_ATTRIBUTES>
   </SAMPLE>
</SAMPLE_SET>

```

Obtain a submittable XML from a web version:

1. the `<ROOT>` block is browser specific, remove it.
2. `<SAMPLE_LINKS>` block is browser specific, remove it
3. Certain `<SAMPLE_ATTRIBUTE>` blocks were added by ENA for browser rendering and are not part of the original object. Be sure to remove attributes **ENA-SPOT-COUNT** and **ENA-BASE-COUNT** 
4. The `<IDENTIFIERS>` block can stay but it also gets added back automatically so it can be simpler to remove it.

### 3: Access the REST API endpoint

If your samples are not public yet then there is a REST endpoint that you can use with your Webin account id and your account password:
 
[https://www.ebi.ac.uk/ena/submit/drop-box](https://www.ebi.ac.uk/ena/submit/drop-box)

You can login to this service, navigate to the sample you need to collect and the select the 'xml' option. This process is described in <a href="prog_04.html#erp-version">module 4</a> for studies but you can do the same for samples. This method can take URLs similar to when browsing the public domain but because this resource contains confidential objects that are tied to your account as well as the public ones you must provide access credentials (*Webin-0000* to be replaced with account id, *password* to be replaced with your password, and *ERS000000* to be replaced with accession number of a sample in your account:
`https://Webin-0000:password@www.ebi.ac.uk/ena/submit/drop-box/samples/ERS1835108?format=xml`

Unlike using the ENA browser you can not provide a range or comma separated list of accession numbers in the URL but since you have the use of targeted URLs you can script multiple calls together and concatonate afterwards.

```bash
curl "https://Webin-0000:password@www.ebi.ac.uk/ena/submit/drop-box/samples/ERS1835108?format=xml" >> samp.xml 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  3191  100  3191    0     0  12603      0 --:--:-- --:--:-- --:--:-- 12612
```

```
cat samp.xml 
<SAMPLE_SET>
   <SAMPLE accession="ERS1835108" alias="16S_ArcMicro_NICE15_1"
           center_name="CIIMAR - Interdisciplinary Centre of Marine and Environmental Research">
      <IDENTIFIERS>
...
...

```

The resulting file (for example, 'samp.xml') will need some editing but not much. For instance all `<SAMPLE>` blocks need to be contained in a single `<SAMPLE_SET>` block (as described <a href="prog_05.html#submitting-many-samples-simultaneously">here</a>) 

## Step 2: Create a submission XML file

As with <a href="prog_04.html#step-2-create-a-submission-xml-file">study update</a> and sample submission, a submission object is required to accompany the XML file containing the samples that you obtained from the previous step. You may have this from a previous submission or update but it is also very quick to create one

```xml
<?xml version="1.0" encoding="UTF-8"?>
<SUBMISSION alias="arctic_ocean_sample_updates" center_name="">
   <ACTIONS>
      <ACTION>
         <MODIFY source="samp.xml" schema="sample"/>
      </ACTION>
   </ACTIONS>
</SUBMISSION>
```

Make sure that you give the submission object a unique alias (which can be any string) and fill in the center_name for your account (you can find this in the “my account details” drop down from inside [Webin](https://www.ebi.ac.uk/ena/submit/sra/#home)).

The important part of this submission object is the `<MODIFY>` tag. Contrast this with the tag used to submit the sample objects for the first time (<a href="prog_05.html">in module 5</a>) which is `<ADD>`. This tells the REST server that we are updating an existing object instead of adding a new one.

## Step 3: Make the edit and send to ENA

Now you can make the necessary changes to the samples. The final step is identical to submitting the samples for the first time in <a href="prog_05.html#submitting-the-xml-files">module 5</a>. You will send the submission xml file and the sample xml file to the ENA REST server using **cURL** or the [webform](https://www-test.ebi.ac.uk/ena/submit/restsubmit.html) and you should receive a receipt in XML format. If the receipt contains `success="true"` then your edit will have been committed to the database. If not, check the error message(s), correct and repeat.

```bash
curl -u username:password -F "SUBMISSION=@sub.xml" -F "SAMPLE=@samp.xml" "https://www-test.ebi.ac.uk/ena/submit/drop-box/submit/"
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="receipt.xsl"?>
<RECEIPT receiptDate="2017-07-31T16:20:52.075+01:00" submissionFile="sub.xml" success="true">
     <SAMPLE accession="ERS1835108" alias="16S_ArcMicro_NICE15_1" status="PUBLIC">
          <EXT_ID accession="SAMEA104176090" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835109" alias="16S_ArcMicro_NICE15_2" status="PUBLIC">
          <EXT_ID accession="SAMEA104176091" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835110" alias="16S_ArcMicro_NICE15_3" status="PUBLIC">
          <EXT_ID accession="SAMEA104176092" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835111" alias="16S_ArcMicro_NICE15_4" status="PUBLIC">
          <EXT_ID accession="SAMEA104176093" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835112" alias="16S_ArcMicro_NICE15_5" status="PUBLIC">
          <EXT_ID accession="SAMEA104176094" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835113" alias="16S_ArcMicro_NICE15_6" status="PUBLIC">
          <EXT_ID accession="SAMEA104176095" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835114" alias="16S_ArcMicro_NICE15_7" status="PUBLIC">
          <EXT_ID accession="SAMEA104176096" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835115" alias="16S_ArcMicro_NICE15_8" status="PUBLIC">
          <EXT_ID accession="SAMEA104176097" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835116" alias="16S_ArcMicro_NICE15_9" status="PUBLIC">
          <EXT_ID accession="SAMEA104176098" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835117" alias="18S_ArcMicro_NICE15_1" status="PUBLIC">
          <EXT_ID accession="SAMEA104176099" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835118" alias="18S_ArcMicro_NICE15_2" status="PUBLIC">
          <EXT_ID accession="SAMEA104176100" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835119" alias="18S_ArcMicro_NICE15_3" status="PUBLIC">
          <EXT_ID accession="SAMEA104176101" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835120" alias="18S_ArcMicro_NICE15_4" status="PUBLIC">
          <EXT_ID accession="SAMEA104176102" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835121" alias="18S_ArcMicro_NICE15_5" status="PUBLIC">
          <EXT_ID accession="SAMEA104176103" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835122" alias="18S_ArcMicro_NICE15_6" status="PUBLIC">
          <EXT_ID accession="SAMEA104176104" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835123" alias="18S_ArcMicro_NICE15_7" status="PUBLIC">
          <EXT_ID accession="SAMEA104176105" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835124" alias="18S_ArcMicro_NICE15_8" status="PUBLIC">
          <EXT_ID accession="SAMEA104176106" type="biosample"/>
     </SAMPLE>
     <SAMPLE accession="ERS1835125" alias="18S_ArcMicro_NICE15_9" status="PUBLIC">
          <EXT_ID accession="SAMEA104176107" type="biosample"/>
     </SAMPLE>
     <SUBMISSION accession="" alias="arctic_ocean_sample_updates"/>
     <MESSAGES/>
     <ACTIONS>MODIFY</ACTIONS>
</RECEIPT>
```

Note the use of the test server in the example above. More details are in <a href="prog_01.html#the-receipt-xml">module 1</a>. To run the update for real use `www.ebi.ac.uk` instead of `www-test.ebi.ac.uk` and remove the **k** flag.
