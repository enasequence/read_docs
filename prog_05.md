# Module 5: Submitting Sample objects

<!-- ERP013173,ERS979764 -->
<!--mention how to find tax ids and link to an FAQ of environmental tax ids-->

As with most modules in this programmatic series, this one draws on the basic principles laid out in the first module: <a href="./prog_01.html">Create a Study</a>. It is recommended that you work through the study module first. When you can create a study object in the ENA, so too will you be able to create sample objects by the same means. 

## What does the XML file look like?

The sample below is from an actual project released in 2016. Its title is *Different gastric microbiota compositions in two human populations with high and low gastric cancer risk in Colombia*. 

Here is one of the samples

```xml
<?xml version="1.0" encoding="US-ASCII"?>
<SAMPLE_SET xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:noNamespaceSchemaLocation="ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.sample.xsd">
  <SAMPLE alias="MT5176" center_name="">
    <TITLE>human gastric microbiota, mucosal</TITLE>
    <SAMPLE_NAME>
      <TAXON_ID>1284369</TAXON_ID>
      <SCIENTIFIC_NAME>stomach metagenome</SCIENTIFIC_NAME>
      <COMMON_NAME></COMMON_NAME>
    </SAMPLE_NAME>
    <SAMPLE_ATTRIBUTES>
      <SAMPLE_ATTRIBUTE>
	<TAG>investigation type</TAG>
	<VALUE>mimarks-survey</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>project name</TAG>
	<VALUE>Different gastric microbiota compositions in two human populations with high and low gastric cancer risk in Colombia</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>sequencing method</TAG>
	<VALUE>pyrosequencing</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>collection date</TAG>
	<VALUE>2010</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>host body site</TAG>
	<VALUE>Mucosa of stomach</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>human-associated environmental package</TAG>
	<VALUE>human-associated</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>geographic location (latitude)</TAG>
	<VALUE>1.81</VALUE>
	<UNITS>DD</UNITS>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>geographic location (longitude)</TAG>
	<VALUE>-78.76</VALUE>
	<UNITS>DD</UNITS>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>geographic location (country and/or sea)</TAG>
	<VALUE>Colombia</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>geographic location (region and locality)</TAG>
	<VALUE>Tumaco</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>environment (biome)</TAG>
	<VALUE>coast</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>environment (feature)</TAG>
	<VALUE>human-associated habitat</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>environment (material)</TAG>
	<VALUE>gastric biopsy</VALUE>
      </SAMPLE_ATTRIBUTE>
      <SAMPLE_ATTRIBUTE>
	<TAG>ENA-CHECKLIST</TAG>
	<VALUE>ERC000014</VALUE>
      </SAMPLE_ATTRIBUTE>
    </SAMPLE_ATTRIBUTES>
  </SAMPLE>
</SAMPLE_SET>
```

A sample is ultimately connected to raw read data and can also be connected to an assembly and various types of interpreted data. It provides most of the context and value to the data that it is connected to and it is representing the source material that has been sequenced. Note that most of the added value comes in the form of <TAG> and <VALUE> pairs that belong in <SAMPLE_ATTRIBUTE> blocks. These blocks are not restricted so you can add as many as you like and you can define them however you like. Most submitters will want to apply attributes that are recognised by ENA and that are indexed for searching and filtering as this will increase the search-ability and value of your sample even further. You can also use a combination of your own attributes with those recognised by ENA.
 
## Apply an ENA minimum information standard checklist to your samples

ENA offer sample 'checklists' which define all the mandatory and recommended attributes for specific types of samples. By declaring that you would like to register your sample under a specific checklist you are enabling the sample to be validated for correctness at submission time and you will also benefit from additional exposure of that sample to various services downstream of ENA that are interested in using ENA data that has been annotated to those minimum standards represented by the ENA checklists.

The sample above is using and will be validated against ENA checklist `ERC000014`. Note that the checklist itself is declared using a SAMPLE_ATTRIBUTE block. The rest of the SAMPLE_ATTRIBUTE blocks are defined by that checklist. You can omit a checklist reference if you do not want your samples to be confined to the minimum annotation standards of one of ENA's checklists. We advise against this and you can always add more of your own attributes which will not be subject to strict validation.

Find all the sample checklists [here](http://www.ebi.ac.uk/ena/submit/checklists). You can see that the sample in the example above is using checklist `ERC000014` which corresponds to the [GSC MIxS annotation standard for human associated source samples](http://www.ebi.ac.uk/ena/data/view/ERC000014). Use these webpages in the ENA to know what attributes are required by each checklist and what controlled vocabularies and regular expressions and units are expected in each case. You may want to access the XML version of the checklist if you want to write a script to validate your own samples before you submit them. XML version of the checklist is available by appending *&display=xml* to the URL for the specific checklist:
[http://www.ebi.ac.uk/ena/data/view/ERC000014&display=xml](http://www.ebi.ac.uk/ena/data/view/ERC000014&display=xml)

If there is not a suitable checklist that describes your type of source samples you can use [ENA default checklist](the http://www.ebi.ac.uk/ena/data/view/ERC000011). This checklist has virtually no mandatory fields but does include a lot of optional attributes that you can review to help annotate your sample to the highest standard that is possible. A well annotated sample will eventually lead to maximum exposure and use-ability of your data.

## Submitting many samples simultaneously

The main attraction for using the REST API to submit samples (and other objects) is that you do not need to interact with a manual web interface and that you can submit many objects in bulk at the same time. The example contains one sample block <SAMPLE></SAMPLE> inside one sample_set block <SAMPLE_SET></SAMPLE_SET>. Your submission is more likely to have multiple samples in one sample_set. Make sure you highlight how the samples are different from each other if it is not already clear from some of the attribute values. Merely naming them 1 to 4 will not help your users to do any comparative analysis!

```xml
<?xml version="1.0" encoding="US-ASCII"?>
<SAMPLE_SET>
    <SAMPLE alias="1" center_name="">
        <TITLE>first human gastric microbiota sample</TITLE>
        <SAMPLE_NAME>
            <TAXON_ID>1284369</TAXON_ID>
        </SAMPLE_NAME>
    </SAMPLE>
    <SAMPLE alias="2" center_name="">
        <TITLE>second human gastric microbiota sample</TITLE>
        <SAMPLE_NAME>
            <TAXON_ID>1284369</TAXON_ID>
        </SAMPLE_NAME>
    </SAMPLE>
    <SAMPLE alias="3" center_name="">
        <TITLE>third human gastric microbiota sample</TITLE>
        <SAMPLE_NAME>
            <TAXON_ID>1284369</TAXON_ID>
        </SAMPLE_NAME>
    </SAMPLE>
    <SAMPLE alias="4" center_name="">
        <TITLE>fourth human gastric microbiota sample</TITLE>
        <SAMPLE_NAME>
            <TAXON_ID>1284369</TAXON_ID>
        </SAMPLE_NAME>
    </SAMPLE>
</SAMPLE_SET>

```

## Two more points about the sample XML file

### XML Schema

Note the first 2 lines in the first <a href="#what-does-the-xml-file-look-like">example</a> above.

```xml
<SAMPLE_SET xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:noNamespaceSchemaLocation="ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.sample.xsd">
```

This part points your XML editor (if you are using one) to a schema so that it can validate as you type. This is the schema for the sample XML which is not the same as the checklist validation system. This schema defines the order of the blocks and the controlled terms that may be available in some cases. It is more of a structural check and unfortunately many ENA rules are not embedded into this first level schema so it can not guarantee that the submission will be successful. However it will help you to compile properly written sample XML files. 

### Taxonomic classification

Note the sample_name block from the <a href="#what-does-the-xml-file-look-like">example</a> above

```xml
    <SAMPLE_NAME>
      <TAXON_ID>1284369</TAXON_ID>
      <SCIENTIFIC_NAME>stomach metagenome</SCIENTIFIC_NAME>
      <COMMON_NAME></COMMON_NAME>
    </SAMPLE_NAME>
```

Taxon, scientific name and common name are ways of classifying the organism of the sample. Except in this case the source sample is environmental and represents an unknown variety and quantity of organisms. Because every sample still needs a taxonomic classification we have specific environmental terms in our taxonomy database typically used for metagenomic studies. More about these <a href="tax.html#environmental-taxonomic-classifications">here</a>.

Taxon, scientific name and common name are referencing the same node in our taxonomic database so you do not need to include all 3. Including the unique taxon_id is sufficient and the other fields will be added automatically after the sample is submitted and archived. To find the correct taxonomic information for your organism including taxon_id and scientific_name see <a href="tax.html">here</a>.

## Submitting the XML files

The procedure for submitting XML files is outlined in <a href="prog_01.html#send-the-xml-files-to-ena">module 1</a>. Module 1 describes submitting a study object but the process for sample submission is the same. The submission XML file should look something like this (assuming the samples are in another XML called "samp.xml". Also remember to apply the correct centre name for your Webin account. The alias can be any unique string.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<SUBMISSION alias="MT5176_submission" center_name="">
   <ACTIONS>
      <ACTION>
         <ADD source="samp.xml" schema="sample"/>
      </ACTION>
   </ACTIONS>
</SUBMISSION>

```

Assuming that the above submission XML is saved in a file called "sub.xml" a cURL statement to send the XMLs to the ENA REST **TEST** server will look like this:

```bash
curl -k -F "SUBMISSION=@sub.xml" -F "SAMPLE=@samp.xml" "https://www-test.ebi.ac.uk/ena/submit/drop-box/submit/?auth=ENA%20Webin-NNN%20PASSWORD" 
```

The cURL command will return a receipt in XML formatting containing the accession numbers, or if accession numbers were not administered because there was a problem/error then you will get a list of errors to work through before trying again.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="receipt.xsl"?>
<RECEIPT receiptDate="2017-07-25T16:07:50.248+01:00" submissionFile="sub.xml" success="true">
    <SAMPLE accession="ERS1833148" alias="MT5176" status="PRIVATE">
        <EXT_ID accession="SAMEA104174130" type="biosample"/>
    </SAMPLE>
    <SUBMISSION accession="ERA979927" alias="MT5176_submission"/>
    <MESSAGES>
        <INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
    </MESSAGES>
    <ACTIONS>ADD</ACTIONS>
</RECEIPT>
```

The receipt can be quite large so you may prefer to redirect the cURL output to a file, for example "receipt.xml".
