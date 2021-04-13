# Register Samples Programmatically

## The Sample Object

A sample object is submitted in XML format like this:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<SAMPLE_SET>
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

You can register one or more samples at the same time by using one `<SAMPLE></SAMPLE>` block for each sample.

The sample XML format is defined by the [SRA.sample.xsd](ftp://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.sample.xsd) XML schema.

Most of the sample information comes in the form of `<TAG>` and `<VALUE>` pairs that belong in `<SAMPLE_ATTRIBUTE>`
blocks. You can have any number of `<SAMPLE_ATTRIBUTE>` blocks in your samples.

Most submitters will want to use attributes that are recognised by ENA as these are better indexed for searching and
filtering. For this purpose, it is recommended that submitters use ENA sample checklist attributes whenever possible.
You can also use a combination of your own attributes with those recognised by ENA.

## The Sample Checklists

ENA provides sample checklists which define all the mandatory and recommended attributes for specific types of samples.
By declaring that you would like to register your samples using a specific checklist you are enabling the samples to
be validated for correctness at submission time and are making it easier for other services to find and access
the sample attribute information.

```xml
<SAMPLE_ATTRIBUTE>
<TAG>ENA-CHECKLIST</TAG>
<VALUE>ERC000014</VALUE>
</SAMPLE_ATTRIBUTE>
```

The sample with the above `SAMPLE_ATTRIBUTE` will be validated using the checklist `ERC000014`. The checklist is
defined using the `ENA-CHECKLIST` attribute.

Note that the checklist is defined using a `SAMPLE_ATTRIBUTE` block and that the checklist defines
the other `SAMPLE_ATTRIBUTE` blocks.

If you do not define a checklist then the samples will be validated against the ENA default checklist
[ERC000011](https://www.ebi.ac.uk/ena/browser/view/ERC000011). This checklist has virtually no mandatory
fields but contains many optional attributes that can help you to annotate your samples
to the highest possible standard.

You can find all the sample checklists [here](http://www.ebi.ac.uk/ena/submit/checklists). For example, the
checklist [ERC000014](https://www.ebi.ac.uk/ena/browser/view/ERC000014) represents the
GSC MIxS annotation standard for human associated source samples.

The checklists are defined using XML. These XMLs are available via the ENA Browser API. For example, the XML for
checklist ERC000014 can be retrieved using the following URL: [https://www.ebi.ac.uk/ena/browser/api/xml/ERC000014](https://www.ebi.ac.uk/ena/browser/api/xml/ERC000014)

##  The Taxonomic Classification

Note the `<SAMPLE_NAME>` block from the example above:

```xml
    <SAMPLE_NAME>
      <TAXON_ID>1284369</TAXON_ID>
      <SCIENTIFIC_NAME>stomach metagenome</SCIENTIFIC_NAME>
      <COMMON_NAME></COMMON_NAME>
    </SAMPLE_NAME>
```

You must provide the ID of the species-level taxon you wish to use (`<TAXON_ID>`).
The scientific name and common name are optional and will automatically be filled in for you.

Taxon IDs are drawn from the NCBI Taxonomy database.
If you aren't sure which taxon you need to use, or aren't sure of its taxon ID, you can learn how to find this out in
the [Tips for Sample Taxonomy](../../faq/taxonomy.html) FAQ page.

In the above example, the sample source is environmental (`stomach metagenome`) and represents an unknown variety and quantity of organisms.
Note that metagenomes use specific environmental terms.

## Create the Sample XML

Below is an example XML for submitting a sample. Change the XML by entering your own information and save it as a file, for example `sample.xml`.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<SAMPLE_SET>
  <SAMPLE alias="MT5176">
    <TITLE>human gastric microbiota, mucosal</TITLE>
    <SAMPLE_NAME>
      <TAXON_ID>1284369</TAXON_ID>
    </SAMPLE_NAME>
    <SAMPLE_ATTRIBUTES>   
      <SAMPLE_ATTRIBUTE>
        <TAG>collection date</TAG>
        <VALUE>2010</VALUE>
      </SAMPLE_ATTRIBUTE>   
  </SAMPLE>
</SAMPLE_SET>
```

## Create the Submission XML

To submit a sample or any other object(s), you need an accompanying submission XML in a separate file.
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
using the [Webin submissions portal](../general-guide/submissions-portal.html).

## Submit the XMLs using CURL

CURL is a Linux/Unix command line program which you can use to send the `sample.xml` and `submission.xml`
to the Webin submission service.

```bash
curl -u username:password -F "SUBMISSION=@submission.xml" -F "SAMPLE=@sample.xml" "https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/"
```

Please provide your Webin submission account credentials using the `username` and `password`.

After running the command above a receipt XML is returned. It will look like the one below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="receipt.xsl"?>
<RECEIPT receiptDate="2017-07-25T16:07:50.248+01:00" submissionFile="submission.xml" success="true">
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

## Submit the XMLs using Webin submissions portal

XMLs can also be submitted interactively using the [Webin submissions portal](../general-guide/submissions-portal.html).
Please refer to the [Webin submissions portal](../general-guide/submissions-portal.html) document for an example how
to submit a study using XML. Other types of XMLs can be submitted using the same approach.

## The Receipt XML

To know if the submission was successful look in the first line of the `<RECEIPT>` block.

The attribute `success` will have value `true` or `false`. If the value
is false then the submission did not succeed. In this case check the rest of
the receipt for error messages and after making corrections, try the submission again.

If the success attribute is true then the submission was successful. The receipt will
contain the accession numbers of the objects that you have submitted.

### Accession numbers in the Receipt XML

Webin will report an accession number for the sample that starts with SAMEA.

```xml
<SAMPLE accession="ERS1833148" alias="MT5176" status="PRIVATE">
    <EXT_ID accession="SAMEA104174130" type="biosample"/>
</SAMPLE>
</RECEIPT>
```

This accession number is called the BioSample accession and is typically used in journal
publications. The sample will also be assigned an alternative accession number that starts with
ERS. This accession number is called the SRA (Sequence Read Archive) sample accession.

```xml
<SAMPLE accession="ERS1833148" alias="MT5176" status="PRIVATE">
</SAMPLE>
```

## Test and production services

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
curl -u username:password -F "SUBMISSION=@submission.xml" -F "SAMPLE=@sample.xml" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/"
```

Similarly, if you are using the [Webin submissions portal](../general-guide/submissions-portal.html) change the URL from
`wwwdev.ebi.ac.uk` to `www.ebi.ac.uk`.
