# Module 1: ENA validator

## Introduction

The ENA validator is a command line program used to validate, upload and submit files 
to the European Nucleotide Archive (ENA).

The following types of submissions are currently supported:

- genome assemblies
- transcriptome assemblies

Validated files are organised into `<context>/<name>` directory structure where `<name>` is a 
submitter provided unique assembly name.

Validation is done using the `-validate` option. Validated files can be uploaded and submitted
using the `-upload` and `-submit` options. It is possible to specify all three options at the same
time (`-validate -upload -submit`) or re-run any of the individual stages in case of any errors. 

Please note that Webin submission account credentials are required to use the ENA validator.

### Genome and transcriptome assembly accessions

Once a genome or transcriptome assembly has been submitted successfully an 
analysis (ERZ) accession is assigned. 

An ERZ accession can be used in ENA's submission services but should not be used as part of a permanent public 
citation to the data.

Genome and transcriptome assemblies can be cited using:

- INSDC BioProject (Study) accession (PRJ*)
- BioSample accession (SAM*)
- INSDC genome assembly accession (GCA*) *1
- INSDC sequence accession(s) *1

Accessions other than ERZ are assigned after the submission has been accepted and archived by ENA.
Submitters will receive them by e-mail or they can be retrieved from the [Webin reports service](prog_10.md).

## Download the validator

The latest version of the ENA validator can be downloaded from: 

<https://TODO>

The program requires Java 1.8 or a newer which can be downloaded from: 

<https://java.com/en/download/>

## Using the validator

The ENA validator is a self-executing Java jar file and is run using the `java` command:

`java -jar validator-CLI-<version>.jar <options>` 

The `<version>` is the version of the validator and `<options>` are the command line options
explained below.

## Command line options

- `-context`: the submission type: 
    - `-context='genome'` 
    - `-context='transcriptome'` 
- `-userName`: the Webin submission account name.
- `-password`: the Webin submission account password.
- `-outputDir`: the root directory where validated files are written. 
- `-validate`: validates files. Files must be validated before they can be uploaded or submitted.
- `-upload`: upload validated files. Files must be uploaded before they can be submitted.
- `-submit`: submit uploaded files.
- `-manifest`: TODO
