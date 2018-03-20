# Module 2: Genome Assembly Submissions 

## Introduction

Genome assemblies including metagenomes can be submitted to the European Nucleotide Archive (ENA) 
using the [Webin command line submission interface](cli_01.html). 

Genome assembly submissions include plasmids, organelles, 
complete virus genomes, viral segments/replicons, bacteriophages, 
prokaryotic and eukaryotic genomes.
 
A genome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - Sample accession or unique name (alias)
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
- Contig sequences (if any)
- Scaffold sequences (if any)
- Chromosome sequences (if any)
- Unlocalised sequences (if any)
- Functional annotation (optional)

Chromosomes include organelles (e.g. mitochondrion and chloroplast), plasmids and viral segments.

The following picture illustrates the stages of the genome assembly submission process:

![Submission process](images/webin-cli_01.png)

## Stage 1: Pre-register study and sample

Each submission must be associated with a pre-registered study and a sample. The study and sample 
accessions or unique names (aliases) are provided in an `info` file associated with the submission. 

Genome assemblies except metagenomes are uniquely identified by a study and a sample. When assemblies
are updated they must be re-submitted with the same study and sample as in the original submission.

Instructions for interactive submitters:
- [Register a Study](mod_02.html)
- [Register a Sample](mod_03.html)

Instructions for programmatic submitters:
- [Register a Study](prog_02.html)
- [Register a Sample](prog_03.html)

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest=<filename>` option.

A genome assembly submission consists of the following files:

- 1 manifest file
- 1 assembly info file
- 0-1 fasta files
- 0-1 AGP files
- 0-1 flat files
- 0-1 chromosome list file
- 0-1 unlocalised list file

The following files are mandatory:

- 1 manifest file must be provided.
- 1 assembly info file must be provided.
- 1 fasta or 1 flat file must be provided.
- If there are AGP sequences then 1 AGP file must be provided.
- If there are chromosomes then 1 chromosome list file must be provided.
- If there are unlocalised sequences then 1 unlocalised list file must be provided. 

### Sequence names

Sequences must have a unique name within the submission that is provided in the fasta, AGP or flat files. 
It is essential that the sequence names are unique and used consistently between files. 

For example, the chromosome list file must refer to the chromosome sequences using the unique sequence names. 
Similarly, an AGP file must refer to scaffolds or contigs using the unique sequence names.

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- File type (first column): case insensitive file type   
- File path (second column): the path to the file

For example, the following manifest file represents a genome assembly consisting of an info file 
and a fasta file:

```
INFO    genome.info.gz
FASTA   genome.fasta.gz
``` 

The following case-insensitive file types are supported for genome assemblies:

- INFO: assembly info file
- FASTA: sequences in fasta format
- FLATFILE: sequences in EMBL-Bank flat file format
- AGP: Sequences in [AGP](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/) format
- CHROMOSOME_LIST: list of chromosomes
- UNLOCALISED_LIST: list of unlocalised sequences

### Assembly info file

The assembly info file is a text file (USASCII7) containing general assembly information.

The file has two columns  separated by a tab (or any whitespace characters):
- Field name (first column)
- Field value (second column)

The following fields must be provided:
- STUDY: Study accession or unique name (alias) 
- SAMPLE: Sample accession or unique name (alias)
- ASSEMBLYNAME: The unique assembly name.
- COVERAGE: The estimated sequencing depth of coverage
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform

The following fields can be optionally provided:

- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap.
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA'.

Please see further below for validation rules affecting some of these fields.

An example of an assembly info file:

```
STUDY   TODO
SAMPLE   TODO
ASSEMBLYNAME   TODO
COVERAGE   TODO
PROGRAM   TODO
PLATFORM   TODO
MINGAPLENGTH   TODO
MOLECULETYPE   genomic DNA
```

### Other files

Other genome assembly data files are described in [Genome Assembly Data Formats](format_02.html). 

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](cli_01.html). 
Please refer to the [Webin command line submission interface](cli_01.html) documentation for more information 
about the submission process.

## Assigned accession numbers

Once the genome assembly has been submitted a analysis (ERZ) accession number is immediately assigned and returned to the 
submitter by the Webin command line submission interface. 

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the 
Webin submission service. For example, the submitter can retrieve the assigned genome assembly and sequence accessions 
from the [Webin XML and reports portal](prog_11.html) or from the [Webin reports service](prog_10.html) using
the ERZ accession number.

For genome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of study registration.
- Sequence accession(s) assigned once the genome assembly submission has been fully processed by ENA.
- Genome assembly accession (GCA) assigned once the genome assembly has been fully processed by ENA.

Submitters can retrieve the genome and sequence accession numbers from the [Webin XML and reports portal](prog_11.html) 
or from the [Webin reports service](prog_10.html). These accession numbers are also send to the submitters by
e-mail.

## Validation rules

### Sample and study validation

- Sample and study (BioProject) pair must be unique for an assembly (except metagenomes).
- Sample taxonomic classification must be species level or below (or equivalent) within the NCBI taxonomy.

### Assembly name validation

Assembly names must:
- match the pattern: ^[A-Za-z0-9][A-Za-z0-9 _#\-\.]*$
- be shorter than 100 characters
           
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

### Sequence validation rules

Sequences must:
- have unique names within an assembly
- be at least 20bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'

### Assembly updates

Assembly updates must:
- use the same sample and study pair as was used in the initial assembly submission
- not remove any chromosomes
