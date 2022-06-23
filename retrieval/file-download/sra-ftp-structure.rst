=================
SRA FTP Structure
=================

The root address of the SRA FTP server is:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/


This server contains all raw read data submitted to ENA and INSDC, as well
a subset of analysis data.

This server explicitly excludes genome assemblies of all kinds, metagenome
assemblies, transcriptome sequence assemblies, template sequences, and other
short pieces of annotated sequence.
This type of data can be found in `ENA FTP <../file-download/ena-ftp-structure.html>`_.
Analyses found in SRA FTP include variant data in VCF format, methylation 
data, and taxonomic reference sets.

Please see below for information on the structure of the FTP as it pertains to
the two types of data stored in SRA FTP:

- `Reads FTP Structure`_
- `Analysis FTP Structure`_


Reads FTP Structure
===================

For most reads presented by ENA, there are three kinds of file available:

- *Submitted files* are identical to those submitted by the user
- *FASTQ files* are archive-generated files generated according to a
  standardised format (`learn more about this format`_)
- *SRA files* are in a format designed to work with NCBI's `SRA Toolkit`_

.. _`learn more about this format` : ../faq/archive-generated-files.html
.. _`SRA Toolkit` : https://www.ncbi.nlm.nih.gov/books/NBK158900/

Each of the three file types has its own directory on the FTP server.
A folder exists for every run, which is named with the accession of the run,
e.g. files for run ERR164407 are in a directory named ERR164407.
These run accession directories are organised into parent directories named
with their first 6 characters.
For ERR164407 this is 'ERR164'.
This structure is repeated across all three file types

For example, the run ERR164407 would be found in a directory resembling:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/<file-type>/ERR164/ERR164407

Specifics of how to access each read type are available below.


Submitted Read Files
--------------------

The submitted read file is always present for all runs submitted to ENA.
If a run was originally submitted to another INSDC database (NCBI SRA, DDBJ)
then a file of this category will not be available.

ENA submitted files are available in the 'run' directory, e.g.:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/run/<accession-prefix>/<full-accession>/


Using ERR164407 as an example:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR164/ERR164407/


Navigating to this directory in your browser will reveal a file named
'APY_COTS_GPUCM0403.sff'.


Archive-Generated Read Files
----------------------------

In most cases ENA generates one or more FASTQ files for each run, which follow
a specific format.
For information on this format, and when it is not available, please see our
page on `Archive Generated FASTQ Files <https://ena-docs.readthedocs.io/en/latest/faq/archive-generated-files.html?#archive-generated-files>`_.

ENA archive-generated files are available in the 'fastq' directory, e.g.:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/fastq/<accession-prefix>/<full-accession>/


Using ERR164407 as an example:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR164/ERR164407/


Navigating to this directory in your browser will reveal a file named
'ERR164407.fastq.gz'.
An archive-generated FASTQ file always has a name which contains the run
accession.


SRA Read Files
--------------

SRA format file are provided for use with NCBI's `SRA Toolkit
<https://www.ncbi.nlm.nih.gov/books/NBK158900/>`_.

SRA files are made available in the 'err' directory, e.g.:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/err/<accession-prefix>/<full-accession>/


Using ERR164407 as an example:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/err/ERR164/ERR164407/



Analysis FTP Structure
======================

The ENA analysis object can hold a variety of different data types.
It is designed to be flexible and extensible to allow quick implementation of
new data types.

Analyses come in two types:

- Processed analyses include materials such as genome assemblies, transcriptome
  assemblies, MAGs, and other annotated sequences: these are stored in the
  `ENA FTP <../file-download/ena-ftp-structure.html>`_.
- Simple analyses include various types described in our page on `How To Submit
  Other Analyses <../../submit/analyses.html>`_ as well as primary and binned
  metagenomes are stored in the SRA FTP

These simple analyses undergo some validation but are mostly presented in the
same format the user submitted them: this is the type of analysis described in
this section.

The variation in types of analyses prevents the sort of processing and
organisation given to reads, as described above.
Analyses are stored in directories named with the analysis accession, e.g.
ERZ1195979.
These directories are stored within parent directories named with the first six
characters of their accession.
Therefore, files for analysis ERZ1195979 can be found at:

::

    ftp://ftp.sra.ebi.ac.uk/vol1/ERZ119/ERZ1195979/


This area of the FTP server includes primary and binned metagenomes, as well as
analysis classes described in our page on `How To Submit Other Analyses
<../../submit/analyses.html>`_.