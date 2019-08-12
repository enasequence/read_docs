# Submitting Metatranscriptome Assemblies

## Introduction

Metatranscriptome assemblies can be submitted to the European Nucleotide Archive (ENA) using the [Webin command line submission interface](../general-guide/webin-cli.html)  with `-context transcriptome` option.

A metatranscriptome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - **Environmetal** Sample accession or unique name (alias)
   - **Species** Sample accession or unique name (alias) *for species level assemblies*
   - Assembly program
   - Sequencing platform
- Sequences
- Functional annotation (optional)

The following picture illustrates the stages of the transcriptome assembly submission process:

![Submission process](../images/webin-cli_01.png)

## Stage 1: Pre-register study and sample

Each submission must be associated with a pre-registered study and 1 or more pre-registered
metagenomic samples.

For transcriptomic assemblies, raw reads must also be submitted to give context to the data.

The type of sample you submit depends on the level of your transcriptomic assembly. All metatranscriptomeassemblies should have an **environmental** sample registered that represents where the originalsequencing data was extracted from. This should be the same sample used for submitting raw reads.Please make sure the appropriate environmental checklist is chosen for this and an environmental taxon is used(e.g. aquatic metagenome (tax id: 1169740)).

See the available environmental taxa in the [ENA Tax Portal](https://www.ebi.ac.uk/ena/data/view/Taxon:408169).
Click on the *Tax tree* tab and click the '+' icons to expand the categories.

An additional sample may be required if you assembled your transcriptome to species level.
The sample you reference for your assembly depends on the level of taxonomy the assembly refers to.

### Unknown taxa assembly

If you are submitting a transcriptomic assembly where the taxa are still unknown, you only need to reference the **environmental** sample. This means you are not required to pre-register any further samples.

### Known taxon assembly

If the transcriptomic assembly represents an individual species from a metagenomic sample,you should register an additional sample with the MIMAGs checklist.

Please make sure these **species** samples correctly reference the original sample the data was assembled from within the checklist using the mandatory "Sample derived from" attribute. You should also reference the **environmental** sample in the description as one of the following:

"This sample represents an assembly from the metatranscriptomic sample ERSXXXXX"

OR

"This sample represents an assembly from the metatranscriptomic run ERRXXXXX"

The methods for submitting these studies follow the same process as any other study/sample/read submission. Follow the links for more information.

Instructions for interactive submitters:
- [Register a Study](../study.html)
- [Register a Sample](../samples.html)
- [Submit Read Data](../reads.html)

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest <filename>` option.

A transcriptome assembly submission consists of the following files:

- 1 manifest file
- 1 fasta file OR 1 flat file

Transcriptome assemblies should be of a high enough quality to fulfil the following criteria:

1. They must have at least 1x coverage by primary sequence at each base. Regions of a TSA record can be assembled from a single Expressed Sequence Tag (EST) or read so that coverage is only 1x.

3. Bases that are listed as 'n' should be less than 10%.

4. They should not have a stretch of more than 15 n's in a row. If they are within 20 base pairs of the c- or n-terminus they should be removed.

5. No assemblies can be shorter than 200 base pairs.

6. Any vector sequence or primers should be removed.

### Sequence names

Sequences must have a unique name within the submission that is provided in the fasta or flat files.

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias)
- SAMPLE: Sample accession or unique name (alias)
- ASSEMBLYNAME: The unique assembly name
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform, or comma-separated list of platforms
- RUN_REF: Comma separated list of run accession(s) (optional)

The following file name fields are supported in the manifest file:

- FASTA: sequences in fasta format
- FLATFILE: sequences in EMBL-Bank flat file format

For example, the following manifest file represents a genome assembly consisting of transcripts provided in one fasta file:

```
STUDY   TODO
SAMPLE  TODO
ASSEMBLYNAME    TODO
PROGRAM TODO
PLATFORM    TODO
FASTA   metatranscriptome.fasta.gz
```

### Fasta file

Unannotated sequences should be submitted as a Fasta file.

The sequence name is extracted from the fasta header. For example the following header contains the name 'contig1':

`>contig1`

### Flat file

Annotated sequences must be submitted using an EMBL-Bank flat file.

The sequence name is extracted from the AC * line and must be prefixed with a '_'.
For example the following AC * line defines name 'contig1':

`AC * _contig1`

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](../general-guide/webin-cli.html).
Please refer to the [Webin command line submission interface](../general-guide/webin-cli.html) documentation for more information about the submission process.

## Assigned accession numbers

Once the transcriptome assembly has been submitted, an analysis (ERZ) accession number is immediately assigned and returned to the submitter by the Webin command line submission interface.

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin submission service. For example, the submitter can retrieve the assigned sequence accessions from the [Webin submissions portal](../general-guide/submissions-portal.html) or from the [Webin reports service](../general-guide/reports-service.html) using the ERZ accession number.

For metatranscriptome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of study registration.
- Sequence accession(s) assigned once the metatranscriptome assembly submission has been fully
processed by ENA.

Submitters can retrieve the sequence accession numbers from the [Webin submissions portal](../general-guide/submissions-portal.html) or from the [Webin reports service](../general-guide/reports-service.html). These accession numbers are also sent to the submitters by e-mail.

## Validation rules

### Sequence validation rules

Sequences must:
- have unique names within an assembly
- be at least  200bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'
