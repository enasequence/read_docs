# Module 7: Metagenome Assembly Submissions 

## Introduction

Metagenome assemblies can be submitted to the European Nucleotide Archive (ENA) 
using the [Webin command line submission interface](cli_01.html) with `-context genome`
(or `-context transcriptome` for metatranscriptomic assemblies).

A metagenome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - **Environmetal** Sample accession or unique name (alias)
   - **Binned** Sample accession or unique name (alias) *for binned assemblies*
   - **MAG/SAG** Sample accession or unique name (alias) *for MAGs/SAGs*
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
- Contig sequences (if any)
- Scaffold sequences (if any and submitting MAGS/SAGs)

The following picture illustrates the stages of the metagenome assembly submission process:

![Submission process](images/webin-cli_01.png)

## Stage 1: Pre-register study and metagenomic samples

Each submission must be associated with a pre-registered study and 1 or more pre-registered metagenomic 
samples.

All metagenomic assemblies should have an **environmental** sample registered that represents where 
the original sequencing data was extracted from. If raw reads have also been submitted, this sample can 
be reused. Please make sure the appropriate environmental checklist is chosen for this and an 
environmental taxon is used (e.g. aquatic metagenome (tax id: 1169740)).

See the available environmental taxa in the [ENA Tax Portal](https://www.ebi.ac.uk/ena/data/view/Taxon:408169). 
Click on the *Tax tree* tab and click the '+' icons to expand the categories.

Any additional samples required for submission of a metagenome assembly depends on the assembly level:

- primary metagenome
- binned metagenome
- Metagenome Assembled Genome (MAG) or Single-cell Amplified Genome (SAG)

The following image illustrates the different levels of metagenomic assemblies:

![Metagenome assembly levels](images/metagenomes.png)

### Primary metagenome assembly

If you are submitting a primary assembly, you only need to reference the **environmental** sample as the taxonomy 
of the organisms within the sample are still unknown. This means you are not required to pre-register any further samples.

### Binned metagenome assembly

If you are submitting binned assemblies, you will need to submit an additional **binned** sample for each bin. This should 
be as specific in taxonomy as it can be and follow these additional [sample rules](faq_metagenomes.html).

### MAG or SAG assembly

If you are submitting MAGs/SAGs then you will need to submit an additional **MAG/SAG** sample 
for each assembly. This should be as speicific in taxonomy as it can be and use the specific 
MIMAGs checklist. When registering a SAG sample, please contact datasubs@ebi.ac.uk for assistance.

Please make sure these **MAG/SAG** samples correctly reference the original sample the data was 
extracted from within the checklist using the mandatory "Sample derived from" attribute. You should also
reference the **environmental** sample in the description as one of the following:

"This sample represents a MAG from the metagenomic sample ERSXXXXX"

OR 

"This sample represents a MAG from the metagenomic run ERRXXXXX"

If you would like to know more about why and how we use this additional information, you can find this [here](faq_metagenomes.html).

The methods for submitting these studies follow the same process as any other study/sample submission. 
Follow the links for more information.

Instructions for interactive submitters:

- [Register a Study](mod_02.html)
- [Register a Sample](mod_03.html)

Instructions for programmatic submitters:

- [Register a Study](prog_02.html)
- [Register a Sample](prog_03.html)

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest <filename>` option.

Please review Stage 1 and make sure you are familiar with the metagenome assembly levels before preparing
submission.

### Primary metagenome assembly

This assembly level is for an initial set of assembled contigs without any attempt to separate taxa.
It should be submitted associated with the **environmental** sample.

Consists of the following files:

- 1 manifest file
- 1 fasta file 

This assembly level only requires information on the sequences.

### Binned metagenome assembly

This assembly level is for a set of contigs drawn from a primary metagenome that have been grouped into a
taxonomically related set. It should be submitted associated with a **binned** sample.

Consists of the following files:

- 1 manifest file
- 1 fasta file

This assembly level only requires information on the sequences.

### MAG/SAG assembly

This assembly level is for an assembly associated with a single species level taxon generated from a
metagenomic sample/ single cell amplification sample. It should be submitted associated with a **MAG/SAG**
sample.

Consists of the following files:

- 1 manifest file
- 1 fasta file OR 1 flat file
- 0-1 AGP files

This assembly level requires information on the sequences and annotation (if any).

It also allows the submitter to provide an AGP file to give instructions for the assembly of scaffolds
from the contigs if they wish.

### Sequence names

Sequences must have a unique name within the submission that is provided in the fasta, AGP or flat
files. It is essential that the sequence names are unique and used consistently between files. 

For example, the chromosome list file must refer to the chromosome sequences using the unique sequence 
names. Similarly, an AGP file must refer to scaffolds or contigs using the unique sequence names.

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name   
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias) 
- SAMPLE: Sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'primary metagenome', 'binned metagenome', 'Metagenome-Assembled Genome (MAG)', 
'Environmetal Single-Cell Amplified Genome (SAG)'
- COVERAGE: The estimated depth of sequencing coverage
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform
- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap (optional)
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA' (optional)

Please see further below for validation rules affecting some of these fields.

The following file name fields are supported in the manifest file:

- FASTA: sequences in fasta format
- AGP: Sequences in [AGP format](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/)

For example, the following manifest file represents a metagenome assembly consisting of contigs 
provided in one fasta file:

```
STUDY   TODO
SAMPLE   TODO
ASSEMBLYNAME   TODO
ASSEMBLY_TYPE   TODO
COVERAGE   TODO
PROGRAM   TODO
PLATFORM   TODO
MINGAPLENGTH   TODO
MOLECULETYPE   genomic DNA
FASTA   metagenome.fasta.gz
``` 

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](cli_01.html). 
Please refer to the [Webin command line submission interface](cli_01.html) documentation for more 
information about the submission process.

## Assigned accession numbers

Once the genome assembly has been submitted an analysis (ERZ) accession number is immediately assigned 
and returned to the submitter by the Webin command line submission interface. 

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission 
within the Webin submission service and access their data in the browser.

For metagenome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of sample registration.
- Sequence accession(s) assigned once the assembly has been fully processed by ENA 
(**for MAGS/SAGs**).
- Genome assembly accession (GCA) assigned once the assembly has been fully processed by ENA 
(**for MAGS/SAGs**).

Submitters can retrieve the genome and sequence accession numbers from the [Webin submissions portal](prog_11.html) 
or from the [Webin reports service](prog_10.html). These accession numbers are also sent to the submitters by
e-mail.

## Validation rules

### Assembly name validation

Assembly names must:
- match the pattern: ^[A-Za-z0-9][A-Za-z0-9 _#\-\.]*$
- be shorter than 100 characters

### Sequence validation rules

Sequences must:
- have unique names within an assembly
- be at least 20bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'
