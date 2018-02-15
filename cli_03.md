# Module 3: Transcriptome Assembly Submissions

## Introduction

Transcriptome assemblies can be submitted to the European Nucleotide Archive (ENA) 
using the [Webin command line submission interface](cli_01.md). 
 
A transcriptome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - Sample accession or unique name (alias)
   - Assembly program
   - Sequencing platform
- Functional annotation (optional)

## Introduction

The following picture illustrates the stages of the transcriptome assembly submission process:

---    
![Submission process](images/webin-cli_01.png)
---

## Stage 1: Pre-register study and sample

Each submission must be associated with a pre-registered study and a sample. The study and sample 
accessions or unique names (aliases) are provided in an `info` file associated with the submission. 

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest=<filename>` option.

A transcriptome assembly submission consists of the following files:

- 1 manifest file
- 1 assembly info file
- 0-1 fasta files
- 0-1 flat files

### Sequence names

Sequences must have a unique name that is provided in the fasta or flat files. 

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- File type (first column): case insensitive file type   
- File path (second column): the path to the file

For example, the following manifest file represents a transcriptome assembly consisting of an info file 
and a fasta file:

```
INFO    transcriptome.info.gz
FASTA   transcriptome.fasta.gz
``` 

The following case-insensitive file types are supported for transcriptome assemblies:

- INFO: assembly info file
- FASTA: sequences in fasta format
- FLATFILE: sequences in EMBL-Bank flat file format 

### Assembly info file

The assembly info file is a text file (USASCII7) containing general assembly information.

The file has two columns separated by a tab (or any whitespace characters):
- Field name (first column)
- Field value (second column)

The following fields must be provided:
- STUDY: Study accession or unique name (alias) 
- SAMPLE: Sample accession or unique name (alias)
- ASSEMBLYNAME: The unique assembly name.
- PROGRAM: The assembly program.
- PLATFORM: The sequencing platform.

An example of an assembly info file:

```
STUDY   TODO
SAMPLE  TODO
ASSEMBLYNAME    TODO
PROGRAM TODO
PLATFORM    TODO
```

### Fasta file

Unannotated sequences should be submitted as a Fasta file.

The sequence name is extracted from the fasta header. For example the following header 
contains the name 'contig1':

`>contig1`

### Flat file	

Annotated sequences must be submitted using an EMBL-Bank flat file.

The sequence name is extracted from the AC * line and must be prefixed with a '_'.
For example the following AC * line defines name 'contig1':

`AC * _contig1`

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](cli_01.md). 
Please refer to the [Webin command line submission interface](cli_01.md) documentation for more information 
about the submission process.

## Validation rules

### Sequence validation rules

Sequences must:
- have unique names within an assembly
- be at least  200bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'
