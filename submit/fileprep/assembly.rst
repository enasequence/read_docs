=====================================
Accepted Genome Assembly Data Formats
=====================================


Introduction
============

The advice here is appropriate for submission of complete or near-complete replicons, including plasmids, organelles,
complete viral genomes, viral segments/replicons, bacteriophages, prokaryotic and eukaryotic genomes.
Chromosomes include organelles (e.g. mitochondrion and chloroplast), plasmids and viral segments.
 
Genome assembly data files might contain:

- Contig sequences
- Scaffold sequences
- Chromosome sequences
- Unlocalised sequences
- Functional annotation

Submission of single records that represent all of the unplaced scaffolds, or all of the scaffolds that belong to a
particular chromosome but are not localized to a specific position on the chromosome, are not accepted. These records
do not represent biological objects and should therefore be split into individual records for each scaffold.

You can use the following file formats to submit genome assemblies:

- ``Fasta file``: Unannotated assemblies should be submitted as a Fasta file
- ``AGP file``: Scaffolds or chromosomes can be described using an AGP file
- ``Flat file``: Annotated assemblies must be submitted as an EMBL-Bank flat file
- ``Chromosome list file``: Must be provided when the submission contains assembled chromosomes
- ``Unlocalised list file``: Should be provided when the submission contains chromosomes with unlocalised sequences

Please note that all data files must be gz compressed. 


Fasta file
==========

Unannotated sequences should be submitted as a Fasta file. These sequences can be either
contig or chromosome sequences.


AGP file
===========

You may use an `AGP <https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/>`_ file to describe the assembly
of scaffolds from contigs, or of chromosomes from scaffolds.

AGP files can be validated using the `NCBI AGP validator <https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Validation/>`_.

The AGP file can also be used to define sequences as unplaced. Unplaced sequences are known to be part of the assembly,
but it is unknown which chromosome they belong to.


Flat file
=========

Annotated sequences can only be submitted in the EMBL-Bank flat file format, described `here <https://www.ebi.ac.uk/ena/submit/flat-file>`_.

The feature table annotation must conform to the `INSDC Feature Table Definition <http://www.insdc.org/files/feature_table.html>`_.

Some tools to help you create flat files are described in our `Third Party Tools page <https://ena-docs.readthedocs.io/en/latest/faq/third_party_tools.html>`.


Chromosome list file
====================

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
- TOPOLOGY (CHROMOSOME_TYPE modifier):
    - Topology can be specified as a modifier to the chromosome type
    - Options are 'linear' or 'circular'
    - Must not conflict with any value specified in flat file
    - Default is linear
    - Contigs, scaffolds and transcriptome sequences are always linear: entering 'circular' here will be overriden
- CHROMOSOME_LOCATION (optional fourth column). By default eukaryotic chromosomes will be assumed to reside in the
  nucleus and prokaryotic chromosomes and plasmids in the cytoplasm.
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

An example chromosome list file, describing a eukaryote with four linear nuclear chromosomes and one linear
mitochondrial chromosomes:

::
    
    chr01   1 Linear-Chromosome
    chr02   2 Linear-Chromosome
    chr03   3 Linear-Chromosome
    chr04   4 Linear-Chromosome
    chrMi   MIT Linear-Chromosome Mitochondrion   


Unlocalised list file
=====================

This file should be provided when the submission contains chromosomes with unlocalised sequences.

Unlocalised sequences are contigs or scaffolds that are associated with a specific chromosome but 
for which order and orientation is unknown.

The unlocalised list file is a tab separated text file (USASCII7) containing the following columns: 

- OBJECT_NAME (first column): the unique sequence name matching a FASTA header or flatfile ``AC * `` line
- CHROMOSOME_NAME (second column): the unique chromosome name associated with this sequence. This
  must match with a CHROMOSOME_NAME in the chromosome list file.

An example unlocalised list file:

::

    cb25.NA_084     III
    cb25.NA_093     III
    cb25.NA_108     III


Appendix: Unique sequence names
===============================

All sequences within one genome assembly submission
must be identified by a unique sequence name provided in the Fasta, AGP or flat files.

It is essential that the sequence names are unique and used consistently between files. For example, the 
chromosome list file must refer to the chromosome sequences being submitted in Fasta, AGP or flat files 
using the unique entry name. Similarly, an AGP file must refer to scaffolds or contigs using unique entry names.

Fasta file
----------

The sequence name is extracted from the header line starting with ``>``.

For example, the following sequence has name ``contig1``:

::

    >contig1
    AAACCCGGG...


AGP file
--------

The sequence name is extracted from the 1st (object) column.

Flat file
---------

The sequence name is extracted from the ``AC *`` line . The sequence name must be prefixed with a ``_`` 
when using the flat file format.

For example, the following sequence has name ``contig1``:

::

    AC * _contig1
    


Appendix: Definition of Terms
=============================