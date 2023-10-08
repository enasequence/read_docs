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

You can use the below file formats to submit genome assemblies. Follow the links to learn more about formatting them:

- `FASTA File`_: Unannotated assemblies should be submitted as a FASTA file
- `Flat File`_: Annotated assemblies must be submitted as an EMBL flat file
- `AGP File`_: The assembly of scaffolds or chromosomes from contigs can be described using an AGP file
- `Chromosome List File`_: Must be provided when the submission contains assembled chromosomes
- `Unlocalised List File`_: Should be provided when the submission contains chromosomes with unlocalised sequences

Please note that all data files must be compressed with GZIP.

Some additional information is provided in the appendices:

- `Appendix: Unique Sequence Names`_
- `Appendix: Definition of Terms`_


FASTA File
==========

Unannotated sequences should be submitted as a FASTA file.
These sequences can be either contig or chromosome sequences.
The FASTA format consists of two lines per record, the first being a sequence identifier and the second being the sequence itself.
Ensure the sequence contains only valid nucleotide characters and no whitespace or newline characters.



Flat File
=========

Annotated sequences can only be submitted in the `EMBL flat file format <./flat-file-example.html>`_.
For the full range of features and qualifiers available for flat files and their expected content, please see
`WebFeat <https://www.ebi.ac.uk/ena/WebFeat/>`_.  The complete flatfile manual is available `here <./flatfile_user_manual.html>`_.

The feature table annotation must conform to the
`INSDC Feature Table Definition <http://www.insdc.org/files/feature_table.html>`_.

Some tools to help you create flat files are described in our
`Third Party Tools page <https://ena-docs.readthedocs.io/en/latest/faq/third_party_tools.html>`_.

.. toctree::
   :maxdepth: 1

   ./flat-file-example
   ./flatfile_user_manual

Chromosome List File
====================

The chromosome list file must be provided when the submission contains assembled chromosomes. 

The file is a tab separated text file (USASCII7) up to four columns.
An example chromosome list file, describing a eukaryote with four linear nuclear chromosomes and one linear
mitochondrial chromosomes:

::

    chr01   1 Linear-Chromosome
    chr02   2 Linear-Chromosome
    chr03   3 Linear-Chromosome
    chr04   4 Linear-Chromosome
    chrMi   MIT Linear-Chromosome Mitochondrion


Please read on for information on the content of the chromosome list file columns

- **OBJECT_NAME** (first column): The unique sequence name, matching with the sequence name in your FASTA file ('>' line) 
  or EMBL flat file ('AC * ' line).
- **CHROMOSOME_NAME** (second column): The chromosome name. The value will appear as the /chromosome, /plasmid or /segment
  qualifier in the EMBL-Bank flat files. Names must:

   - match the pattern: ^[A-Za-z0-9][A-Za-z0-9_#-.]*$
   - be shorter than 33 characters
   - be unique within an assembly
   - not contain any of the following as part of their name (case insensitive):

      - ‘chr’
      - ‘chrm’
      - ‘chrom’
      - ‘chromosome’
      - ‘linkage group’
      - ‘linkage-group’
      - ‘linkage_group’
      - ‘plasmid’

- **CHROMOSOME_TYPE** (third column): Allowed values:

   1. chromosome
   2. plasmid
   3. linkage_group
   4. monopartite
   5. segmented
   6. multipartite

- **TOPOLOGY** (CHROMOSOME_TYPE modifier):

   - Topology is not a separate column but can be specified as a modifier to the chromosome type
   - Options are 'linear' or 'circular', default is linear
   - Must not conflict with any value specified in flat file
   - Contigs, scaffolds and transcriptome sequences are always linear: entering 'circular' here will be overriden

- **CHROMOSOME_LOCATION** (optional fourth column): By default eukaryotic chromosomes will be assumed to reside in the
  nucleus and prokaryotic chromosomes and plasmids in the cytoplasm. Allowed values:

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



AGP File
===========

You may use an `AGP <https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/>`_ file to describe the assembly
of scaffolds from contigs, or of chromosomes from scaffolds.

AGP files can be validated using the `NCBI AGP validator <https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Validation/>`_.

The AGP file can also be used to define sequences as unplaced.
Unplaced sequences are those known to be part of the assembly, but it is unknown which chromosome they belong to.


Unlocalised List File
=====================

This file should be provided when the submission contains chromosomes with unlocalised sequences.
Unlocalised sequences are contigs or scaffolds that are associated with a specific chromosome but 
for which order and orientation is unknown.
An example unlocalised list file:

::

    cb25.NA_084     III
    cb25.NA_093     III
    cb25.NA_108     III


The unlocalised list file is a tab separated text file (USASCII7) containing the following columns: 

- OBJECT_NAME (first column): the unique sequence name matching a FASTA header or flatfile ``AC *`` line
- CHROMOSOME_NAME (second column): the unique chromosome name associated with this sequence. This
  must match with a CHROMOSOME_NAME in the chromosome list file.


Appendix: Unique Sequence Names
===============================

All sequences within one genome assembly submission must be identified by a unique sequence name provided in the FASTA,
AGP or flat files.

It is essential that the sequence names are unique and used consistently between files.
For example, the chromosome list file must refer to the chromosome sequences being submitted in FASTA, AGP or flat files
using the unique entry name.
Similarly, an AGP file must refer to scaffolds or contigs using unique entry names.

FASTA
-----

The sequence name is extracted from the header line starting with ``>``.

For example, the following sequence has name ``contig1``:

::

    >contig1
    AAACCCGGG...


AGP
---

The sequence name is extracted from the 1st (object) column.

Flat Files
----------

The sequence name is extracted from the ``AC *`` line . The sequence name must be prefixed with a ``_``
when using the flat file format.

For example, the following sequence has name ``contig1``:

::

    AC * _contig1

Note that for the ``AC *`` line, the 'AC' must be followed by exactly one space, an asterisk (*) character, and then
one more space.


Appendix: Definition of Terms
=============================

+-----------------------+----------------------------------------------------------------------------------------------+
| Term                  | Definition                                                                                   |
+=======================+==============================================================================================+
| Assembly              | | A set of chromosome assemblies, unlocalized and unplaced sequences,                        |
|                       | | alternate loci and patches that represent a genome.                                        |
+-----------------------+----------------------------------------------------------------------------------------------+
| Assembly chain        | | The major and minor releases form an assembly chain. For example, the                      |
|                       | | assembly accession for GRCh37 major release is GCA_000001405.1. The                        |
|                       | | assembly accession consists of two parts: the assembly chain accession                     |
|                       | | (GCA_000001405) and the assembly version (.1). The assembly version is                     |
|                       | | incremented for each minor release while the assembly chain accession                      |
|                       | | remains unchanged.                                                                         |
+-----------------------+----------------------------------------------------------------------------------------------+
| Chromosome            | | An assembled pseudomolecule that represents a biological chromosome.                       |
|                       | | Most of the chromosome is expected to be represented by sequenced bases,                   |
|                       | | although some gaps may still be present.                                                   |
+-----------------------+----------------------------------------------------------------------------------------------+
| Placed sequence       | | A sequence that has a known chromosomal location and orientation.                          |
+-----------------------+----------------------------------------------------------------------------------------------+
| Unplaced sequence     | | A sequence that is not associated with any specific chromosome.                            |
+-----------------------+----------------------------------------------------------------------------------------------+
| Unlocalised sequence  | | A sequence that is associated with a specific chromosome without                           |
|                       | | being ordered or oriented on that chromosome.                                              |
+-----------------------+----------------------------------------------------------------------------------------------+
