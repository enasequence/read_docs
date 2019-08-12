# Submitting A Primary Metagenome Assembly

## Introduction

Metagenome assemblies can be submitted to the European Nucleotide Archive (ENA) using the [Webin command line submission interface](../../general-guide/webin-cli.html) with `-context genome`.

Please contact datasubs@ebi.ac.uk if you intend to submit an assembly assembled from third party data.

A **primary metagenome** assembly is a metagenome assembly prior to binning from a sampled biome or collection of sampled biomes without attempt to separate taxa.

A primary metagenome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - Environmetal Sample accession or unique name (alias)
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
- Contig sequences in fasta format

The following picture illustrates the stages of the metagenome assembly submission process:

![Submission process](../../images/webin-cli_04.png)

## Stage 1: Pre-register study and environmental sample

Each submission must be associated with a pre-registered study and environmental sample. This sample should be the same sample used to submit your raw reads.

When registering an environmental sample, please make sure the appropriate environmental checklist is chosen for this and an [environmental taxon](../../faq/taxonomy.html#environmental-biome-level-taxonomy) is used (e.g. aquatic metagenome (tax id: 1169740)).

If you do not intend to submit raw reads or a primary metagenome as part of your metagenome assembly submission, please see [here](../../faq/metagenomes.html#how-do-i-submit-metagenome-assemblies-without-raw-data-or-primary-assemblies-to-point-to) for details on how to do this. If no data is associated with the environmental sample, it needs to be released manually in order to be available to the public.

The methods for submitting metagenomic studies and samples follow the same process as any other study/sample submission. Follow the links for more information.

- [Register a Study](../../study.html)
- [Register a Sample](../../samples.html)

It is strongly recommended to submit as well as reference any reads associated with the assembly being submitted.
In order to reference the reads which were used to generate the assembly, please see the `RUN_REF` tag included in the manifest file below.

- [Submit raw reads](../reads.html)

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest <filename>` option.

A primary metagenome assembly submission consists of the following files:

- 1 manifest file
- 1 fasta file

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias)
- SAMPLE: Environmental sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'primary metagenome'
- COVERAGE: The estimated depth of sequencing coverage
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform, or comma-separated list of platforms
- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap (optional)
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA' (optional)
- DESCRIPTION: Free text description of the genome assembly (optional)
- RUN_REF: Comma separated list of run accession(s) (optional)

Please see further below for validation rules affecting some of these fields.

The following file name fields are supported in the manifest file for a primary metagenome submission:

- FASTA: sequences in fasta format

For example, the following manifest file represents a primary metagenome assembly consisting of contigs provided in one fasta file:

```
STUDY   TODO
SAMPLE   TODO
ASSEMBLYNAME   TODO
ASSEMBLY_TYPE   primary metagenome
COVERAGE   TODO
PROGRAM   TODO
PLATFORM   TODO
MINGAPLENGTH   TODO
MOLECULETYPE   genomic DNA
FASTA   primary_metagenome.fasta.gz
```

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](../../general-guide/webin-cli.html).

Please refer to the [Webin command line submission interface](../../general-guide/webin-cli.html) documentation for more information about the submission process.

## Assigned accession numbers

Once the genome assembly has been submitted an analysis (ERZ) accession number is immediately assigned and returned to the submitter by the Webin command line submission interface.

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin submission service and access their data in the browser.

For primary metagenome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of sample registration.

## Validation rules

### Assembly name validation

Assembly names must:
- match the pattern: ^\[A-Za-z0-9\]\[A-Za-z0-9 _#\-\.]*$
- be shorter than 100 characters
- not include the name of the organism assembled

### Sequence validation

Sequences must:
- have unique names within an assembly
- be at least 20bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'
