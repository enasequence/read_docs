# Submitting Environmental Single-Cell Amplified Genomes

## Introduction

Environmental SAG assemblies can be submitted to the European Nucleotide Archive (ENA) using the [Webin command line submission interface](../general-guide/webin-cli.html) with `-context genome`.

Please contact datasubs@ebi.ac.uk if you intend to submit an assembly assembled from third party data.

Please see [here](../faq/metagenomes.html#how-do-i-submit-uncultured-virus-genomes-uvigs) if you intend to submit uncultured virus genomes derived from a single-cell amplification study.

**Please note** : Submissions of Environmental Single-Cell Amplified Genomes follow different rules to standard isolate assemblies as they are considered derived assemblies.

When it comes to submission of derived assemblies you will be asked to register additional 'virtual' samples for each assembly (a **SAG** sample).

![derived assembly](../images/metadata_model_derivedanalysis.png)

This is because a SAG is not an assembly of the whole set of raw data but in fact an assembly derived from a smaller subset of those data. These virtual samples represents the subset of that data and hold all metadata related to the taxonomy of that subset as well as methods used to derive it.

Each SAG from an environmental source requires a virtual derived **SAG** sample so please follow instructions carefully.

A SAG assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - **Environmental** Sample accession or unique name (alias)
   - **SAG** Sample accession or unique name (alias)
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
- Contig sequences (if any)
- Scaffold sequences (if any)
- Chromosome sequences (if any)

The following picture illustrates the stages of the Environmental Single-Cell Amplified Genome assembly submission process:

![Submission process](../images/webin-cli_04.png)

## Stage 1: Pre-register study and samples

Each assembly submission must be associated with a pre-registered study and a **SAG** sample  which  represents  the single cell that was amplified. This then points back to an additional **environmental** sample that represents the sampled source biome.

### Environmental sample registration

Firstly, you should register your **environmental** samples. For each real-life environmental sample that was used in the study, a sample should be registered using the most relevant environmental checklist and environmental taxonomy (e.g. aquatic metagenome (tax id: 1169740)).

For information about biome-level environmental taxonomy please see [here](../faq/taxonomy.html#environmental-biome-level-taxonomy).

When submitting the raw reads in a Single-Cell Amplification study, these should remain multiplexed in BAM format and be submitted to this environmental sample.

If you can not submit your raw reads, please follow these [additional guidelines](../faq/metagenomes.html#how-do-i-submit-metagenome-assemblies-without-raw-data-or-primary-assemblies-to-point-to).

### SAG sample registration

Once all the **environmental** samples have been registered, you should register your **SAG** samples. For each resulting Single-Cell Amplified Genome assembly, a sample should be registered utilising the **GSC MISAGS** checklist and uncultured taxonomy (e.g. uncultured Bacillus sp. (tax id: 83428)).

For information about organism-level environmental taxonomy please see [here](../faq/taxonomy.html#environmental-organism-level-taxonomy).

When registering **SAG** samples, please make sure they correctly reference the **environmental** sample that they were derived from. This can be done from within the checklist using the mandatory “sample derived from” attribute. You should also reference the **environmental** sample in the description as:

“This sample represents a Single-Cell Amplified Genome derived from the environmental sample ERSXXXXX”

If the assembly was derived from multiple samples you can list these with a comma separated list or range. See [here](../faq/metagenomes.html#how-do-i-register-samples-for-co-assemblies) for details on how to format these in the "sample derived from" attribute.

The methods for submitting environmental studies and samples follow the same process as any other study/sample submission. Follow the links for more information.

- [Register a Study](../study.html)
- [Register a Sample](../samples.html)

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

You will receive an error if less than 2 sequences are submitted. If you have less than 2 sequences, then you  will need to submit at chromosome level.

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

For this assembly level in particular, it is important to understand how sequence names are formatted so they can be consistent between files otherwise the system will register your submission at contig level.

### Sequence names

Sequences must have a unique name within the submission that is provided in the fasta, AGP or flat files. It is essential that the sequence names are unique and used consistently between files.

For example, the chromosome list file must refer to the chromosome sequences using the unique sequence names. Similarly, an AGP file must refer to scaffolds or contigs using the unique sequence names.

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias)
- SAMPLE: **SAG** Sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'Environmental Single-Cell Amplified Genome (SAG)'
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

For example, the following manifest file represents an environmental single-cell assembly consisting of contigs provided in one fasta file:

```
STUDY   TODO
SAMPLE   TODO
ASSEMBLYNAME   TODO
ASSEMBLY_TYPE   Environmental Single-Cell Amplified Genome (SAG)
COVERAGE   TODO
PROGRAM   TODO
PLATFORM   TODO
MINGAPLENGTH   TODO
MOLECULETYPE   genomic DNA
FASTA   single-cell_genome.fasta.gz
```

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](../general-guide/webin-cli.html).

Please refer to the [Webin command line submission interface](../general-guide/webin-cli.html) documentation for more information about the submission process.


## Assigned accession numbers

Once the genome assembly has been submitted an analysis (ERZ) accession number is immediately assigned and returned to the submitter by the Webin command line submission interface.

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin submission service, this accession remains private.

For Environmental Single-cell Amplified Genome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of sample registration.
- Sequence accession(s) assigned once the assembly has been fully processed by ENA.
- Genome assembly accession (GCA) assigned once the assembly has been fully processed by ENA.

Submitters can retrieve the genome and sequence accession numbers from the [Webin submissions portal](../general-guide/submissions-portal.html) or from the [Webin reports service](../general-guide/reports-service.html). These accession numbers are also sent to the submitters by e-mail.

## Validation rules

### Assembly name validation

Assembly names must:
- match the pattern: ^\[A-Za-z0-9\]\[A-Za-z0-9 _#\-\.]*$
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

This will be done at the discretion of the curation team when provided with valid reasoning, and can be requested with an email to datasubs@ebi.ac.uk.
