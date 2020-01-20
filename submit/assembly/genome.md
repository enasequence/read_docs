# Submitting Isolate Genome Assemblies

## Introduction

Genome assemblies can be submitted to the European Nucleotide Archive (ENA)
using the [Webin command line submission interface](../general-guide/webin-cli.html) with `-context genome` option.

Please contact our [helpdesk](https://www.ebi.ac.uk/ena/browser/support) if you intend to submit an assembly assembled from third party data.

Genome assembly submissions include plasmids, organelles, complete virus genomes, viral segments/replicons, bacteriophages, prokaryotic and eukaryotic genomes.

A genome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - Sample accession or unique name (alias)
   - Assembly name
   - Assembly type
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
   - Free text description of the genome assembly (optional)
- Contig sequences (if any)
- Scaffold sequences (if any)
- Chromosome sequences (if any)
- Unlocalised sequences (if any)
- Functional annotation (optional)

Chromosomes include organelles (e.g. mitochondrion and chloroplast), plasmids and viral segments.

The following picture illustrates the stages of the genome assembly submission process:

![Submission process](../images/webin-cli_01.png)

## Stage 1: Pre-register study and sample

Each submission must be associated with a pre-registered study and a sample.

Genome assemblies except metagenomes are uniquely associated with a study and a sample.
When assemblies are updated they must be re-submitted with the same study and sample as in the original submission.

- [Register a Study](../study.html)

- [Register a Sample](../samples.html)

It is also strongly recommended to submit as well as reference any reads associated with the assembly being submitted.
In order to reference the reads which were used to generate the assembly, please see the `RUN_REF` tag included in the manifest file below.

- [Submit raw reads](../reads.html)


### Register locus tag prefixes

This is *only required if you are submitting an annotated assembly*. Otherwise, please progress to Stage 2.

See [here](https://www.ebi.ac.uk/ena/submit/locus-tags) for information on locus tags.

To register locus tag prefixes, you must register these with the study.

locus tag prefixes must:

- Start with a letter
- Be at least 3 characters long
- Be upper case
- Contain only alpha-numeric characters and no symbols such as -_*

You will need to wait 24 hours before proceeding further in the submission process to ensure these prefixes have been registered.

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest <filename>` option.

The files required for submission of a genome assembly depends on the assembly level:

- Contig
- Scaffold
- Chromosome

### Contig assembly

Consists of the following files:

- 1 manifest file
- 1 fasta file OR 1 flat file

This assembly level only requires information on the sequences and annotation (if any).

You will receive an error if less than 2 sequences are submitted. If you have less than 2 sequences, then you  will need to submit at a higher assembly level or as [template sequences](../sequence/webin-cli-flatfile.html).

### Scaffold assembly

Consists of the following files:

- 1 manifest file
- 1 fasta file OR 1 flat file
- 1 AGP file

This assembly level requires information on the sequences and annotation (if any).

It also allows the submitter to provide an AGP file to give instructions for the assembly of the scaffolds from the contigs.

### Chromosome assembly

Consists of the following files:

- 1 manifest file
- 1 fasta file OR 1 flat file
- 1 chromosome list file
- 0-1 unlocalised list files
- 0-1 AGP files

This assembly level allows the submission of fully assembled chromosomes (including organelles, plasmids, and viral segments). This requires information on the sequences and annotation (if any) and submission of a chromosome list file to indicate which sequences represent which ‘chromosomes’.

If these chromosomes contain unlocalised sequences (where the chromosome of the sequence is known but not the exact location) you can submit an additional unlocalised list file. However, please note, if you wish to submit unplaced contigs, you will have to submit at a lower level and use an AGP file to indicate which scaffolds/contigs are
assembled to form each chromosome. Any sequences that are not used to assemble chromosomes
are considered unplaced.

For this assembly level in particular, it is important to understand how sequence names are formatted so they can be consistent between files otherwise the system will just register your submission at contig level.

### Sequence names

Sequences must have a unique name within the submission that is provided in the fasta, AGP or flat files. It is essential that the sequence names are unique and used consistently between files.

For example, the chromosome list file must refer to the chromosome sequences using the unique sequence names. Similarly, an AGP file must refer to scaffolds or contigs using the unique sequence names.

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias)
- SAMPLE: Sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'clone or isolate'
- COVERAGE: The estimated depth of sequencing coverage
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform, or comma-separated list of platforms
- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap (optional)
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA' (optional)
- DESCRIPTION: Free text description of the genome assembly (optional)
- RUN_REF: Comma separated list of run accession(s) (optional)

Please see further below for validation rules affecting some of these fields.

The following file name fields are supported in the manifest file:

- FASTA: sequences in fasta format
- FLATFILE: sequences in EMBL-Bank flat file format
- AGP: Sequences in [AGP format](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/)
- CHROMOSOME_LIST: list of chromosomes
- UNLOCALISED_LIST: list of unlocalised sequences

For example, the following manifest file represents a genome assembly consisting of contigs provided in one fasta file:

```
STUDY   TODO
SAMPLE   TODO
ASSEMBLYNAME   TODO
ASSEMBLY_TYPE clone or isolate
COVERAGE   TODO
PROGRAM   TODO
PLATFORM   TODO
MINGAPLENGTH   TODO
MOLECULETYPE   genomic DNA
FASTA   genome.fasta.gz
```

### Other files

Other genome assembly data files are described in [Genome Assembly Data Formats](../fileprep/assembly.html).

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](../general-guide/webin-cli.html).
Please refer to the [Webin command line submission interface](../general-guide/webin-cli.html) documentation for more information about the submission process.

## Assigned accession numbers

Once the genome assembly has been submitted an analysis (ERZ) accession number is immediately assigned and returned to the submitter by the Webin command line submission interface.

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin submission service. For example, the submitter can retrieve the assigned genome assembly and sequence accessions from the [Webin submissions portal](../general-guide/submissions-portal.html) or from the [Webin reports service](general-guide/reports-service.html) using the ERZ accession number.

For genome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of study registration.
- Sequence accession(s) assigned once the genome assembly submission has been fully processed by ENA.
- Genome assembly accession (GCA) assigned once the genome assembly has been fully processed by ENA.

Submitters can retrieve the genome and sequence accession numbers from the [Webin submissions portal](../general-guide/submissions-portal.html) or from the [Webin reports service](../general-guide/reports-service.html).
These accession numbers are also sent to the submitters by e-mail.

## Validation rules

### Sample and study validation

- Sample and study (BioProject) pair must be unique for an assembly (except metagenomes).
- Sample taxonomic classification must be species level or below (or equivalent) within NCBI taxonomy.

### Assembly name validation

Assembly names must:
- match the pattern: ^[A-Za-z0-9][A-Za-z0-9 _#\-\.]*$
- be shorter than 100 characters
- not include the name of the organism assembled

### Chromosome name validation

Chromosome names must:
- match the pattern: ^\[A-Za-z0-9\]\[A-Za-z0-9_#\-\.]*$
- be shorter than 33 characters
- not contain any of the following as part of their name (case insensitive):
    - 'chr'
    - 'chrm'
    - 'chrom'
    - 'chromosome'
    - 'linkage group'
    - 'linkage-group'
    - 'linkage_group'
    - 'plasmid'
- be unique within an assembly

### Sequence validation

Sequences must:
- have unique names within an assembly
- be at least 20bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'

### Sequence count validation

Typically, assembly submissions consisting of sequences that exceed the standard minimum or maximum number are not permitted. However, in specific cases, ENA may allow the submission of genome assemblies that are giving the following errors:

Since Webin 1.7.0:
- Invalid number of sequences : XXX, Minimum number of sequences for CONTIG is: YYY
- Invalid number of sequences : XXX, Minimum number of sequences for SCAFFOLD is: YYY
- Invalid number of sequences : XXX, Minimum number of sequences for CHROMOSOME is: YYY
- Invalid number of sequences : XXX, Maximum number of sequences for CONTIG is: YYY
- Invalid number of sequences : XXX, Maximum number of sequences for SCAFFOLD is: YYY
- Invalid number of sequences : XXX, Maximum number of sequences for CHROMOSOME is: YYY

This will be done at the discretion of the curation team when provided with valid reasoning, and can be requested through our [helpdesk](https://www.ebi.ac.uk/ena/browser/support).

### Assembly updates

Assembly updates must:
- use the same sample and study pair as was used in the initial assembly submission
- not remove any chromosomes

## Automatic fixes

### CDS feature

- Feature location is made 5' partial if the /codon_start is 2 or 3.
- Feature location is made 5' partial if the /translation does not start with a start codon.
- Feature location is made 3' partial if the /translation does not end with a stop codon.
- Feature location is made 3' and 5' partial if the location span is not a multiple of three.
- Feature location has 3' partiality removed if the /translation ends with a stop codon.
- Feature is made /pseudo and the /translation is removed if the /translation contains internal stop codons.
