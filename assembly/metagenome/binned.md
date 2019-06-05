# Submitting Binned Metagenome Assemblies 

## Introduction

Metagenome assemblies can be submitted to the European Nucleotide Archive (ENA) using the [Webin command line submission interface](../../general-guide/webin-cli.html) with `-context genome`.

Please contact datasubs@ebi.ac.uk if you intend to submit an assembly assembled from third party data.

A **binned metagenome** assembly submission encompasses anything from a set of contigs to a complete genome assembly from a metagenomic source that has been identified as a single-taxon set.

There is no limit to the number of bins that can be submitted as part of a metagenomic study as it is recognised that the number of bins produced can be upwards of 100 000. Please submit all derived bins at this assembly level and not as Metagenome-Assembled Genomes unless they meet the required criteria.

A binned metagenome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - **Environmetal** Sample accession or unique name (alias)
   - **Binned** Sample accession or unique name (alias)
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
- Contig sequences (if any)
- Scaffold sequences (if any and submitting MAGs)
- Chromosome sequences (if any and submitting MAGs)

The following picture illustrates the stages of the metagenome assembly submission process:

![Submission process](../../images/webin-cli_04.png)

## Stage 1: Pre-register study and metagenomic samples

Each submission must be associated with a pre-registered study and two pre-registered metagenomic samples, an **environmental** sample that represents the real biomaterial that was sequenced and a **binned** sample that virtually represents the taxon derived from the environment that was assembled.

It is recommended to submit all lower level metagenomic assemblies and raw reads before submitting your binned metagenomes to help record your methods and make your data reproducible.

- [Submitting Raw Reads](../../reads.html)
- [Submitting A Primary Metagenome Assembly](primary.html)

### Environmental Sample

The **environmental** sample should be the same sample used to submit your raw reads and primary metagenomes.

If you have not yet registered an environmental sample, please make sure the appropriate environmental checklist is chosen for this and an [environmental taxon](../../faq/taxonomy.html#environmental-biome-level-taxonomy) is used (e.g. aquatic metagenome (tax id: 1169740)).

If you do not intend to submit raw reads or a primary metagenome as part of your metagenome assembly submission, please see [here](../../faq/metagenomes.html#how-do-i-submit-metagenome-assemblies-without-raw-data-or-primary-assemblies-to-point-to) for details on how to do this. If no data is associated with the **environmental** sample, it needs to be released manually in order to be available to the public.

### Binned sample

In addition to your **environmental** sample, a **binned** sample must be registered for each bin. This should be as [specific in taxonomy](../../faq/taxonomy.html#environmental-organism-level-taxonomy) as it can be and use the specific **ENA binned metagenome** checklist.

Please make sure these **binned** samples correctly reference the **environmental** sample that the bin was derived from. This can be done from within the checklist using the mandatory “sample derived from” attribute. If the assembly was derived from multiple samples or runs you can list these with a comma separated list or range.

You should also reference the **environmental** sample in the description as one of the following:

“This sample represents a metagenomic bin from the metagenomic sample ERSXXXXX”

OR

“This sample represents a metagenomic bin from the metagenomic run ERRXXXXX”

The methods for submitting metagenomic studies and samples follow the same process as any other study/sample submission. Follow the links for more information.

- [Register a Study](../../study.html)
- [Register a Sample](../../samples.html)

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest <filename>` option.

A binned metagenome assembly submission consists of the following files:

- 1 manifest file
- 1 fasta file

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name   
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias) 
- SAMPLE: Binned sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'binned metagenome'
- COVERAGE: The estimated depth of sequencing coverage
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform
- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap (optional)
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA' (optional)
- DESCRIPTION: Free text description of the genome assembly (optional)

Please see further below for validation rules affecting some of these fields.

The following file name fields are supported in the manifest file:

- FASTA: sequences in fasta format

For example, the following manifest file represents a binned metagenome assembly consisting of contigs provided in one fasta file:

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
FASTA   binned_metagenome.fasta.gz
``` 

## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](../../general-guide/webin-cli.html). 

Please refer to the [Webin command line submission interface](../../general-guide/webin-cli.html) documentation for more information about the submission process.

## Assigned accession numbers

Once the genome assembly has been submitted an analysis (ERZ) accession number is immediately assigned and returned to the submitter by the Webin command line submission interface. 

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin submission service and access their data in the browser.

For binned metagenome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of sample registration.
- Sequence accession(s) assigned once the assembly has been fully processed by ENA (**for MAGS**).
- Genome assembly accession (GCA) assigned once the assembly has been fully processed by ENA (**for MAGS**).

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

### Sequence count validation

Typically, assembly submissions consisting of sequences that exceed the standard minimum or maximum number are not permitted. However, in specific cases, ENA may allow the submission of genome assemblies that are giving the following errors:

Since Webin 1.7.0:
- Invalid number of sequences : XXX, Minimum number of sequences for CONTIG is: YYY
- Invalid number of sequences : XXX, Minimum number of sequences for SCAFFOLD is: YYY
- Invalid number of sequences : XXX, Minimum number of sequences for CHROMOSOME is: YYY
- Invalid number of sequences : XXX, Maximum number of sequences for CONTIG is: YYY
- Invalid number of sequences : XXX, Maximum number of sequences for SCAFFOLD is: YYY
- Invalid number of sequences : XXX, Maximum number of sequences for CHROMOSOME is: YYY

This will be done at the discretion of the curation team when provided with valid reasoning, and can be requested with an email to datasubs@ebi.ac.uk . 
