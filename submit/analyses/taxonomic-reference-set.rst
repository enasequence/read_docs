===================================
Submitting Taxonomic Reference Sets
===================================


Introduction
============

The Taxonomic Reference Set analysis class is intended as a stable means of
systematically capturing datasets from established reference databases in a
standard format. It is then possible to convey them to dependent resources for
use in taxonomic assignment of metabarcoding sequences.

The format has three components:

- `Metadata Record`_: Some general information about the dataset as a whole
- `Sequence Record`_: A multi-FASTA containing the sequence to be archived,
   along with identifiers
- `Sequence Metadata Table`_: A TSV file containing information about the
   origins of the sequences, matched by identifiers

The three components together comprise a Taxonomic Reference Set. The format
of each item is described in detail below.

Before you can submit a Taxonomic Reference Set, you must `register a study
<../study/interactive.html>`_.

This analysis class can only be submitted through our `Webin-CLI tool
<../general-guide/webin-cli.html>`_.


Submission Content
==================


Metadata Record
---------------

All Webin-CLI submissions require a metadata record in the form of a manifest
file. This describes the dataset as a whole, not the individual sequences.

The following fields are used for Taxonomic Reference Set Submission:

- **Name** (MANDATORY) -  A short descriptive name for your dataset
- **Study** (MANDATORY) - A valid INSDC Study accession
- **Description** (MANDATORY) - A description of the dataset
- **Taxonomy System** (MANDATORY) - The database or authority defining the
  taxon names used in your metadata table. 'NCBI' or 'NCBI Taxonomy' is
  preferred
- **Taxonomy System Version** (OPTIONAL) - The version of the taxonomy system
  defined above, if applicable
- **FASTA** (MANDATORY) - The gzipped FASTA file containing your sequence
  record
- **TAB** (MANDATORY) - The gzipped TSV file containing your sequence metadata

It should be clear from the name and description what the theme of you dataset
is (e.g. ITS1 sequences, 16S sequences, a specific clade). The name must always
be unique.

The taxonomy system field should specify the what authority your taxon names
and lineages conform to. Values 'NCBI' or 'NCBI Taxonomy' are preferred and are
mandatory if you intend to include NCBI taxon IDs. However, any database may be
specified here. You can clarify a version/release number with the Taxonomy
system version if you wish.

An example manifest follows:

::

 NAME 16S Database
 STUDY ERP999999
 DESCRIPTION Set of reference 16S sequences as collected by 16S Database
 TAXONOMY_SYSTEM NCBI
 FASTA 16s_db_seqs.fasta.gz
 TAB 16s_db_info.tsv.gz

Download a blank manifest for your use here:
`TODO/PATH/HERE <tax-ref-set-example-manifest.txt>`_


Sequence Record
---------------

The sequence data component of the submission, this is a multi-FASTA file
containing marker sequences, such as ITS1 or 16S. It should have been made
clear in the metadata record what to expect here.

The ID lines must begin with a sequence identifier unique to each record and
matching an identifier in the sequence metadata table. It is acceptable to use
an INSDC accession here. If you wish to include further details about the
sequence here, separate them from the identifier with a '|' character:

::

  >ITS1DB00588027|162468|Steinernema abbasi|ITS1 located by ENA annotation, 267bp

Any valid nucleotide character is accepted, blank lines will not be accepted.
Sequence lines must conform to the regular expression:

::

  ^[ATCGactgRYSWKMBDHVryswkmbdhvNn]*$

The ID and sequence must each occupy a single line. An odd number of lines in a
FASTA file is considered an error.


Sequence Metadata Table
-----------------------

This is a TSV-format file containing metadata for each individual sequence. Six
mandatory columns are defined. While all must always be present, some may
contain null values:

- **local_identifier** (NOT NULL) - Must exactly match an identifier in the
  FASTA
- **insdc_sequence_accession** (null allowed) - Must be a valid INSDC sequence
  accession
- **insdc_sequence_range** (null if INSDC accession is) - Must be a valid INSDC
  location string (e.g. "<21..<235", regex: "^<?\d+\.\.>?\d+$" )
- **local_organism_name** (NOT NULL) - Binomial name of the species the
  sequence identifies
- **local_lineage** (null allowed) - Full lineage of the species named in the
  local_organism_name column
- **ncbi_tax_id** - NCBI Tax Id, mandatory if using NCBI Taxonomy, disallowed
  if not

The INSDC sequence range is optional, but must be null if the the INSDC
sequence accession is null. If NCBI taxonomy is specified as the taxonomic
system, you must provide NCBI tax ID for every entry. Otherwise, this column
must always be null. If Tax IDs are included, they must match the organism name

Download a blank table for your use here:
`TODO/PATH/HERE <tax-ref-set-example-manifest.txt>`_


Submitting The Files
====================

The files must be submitted using Webin-CLI. For an introduction to this tool
please `click here <../general-guide/webin-cli.html>`_.

Webin-CLI includes ``-test`` and ``-validate`` options. ``-validate`` may be
used to have the Webin-CLI validator run on your files without submitting.
``-test`` may be used to make your submission to our test server, which is
wiped clean every 24 hours. Note that a newly submitted study cannot be
referenced on the test server until 24 hours after its submission. You are
advised to use these prior to submission to help identify problems with the
files.

Webin-CLI requires the following options from you:

- Your Webin username, resemling 'Webin-xxxxx':``-username``
- Your Webin password: ``-password``
- The type of submission, ;taxrefset' in this case: ``-context``
- Name and path to your metadata record file: ``-manifest``
- Instruction, either ``-validate`` or ``-submit``
- Optionally, you may use ``-test`` to submit to the test server

An example command may resemble:

::

  webin-cli -username Webin-99999 -password xxxxxx -context taxrefset -manifest trs_submission.txt -validate

When ready, switch ``-validate`` for ``-submit``