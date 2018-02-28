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

## Stage 3: Validate, upload and submit files

Validation is done using the `-validate` command line option. Validated files are 
uploaded using the `-upload` option to the submitter specific Webin file upload area 
in webin.ebi.ac.uk and finally submitted using the `-submit` option.

The `-validate` must be completed successfully before the validated files can 
be uploaded and submitted. Please refer to the following documents for
validation rules:
- [Genome Assembly Submissions](cli_02.html)
- [Transcriptome Assembly Submissions](cli_03.html)

All three options can be given at the same time `-validate -upload -submit` or
individual stages can be re-run in case of any errors. 

Validation error reports are written into the `<outputDir>/<context>/<name>/validate` directory.

Successfully validated files are written into the `<outputDir>/<context>/<name>/upload` directory.
This directory is uploaded with the `-upload` option to the remote Webin upload area.  

Once validated files have been uploaded using the `-upload` option they must be submitted 
using the `-submit` option. The webin command line submission interface creates and submits 
XMLs on behalf of the submitter. These XMLs and the Receipt XML containing accession numbers 
are written into the `<outputDir>/<context>/<name>/submit` directory.

In above, the `<outputDir>` is specified using the `-outputDir` option, the `<context>` is
specified using the `-context` option, and the `<name>` is the submitter provided unique 
name specified in the `info` file (e.g. genome or transcriptome assembly name). 

Once the submission is complete an accession number is immediately returned to the
submitter by the Webin command line submission interface. Please refer to the following
documents for advice which long term stable accession numbers can be used in publications:
- [Genome Assembly Submissions](cli_02.html)
- [Transcriptome Assembly Submissions](cli_03.html)

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
- `-outputDir`: directory for output files. 
- `-validate`: validate files. Files must be validated before they can be uploaded or submitted.
- `-upload`: upload validated files. Files must be uploaded before they can be submitted.
- `-submit`: submit uploaded files.
- `-test`: use Webin test service instead of the production service. Please note that the
Webin upload area is shared between test and production services, and that test submission
files will not be archived.
- `-help`: detailed information about the different options.

## Output directory structure 

An output directory must be specific to the Webin command line submission interface
using the `-outputDir` option. This directory will have the following subdirectories:
- `<context>/<name>/validate`
- `<context>/<name>/upload`
- `<context>/<name>/submit`

The `<context>` is the submission type provided using the `-context` option
and the `<name>` is the unique name provided in the info file.

- The `validate` directory contains the validation reports created using the `-validate` option. 
- The `upload` directory contains validated files to be uploaded to the Webin upload area using the `-upload` option.
- The `submit` directory contains the XMLs created by the `-submit` option including submitted Analysis XML
and Receipt XML.

## Validation reports

If the `-validate` action fails for any reason then validation reports are written into directory: 

`<context>/<name>/validate`

The validation reports correspond to the input files with an added suffix `.report`. 

For example, a validated file `assembly.info` will have a corresponding validation report 
`assembly.info.report`, and a validated fasta file `assembly.fasta`  will have a corresponding validation 
report `assembly.fasta.report`.
