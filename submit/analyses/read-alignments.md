# Submitting Read Alignments

## Introduction

To submit an analysis programmatically, two XML files must be generated to describe the submission.

- **Analysis XML** - used for describing the analysis you would like to submit
- **Submission XML** - tells ENA how to process this submission

These are then submitted to ENA through the secure HTTPS protocol using POST multipart/form-data 
according to RFC1867. Please see the general guide on 
[Programmatic Submission](../general-guide/programmatic) for more information.

## Step 1: Create Analysis XML

This XML is used for:

- Associating the analysis with other ENA objects
- Listing all files required for submission
- Describing metadata of the object

Here is an example of a  read alignment analysis XML:

```xml
<?xml version="1.0" encoding="US-ASCII"?>
<ANALYSIS_SET>
    <ANALYSIS alias="AD0370_C_alignment">
        <TITLE>The Anopheles gambiae 1000 Genomes Project - Phase 1 - Alignment - Crosses</TITLE>
        <DESCRIPTION>Sequence alignments from the AR3 data release from the Anopheles 1000 genomes
            project. Aligments are in bam format and are presented for each of the 80 A. gambiae
            specimens comprising parents and progeny of four crosses.</DESCRIPTION>
        <STUDY_REF accession="ERP020641"/>
        <SAMPLE_REF accession="ERS150992"/>
        <RUN_REF accession="ERR178314"/>
        <RUN_REF accession="ERR178374"/>
        <RUN_REF accession="ERR178386"/>
        <ANALYSIS_TYPE>
            <REFERENCE_ALIGNMENT>
                <ASSEMBLY>
                    <STANDARD accession="GCA_000005575.1"/>
                </ASSEMBLY>
                <SEQUENCE accession="CM000356.1"/>
            </REFERENCE_ALIGNMENT>
        </ANALYSIS_TYPE>
        <FILES>
            <FILE checksum="bafe0ed9be5c0f8515cdc4ac514d24af" checksum_method="MD5"
                filename="AD0370_C.bam" filetype="bam"/>
        </FILES>      
    </ANALYSIS>
</ANALYSIS_SET>
```

In this example, the BAM file aligns reads from three sequencing runs to the reference genome 'GCA_000005575'
and has three read group tags defined in its header that each represent one run:

```
@RG	ID:8149_4_48	PL:ILLUMINA	PU:8149_4_48	LB:AD0370_C_5557918	DS:AGPED1	SM:AD0370-C	CN:SC
@RG	ID:8177_1_48	PL:ILLUMINA	PU:8177_1_48	LB:AD0370_C_5557918	DS:AGPED1	SM:AD0370-C	CN:SC
@RG	ID:8177_2_48	PL:ILLUMINA	PU:8177_2_48	LB:AD0370_C_5557918	DS:AGPED1	SM:AD0370-C	CN:SC
```

The BAM header contains a single assembly and a reference sequence:

```
@HD	VN:1.4	GO:none	SO:coordinate
@SQ	SN:2L	LN:49364325	UR:http://www.vectorbase.org/content/anopheles-gamb
iae-pestchromosomesagamp3fagz	AS:AgamP3	M5:a4da4bafa82830c0a418c5a42138377b
	SP:Anopheles gambiae
```

### Defining the Analysis Type

The most distinguishing part of an analysis object is contained in the `<ANALYSIS_TYPE>` block.
The content of this block determines the type of data the analysis should contain and
how it will be validated by ENA after it has been submitted.

Analysis type `<REFERENCE_ALIGNMENT>` is use for submitting read alignments to ENA. For analyses of this type, 
you must reference any reference genomes or sequences used for the alignment.

```xml
<ANALYSIS_TYPE>
    <REFERENCE_ALIGNMENT>
        <ASSEMBLY>
            <STANDARD accession="GCA_000005575.1"/>
        </ASSEMBLY>
        <SEQUENCE accession="CM000356.1"/>
    </REFERENCE_ALIGNMENT>
</ANALYSIS_TYPE>
```

Please note additionally that the reads used in the alignment should also already have been submitted following
instructions in [Submit Read Data](../reads).

Read alignment analyses must be associated with a study and can be associated with
one or more samples.


### Associating with Other ENA Objects

#### Associating with the Study

An analysis points to the study it is part of using the `<STUDY_REF>` element.
This can be done either by using an accession:

```xml
<STUDY_REF accession="ERP123456"/>
```

or a name within the submitter's account:

```xml
<STUDY_REF refname="mantis_religiosa"/>
```

#### Associating with Samples

An analysis can be associated with one or more samples using the `<SAMPLE_REF>` element
either using an accession or alias to refer to the sample.

#### Associating with Experiments and Runs

An analysis can be associated with any number of experiments or runs using the `<EXPERIMENT_REF>`
and `<RUN_REF>` elements. Again, either an accession or alias can be used in the reference.

### Preparing Files For Submission

#### Upload Data Files

Please [upload](../fileprep/upload) all data files required for submission.

Once the analysis has been submitted, all the data files described in the analysis XML will be moved 
from the Webin upload area into the archive.

You can upload your data files to the root directory of your upload area or you can
create subdirectories and upload your files there.

#### Describe Data Files for Submission

You should then describe these data files in your analysis XML with the `<FILE>` element.

To descibe files required for submission, the analysis object has a `<FILES>` block. 
This submits the data files into the archive.

For example:

```xml
<FILES>
    <FILE checksum="bafe0ed9be5c0f8515cdc4ac514d24af" checksum_method="MD5"
        filename="AD0370_C.bam" filetype="bam"/>
</FILES>     
```

If the files are uploaded to the root directory
then simply enter the file name in the Analysis XML when referring to it:

```xml
<FILE filename="a.bam" ... />
```

If the files are uploaded into a subdirectory (e.g. `mantis_religiosa`) then prefix the file name
with the name of the subdirectory:

```xml
<FILE filename="mantis_religiosa/a.bam" ... />
```

### Adding Additional Metadata

All other metadata used to describe the analysis can be provided using `ANALYSIS_ATTRIBUTE` elements in
the XML:

```
    <ANALYSIS_ATTRIBUTE>
       <TAG>library preparation date</TAG>
       <VALUE>2010-08</VALUE>
    </ANALYSIS_ATTRIBUTE>
```

## Step 2: Create the Submission XML

Once you have created your analysis XML, you need an accompanying submission 
XML in a separate file to tell ENA what actions you would like to take for your submission.

```xml
<SUBMISSION>
   <ACTIONS>
      <ACTION>
         <ADD/>
      </ACTION>
   </ACTIONS>
</SUBMISSION>
```

The submission XML declares one or more Webin submission service actions. See the general guide on 
[Programmatic Submission](../general-guide/programmatic) for more information.

In this case the action is `<ADD/>` which is used to submit new objects.

The XMLs can then be submitted programmatically, using CURL on command line or
using the [Webin Portal](../general-guide/submissions-portal).

## Step 3: Submit the XMLs

### Submit the XMLs Using CURL

CURL is a Linux/Unix command line program which you can use to send the `analysis.xml` and `submission.xml`
to the Webin submission service.

```
curl -u username:password -F "SUBMISSION=@submission.xml" -F "ANALYSIS=@analysis.xml" "https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/"
```

Please provide your Webin submission account credentials using the `username` and `password`.

After running the command above a receipt XML is returned. It will look like the one below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<RECEIPT receiptDate="2017-08-11T15:07:36.746+01:00" submissionFile="sub.xml" success="true">
   <ANALYSIS accession="ERZ0151578" alias="08-1736" status="PRIVATE"/>
   <SUBMISSION accession="ERA986371" alias="08-1736"/>
   <MESSAGES>
       <INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
   </MESSAGES>
   <ACTIONS>ADD</ACTIONS>
   <ACTIONS>ADD</ACTIONS>
</RECEIPT>
```

### Submit the XMLs Using Webin Portal

XMLs can also be submitted interactively using the [Webin Portal](../general-guide/submissions-portal).
Please refer to the [Webin Portal](../general-guide/submissions-portal) document for an example how
to submit a study using XML. Other types of XMLs can be submitted using the same approach.

### The Receipt XML

To know if the submission was successful look in the first line of the `<RECEIPT>` block.

The attribute `success` will have value `true` or `false`. If the value
is false then the submission did not succeed. In this case check the rest of
the receipt for error messages and after making corrections, try the submission again.

If the success attribute is true then the submission was successful. The receipt will
contain the accession numbers of the objects that you have submitted.

### Test and Production Services

Note the message in the receipt:

```xml
<INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
```

It is advisable to first test your submissions using the Webin test service where changes are not permanent
and are erased every 24 hours.

Once you are happy with the result of the submission you can use the CURL command again
but this time using the production service. Simply change the part in the URL from `wwwdev.ebi.ac.uk` to
`www.ebi.ac.uk`:

```
curl -u username:password -F "SUBMISSION=@submission.xml" -F "ANALYSIS=@analysis.xml" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/"
```

Similarly, if you are using the [Webin Portal](../general-guide/submissions-portal) change the URL from
`wwwdev.ebi.ac.uk` to `www.ebi.ac.uk`.
