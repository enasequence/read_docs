# Module 1: Webin command line submission interface

## Introduction

The Webin command line submission interface can be used to validate, upload and submit files 
to the European Nucleotide Archive (ENA). 

Webin submission account credentials are required to use the Webin command line submission interface.

The following types of submissions are supported:

- genome assemblies
- transcriptome assemblies

The type of the submission is specified using the `-context` command line option:
- `-context='genome'` 
- `-context='transcriptome'` 

The following picture illustrates the stages of the submission process:

![Submission process](images/webin-cli_01.png)

## Stage 1: Pre-register study and sample

Each submission must be associated with a pre-registered study and a sample. The study and sample 
accessions or unique names (aliases) are provided in an `info` file associated with the submission. 

Instructions for interactive submitters:
- [Register a Study](mod_02.html)
- [Register a Sample](mod_03.html)

Instructions for programmatic submitters:
- [Register a Study](prog_01.html)
- [Register a Sample](prog_05.html)

## Stage 2: Prepare the files

The set of files that are part of the submission must be specified using a manifest file.
The manifest file is specified using the `-manifest=<filename>` option.

### Manifest file format

The manifest file in a text file (USASCII7) with two columns separated by a tab (or any whitespace characters):
- File type (first column): case insensitive file type.   
- File path (second column): the path to the file.

For example, the following manifest file represents a genome assembly consisting of an info file and a fasta file:

```
INFO    genome.info.gz
FASTA   genome.fasta.gz
``` 

### Manifest file types

The following case-insensitive file types are supported within a manifest file:

- INFO: An info file containing tab-separated key value pairs
- FASTA (genome and transcriptome assemblies): Sequences in fasta format
- FLATFILE (genome and transcriptome assemblies): Sequences in EMBL-Bank flat file format 
- AGP (genome assemblies): See [Genome Assembly Submissions](cli_02.html)
- CHROMOSOME_LIST (genome assemblies): See [Genome Assembly Submissions](cli_02.html)
- UNLOCALISED_LIST (genome assemblies): See [Genome Assembly Submissions](cli_02.html)

## Stage 3: Validate and submit the files

Validation is done using the `-validate` command line option. Validated files are 
uploaded using the `-upload` option to the submitter specific private file upload area 
in webin.ebi.ac.uk and finally submitted using the `-submit` option.

All three options can be given at the same time `-validate -upload -submit` or
individual stages can be re-run in case of any errors. 

Validated and uploaded files are organised into `<context>/<name>` directory structure where 
`<name>` is the submitter provided unique assembly name. The location of the directory structure
can be specified using the `-outputDir` option.

## Genome and transcriptome assembly accessions

Once a genome or transcriptome assembly has been submitted an analysis (ERZ) accession is
assigned and returned to the submitter. 

The ERZ accession should not be used in permanent public citations to the submission. However, ERZ
accessions can be used in Webin submission services when referring to the submission. 

Genome and transcriptome assemblies are associated with the following accessions that
can be used in citations:

- Study accession (PRJ*)
- Sample accession (SAM*)
- Genome assembly accession (GCA*)
- Sequence accession(s)

Genome assembly and sequence accession(s) are assigned only after the submission 
has been processed and archived by ENA. Submitters will receive these accession numbers by e-mail or 
they may be retrieved from the [Webin reports service](prog_10.html).

## Download the program

The latest version of the Webin command line submission interface can be downloaded from: 

https://github.com/enasequence/webin-cli/releases

The program requires Java 1.8 or a newer which can be downloaded from: 

<https://java.com/en/download/>

## Using the program

The  Webin command line submission interface is a self-executing Java jar file and is 
run using the `java` command:

`java -jar webin-cli-<version>.jar <options>` 

The `<version>` is the version number of the program. 

The command line `<options>` are explained below.

## Command line options

- `-context`: the submission type: 
    - `-context='genome'` 
    - `-context='transcriptome'` 
- `-userName`: the Webin submission account name.
- `-password`: the Webin submission account password.
- `-manifest`: the manifest file name.
- `-outputDir`: the root directory where validated files are written. 
- `-validate`: validate files. Files must be validated before they can be uploaded or submitted.
- `-upload`: upload validated files. Files must be uploaded before they can be submitted.
- `-submit`: submit uploaded files.
