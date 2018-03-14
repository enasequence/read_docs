# Module 2: Genome Assembly Data Formats

## Introduction

Genome assembly submissions include plasmids, organelles, complete virus genomes, viral segments/replicons, 
bacteriophages, prokaryotic and eukaryotic genomes. Chromosomes include organelles (e.g. mitochondrion and 
chloroplast), plasmids and viral segments.
 
Genome assembly data files contain:
- Contig sequences (if any)
- Scaffold sequences (if any)
- Chromosome sequences (if any)
- Unlocalised sequences (if any)
- Functional annotation (optional)

You can use the following file formats to submit genome assemblies:

- `Fasta file`: Unannotated sequences should be submitted as a Fasta file.
- `AGP file`: Scaffolds or chromosomes can be descriped using an AGP file.
- `Flat file`: Annotated sequences must be submitted as an EMBL-Bank flat file.
- `Chromosome list file`: Must be provided when the submission contains assembled chromosomes.
- `Unlocalised list file`: Should be provided when the submission contains chromosomes with unlocalised sequences.

Please note that all data files must be gz compressed. 

## Fasta file

Unannotated sequences should be submitted as a Fasta file. These sequences can be either
contig or chromosome sequences.

## AGP file

Scaffolds or chromosomes constructed from contigs or scaffolds, respectively, can be submitted using 
an [AGP](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/) file.

AGP files can be validated using the [NCBI AGP validator](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Validation/).

## Flat file	

Annotated sequences can only be submitted in the EMBL-Bank flat file format. 

The feature table annotation must conform to the [INSDC Feature Table Definition](http://www.insdc.org/files/feature_table.html).

We recommend that functional annotation is prepared using [Artemis](https://www.sanger.ac.uk/science/tools/artemis).

## Chromosome list file

The chromosome list file must be provided when the submission contains assembled chromosomes. 

The file is a tab separated text file (USASCII7) containing the following columns:

- OBJECT_NAME (first column): The unique sequence name.
- CHROMOSOME_NAME (second column): The chromosome name. The value will appear as the /chromosome, /plasmid or /segment qualifiers in the EMBL-Bank flat files.
- CHROMOSOME_TYPE (third column):
    - chromosome
    - plasmid
    - linkage_group
    - monopartite
    - segmented
    - multipartite  
- CHROMOSOME_LOCATION (optional fourth column). By default eukaryotic chromosomes will be assumed to reside in the nucleus 
and procaryotic chromosomes and plasmids in the cytoplasm.
    - Macronuclear
    - Nucleomorph
    - Mitochondrion
    - Kinetoplast
    - Chloroplast
    - Chromoplast
    - Plastid
    - Virion
    - Phage
    - Proviral
    - Prophage
    - Viroid
    - Cyanelle
    - Apicoplast
    - Leucoplast
    - Proplastid
    - Hydrogenosome
    - Chromatophore

An example of a chromosome list file:

```
chr01 I Chromosome
chr02 II Chromosome
chr03 III	Chromosome
chr04	IV	Chromosome
```   
    
## Unlocalised list file

This file should be provided when the submission contains chromosomes with unlocalised sequences.

Unlocalised sequences are contigs or scaffolds that are associated with a specific chromosome but 
their order and orientation is unknown.

The unlocalised list file is a tab separated text file (USASCII7) containing the following columns: 

- OBJECT_NAME (first column): the unique sequence name.
- CHROMOSOME_NAME (second column): the unique chromosome name associated with this sequence.

An example unlocalised list file:

```
cb25.NA_084     III
cb25.NA_093     III
cb25.NA_108     III
```   
## Unique sequence names

All sequences within one genome assembly submission
must be identified by a unique sequence name provided in the Fasta, AGP or flat files.

It is essential that the sequence names are unique and used consistently between files. For example, the 
chromosome list file must refer to the chromosome sequences being submitted in Fasta, AGP or flat files 
using the unique entry name. Similarly, an AGP file must refer to scaffolds or contigs using unique entry names.

### Fasta file

The sequence name is extracted from the header line starting with `>`.

For example, the following sequence has name `contig1`:

```
>contig1
AAACCCGGG...
```

### AGP file

The sequence name is extracted from the 1st (object) column.

### Flat file

The sequence name is extracted from the `AC *` line . The sequence name must be prefixed with a `_` 
when using the flat file format.

For example, the following sequence has name `contig1`:

```
AC * _contig1
 ```
