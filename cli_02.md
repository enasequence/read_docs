# Module 2: Genome Assembly Submissions 

## Introduction

Genome assemblies including metagenomes can be submitted to the European Nucleotide Archive (ENA) 
using the [Webin command line submission interface](cli_01.html) with `-context genome` option. 

Genome assembly submissions include plasmids, organelles, 
complete virus genomes, viral segments/replicons, bacteriophages, 
prokaryotic and eukaryotic genomes.
 
A genome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - Sample accession or unique name (alias)
   - Assembly program
   - Assembly type (optional)
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

Each submission must be associated with a pre-registered study and a sample. 

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
The manifest file is specified using the `-manifest <filename>` option.

A genome assembly submission consists of the following files:

- 1 manifest file
- 0-1 fasta files
- 0-1 AGP files
- 0-1 flat files
- 0-1 chromosome list file
- 0-1 unlocalised list file

The following files are mandatory:

- 1 manifest file must be provided.
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
- Field name (first column): case insensitive field name   
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias) 
- SAMPLE: Sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'clone or isolate' (default), 'primary metagenome', 
'binned metagenome', 'Metagenome-Assembled Genome (MAG)', 'Environmental Single-Cell Amplified Genome (SAG)'
- COVERAGE: The estimated depth of sequencing coverage
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform
- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap (optional)
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA' (optional)

Please see further below for validation rules affecting some of these fields.

The following file name fields are supported in the manifest file:

- FASTA: sequences in fasta format
- FLATFILE: sequences in EMBL-Bank flat file format
- AGP: Sequences in [AGP format](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/)
- CHROMOSOME_LIST: list of chromosomes
- UNLOCALISED_LIST: list of unlocalised sequences

For example, the following manifest file represents a genome assembly consisting of contigs 
provided in one fasta file:

```
STUDY   TODO
SAMPLE   TODO
ASSEMBLYNAME   TODO
COVERAGE   TODO
PROGRAM   TODO
PLATFORM   TODO
MINGAPLENGTH   TODO
MOLECULETYPE   genomic DNA
FASTA   genome.fasta.gz
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
from the [Webin submissions portal](prog_11.html) or from the [Webin reports service](prog_10.html) using
the ERZ accession number.

For genome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of study registration.
- Sequence accession(s) assigned once the genome assembly submission has been fully processed by ENA.
- Genome assembly accession (GCA) assigned once the genome assembly has been fully processed by ENA.

Submitters can retrieve the genome and sequence accession numbers from the [Webin submissions portal](prog_11.html) 
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

## Automatic fixes

### CDS feature

- Feature location is made 5' partial if the /codon_start is 2 or 3.
- Feature location is made 5' partial if the /translation does not start with a start codon.
- Feature location is made 3' partial if the /translation does not end with a stop codon.
- Feature location is made 3' and 5' partial if the location span is not a multiple of three.
- Feature location has 3' partiality removed if the /translation ends with a stop codon.
- Feature is made /pseudo and the /translation is removed if the /translation contains internal stop codons.	
	
	