# Module 7: Metagenome Assembly Submissions 

## Introduction

Metagenome assemblies can be submitted to the European Nucleotide Archive (ENA) using the [Webin command line submission interface](cli_01.html) with `-context genome`.

Please contact datasubs@ebi.ac.uk if you intend to submit an assembly assembled from third party data.

Please see [here](faq_metagenomes.html#how-do-i-submit-uncultured-virus-genomes-uvigs) if you intend to submit uncultured virus genomes derived from a metagenome study.

A metagenome assembly consists of:
- General assembly information
   - Study accession or unique name (alias)
   - **Environmetal** Sample accession or unique name (alias)
   - **Binned** Sample accession or unique name (alias) *for binned assemblies*
   - **MAG** Sample accession or unique name (alias) *for MAGs*
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
- Contig sequences (if any)
- Scaffold sequences (if any and submitting MAGs)
- Chromosome sequences (if any and submitting MAGs)

The following picture illustrates the stages of the metagenome assembly submission process:

![Submission process](images/webin-cli_04.png)

## Stage 1: Pre-register study and metagenomic samples

Each submission must be associated with a pre-registered study and one or more pre-registered metagenomic samples.

All metagenomic assemblies should have at least one **environmental** sample registered that represents where the original sequencing data was extracted from.  This sample should be the same sample used to submit your raw reads. Please make sure the appropriate environmental checklist is chosen for this and an environmental taxon is used (e.g. aquatic metagenome (tax id: 1169740)).

For information about biome-level environmental taxonomy please see [here](faq_taxonomy.html#environmental-biome-level-taxonomy).

If you do not intend to submit raw reads or a primary metagenome as part of your metagenome assembly submission, please see [here](faq_metagenomes.html#how-do-i-submit-metagenome-assemblies-without-raw-data-or-primary-assemblies-to-point-to) for details on how to do this. If no data is associated with the **environmental** sample, it needs to be released manually in order to be available to the public.

Any additional samples required for submission of a metagenome assembly depends on the assembly level:

- primary metagenome
- binned metagenome
- Metagenome Assembled Genome (MAG)

The following image illustrates the stages of a metagenome assembly study and what is submittable to each of the assembly levels in ENA:

![Metagenome assembly levels](images/metagenomes.png)

To best represent your data, please submit all levels that are applicable to your study.

MAG submissions should only consist of high quality, unique, single-taxon representative assemblies. For submission of MAGs, only one assembly for each assembled species within a biome (either the best quality or a de-replicated genome) can also be submitted as a MAG to represent that species. This prevents any particular species within an environmental sample/biome from being over-represented and keeps data informative and searchable. 

### Primary metagenome

This submission level is for a metagenome assembly prior to binning from a sampled biome or collection of sampled biomes without attempt to separate taxa.

If you are submitting a primary assembly, you only need to reference the **environmental** sample as the taxonomy of the organisms within the assembly are still unknown. This means you are not required to pre-register any further samples.

### Binned metagenome

This submission level is for a set of contigs or a genome assembly grouped into a single-taxon set.

If you are submitting binned assemblies then you will need to submit an additional **binned** sample for each bin. This should be as specific in taxonomy as it can be and use the specific **ENA binned metagenome** checklist.

For information about organism-level environmental taxonomy please see [here](faq_taxonomy.html#environmental-organism-level-taxonomy).

Please make sure these **binned** samples correctly reference the **environmental** sample that the bin was derived from. This can be done from within the checklist using the mandatory “sample derived from” attribute. You should also reference the **environmental** sample in the description as one of the following:

“This sample represents a metagenomic bin from the metagenomic sample ERSXXXXX”

OR

“This sample represents a metagenomic bin from the metagenomic run ERRXXXXX”

If the assembly was derived from multiple samples or runs you can list these here with a comma separated list or range.

### Metagenome Assembled Genome (MAG)

This submission level is for a single-taxon assembly based on one or more binned metagenomes asserted to be a close representation to an actual individual genome (that could match an already existing isolate or represent a novel isolate).

There should only be one MAG submitted for each species within a biome. This can be determined using a de-replication step or by choosing the highest quality representative genome for each predicted species.

If you are submitting MAGs then you will need to submit an additional **MAG** sample for each assembly. This should be as specific in taxonomy as it can be and use the specific **GSC MIMAGs** checklist.

Please make sure these **MAG** samples correctly reference the **binned** sample that the MAG was derived from. This can be done from within the checklist using the mandatory “sample derived from” attribute. You should also reference the **environmental** sample in the description as one of the following:

“This sample represents a MAG from the metagenomic sample ERSXXXXX”

OR

“This sample represents a MAG from the metagenomic run ERRXXXXX”

If the assembly was derived from multiple samples or runs you can list these here with a comma separated list or range.

More information about how and why we use this additional sample information can be found [here](faq_metagenomes.html).

The methods for submitting metagenomic studies and samples follow the same process as any other study/sample submission. Follow the links for more information.

Instructions for interactive submitters:

- [Register a Study](mod_02.html)
- [Register a Sample](mod_03.html)

Instructions for programmatic submitters:

- [Register a Study](prog_02.html)
- [Register a Sample](prog_03.html)

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest <filename>` option.

Please review Stage 1 and make sure you are familiar with the metagenome assembly levels before preparing files for submission.

### Primary metagenome

Assemblies in this level should be submitted associated with an **environmental** sample, referenced from within the manifest file.

A primary metagenome assembly submission consists of the following files:

- 1 manifest file
- 1 fasta file 

This assembly level only requires information on the sequences.

### Binned metagenome

Assemblies in this level should be submitted associated with a **binned** sample, referenced from within the manifest file.

A binned metagenome assembly submission consists of the following files:

- 1 manifest file
- 1 fasta file

This assembly level only requires information on the sequences.

### Metagenome Assembled Genome (MAG)

Assemblies in this level should be submitted associated with a **MAG** sample, referenced from within the manifest file.

A MAG assembly submission consists of the following files:

- 1 manifest file
- 1 fasta file OR 1 flat file
- 0-1 AGP files
- 0-1 Chromosome list files

This assembly level requires information on the sequences and annotation (if any).

This assembly level allows for the submission of fully assembled genome sequences (including chromosomes, organelles, plasmids, and viral segments) with the use of a 'chromosome list file'. It also allows the submitter to provide an AGP file to give instructions for the assembly of scaffolds or chromosomes if they wish.

If you wish to submit an AGP or chromosome list file, it is important to understand how sequence names are formatted so they can be consistent between files and your assembly can be registered correctly.

### Sequence names

Sequences must each have a unique entry name within the submission that is provided in the fasta, AGP or flat files. It is essential that the sequence names are unique and used consistently between files. 

For example, the chromosome list file must refer to the chromosome sequences using the unique sequence names. Similarly, an AGP file must refer to scaffolds or contigs using the unique sequence names.

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name   
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias) 
- SAMPLE: Sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'primary metagenome', 'binned metagenome', 'Metagenome-Assembled Genome (MAG)'
- COVERAGE: The estimated depth of sequencing coverage
- PROGRAM: The assembly program
- PLATFORM: The sequencing platform
- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap (optional)
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA' (optional)
- DESCRIPTION: Free text description of the genome assembly (optional)

Please see further below for validation rules affecting some of these fields.

The following file name fields are supported in the manifest file:

- FASTA: sequences in fasta format
- FLATFILE: sequences in EMBL-Bank flat file format
- AGP: Sequences in [AGP format](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/)
- CHROMOSOME_LIST: list of chromosomes

For example, the following manifest file represents a metagenome assembly consisting of contigs provided in one fasta file:

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

Please refer to the [Webin command line submission interface](cli_01.html) documentation for more information about the submission process.

## Assigned accession numbers

Once the genome assembly has been submitted an analysis (ERZ) accession number is immediately assigned and returned to the submitter by the Webin command line submission interface. 

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin submission service and, in the case of primary and binned assemblies, access their data in the browser.

For metagenome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sample accession (SAM) assigned at time of sample registration.
- Sequence accession(s) assigned once the assembly has been fully processed by ENA (**for MAGS**).
- Genome assembly accession (GCA) assigned once the assembly has been fully processed by ENA (**for MAGS**).

Submitters can retrieve the genome and sequence accession numbers from the [Webin submissions portal](prog_11.html) or from the [Webin reports service](prog_10.html). These accession numbers are also sent to the submitters by e-mail.

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

This will be done at the discretion of the curation team when provided with valid reasoning, and can be requested with an email to datasubs@ebi.ac.uk . 
