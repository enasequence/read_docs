=======================================
Submitting Binned Metagenome Assemblies
=======================================

- `Introduction`_
- `Stage 1: Pre-register study and metagenomic samples`_
- `Stage 2: Prepare the files`_
- `Stage 3: Validate and submit the files`_
- `Assigned accession numbers`_
- `Validation rules`_


Introduction
============

Metagenome assemblies can be submitted to the European Nucleotide Archive (ENA) using the
`Webin command line submission interface <../../general-guide/webin-cli.html>`_ with ``-context genome``.

Please contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ if you intend to submit an assembly
assembled from third party data.

A **binned metagenome** assembly submission encompasses anything from a set of contigs to a complete genome assembly
from a metagenomic source that has been identified as a single-taxon set.

There is no limit to the number of bins that can be submitted as part of a metagenomic study as
it is recognised that the number of bins produced can be upwards of 100 000. Please submit all derived
bins at this assembly level and not as Metagenome-Assembled Genomes unless they meet the required criteria.

A binned metagenome assembly consists of:

- General assembly information

   - Study accession or unique name (alias)
   - **Binned** Sample accession or unique name (alias)
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
   - Free text description of the assembly (optional)

- Contig sequences (if any)
- Scaffold sequences (if any and submitting MAGs)
- Chromosome sequences (if any and submitting MAGs)

The following picture illustrates the stages of the metagenome assembly submission process:

.. image:: ../../images/webin-cli_04.png


Stage 1: Pre-register study and metagenomic samples
===================================================

Each submission must be associated with a pre-registered study and a **binned** sample.

If you have not done so already, please register a study.

- `Register a Study <../../study.html>`_

It is recommended to submit any primary metagenomic assemblies and raw reads before
submitting your binned metagenomes to help record your methods and make your data reproducible.

- `Submitting Raw Reads <../../reads.html>`_
- `Submitting A Primary Metagenome Assembly <primary.html>`_

Registering binned samples
--------------------------

Each **binned metagenome** assembly submission must be associated with a **binned** sample. This is because a bin is not an assembly
of the whole set of raw data but an assembly derived from a smaller subset of those data. These virtual
samples represents the subset of that data and hold all metadata related to the taxonomy of that subset as well as
methods used to derive it.

.. image:: ../../images/metadata_model_derivedanalysis.png

These **binned** samples should be as `specific in taxonomy <../../../faq/taxonomy.html#environmental-organism-level-taxonomy>`_
as it can be and use the specific `ENA binned metagenome <https://www.ebi.ac.uk/ena/browser/view/ERC000050>`_ checklist.

Please make sure these **binned** samples correctly reference the **environmental** sample that the bin was derived from.
The **environmental** sample should be the same sample used to submit your raw reads and primary metagenomes.

This can be done from within the checklist using the mandatory “sample derived from” attribute.
If the assembly was derived from multiple samples or runs you can list these with a comma separated list or range.

You should also reference the **environmental** sample in the description as one of the following:

“This sample represents a metagenomic bin from the metagenomic sample ERSXXXXX”

OR

“This sample represents a metagenomic bin from the metagenomic run ERRXXXXX”

.. admonition:: What if I don't intend to submit raw reads or a primary metagenome?

   If you do not intend to submit raw reads or a primary metagenome as part of your metagenome assembly submission,
   please still register an **environmental** sample to show the source of the data and reference this within your **binned** sample.
   Registering an **environmental** sample follows the same method as regular sample registration.
   Make sure to use the most appropriate environmental checklist and an
   `environmental taxon <../../faq/taxonomy.html#environmental-biome-level-taxonomy>`_ (e.g. aquatic metagenome (tax id: 1169740)).
   Please also see `here <../../faq/metagenomes.html#how-do-i-submit-metagenome-assemblies-without-raw-data-or-primary-assemblies-to-point-to>`_
   for details on how to release these samples. If no data is associated with the **environmental** sample, it needs to be
   released manually in order to be available to the public.

The methods for submitting metagenomic samples follow the same process as any other sample submission.
Follow the links for more information.

- `Register a Sample <../../samples.html>`_


Stage 2: Prepare the files
==========================

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the ``-manifest <filename>`` option.

A binned metagenome assembly submission consists of the following files:

- 1 manifest file
- 1 fasta file

Manifest file
-------------

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
- PLATFORM: The sequencing platform, or comma-separated list of platforms
- MINGAPLENGTH: Minimum length of consecutive Ns to be considered a gap (optional)
- MOLECULETYPE: 'genomic DNA', 'genomic RNA' or 'viral cRNA' (optional)
- DESCRIPTION: Free text description of the genome assembly (optional)
- RUN_REF: Comma separated list of run accession(s) (optional)

Please see further below for validation rules affecting some of these fields.

The following file name fields are supported in the manifest file:

- FASTA: sequences in fasta format

For example, the following manifest file represents a binned metagenome assembly consisting of contigs provided in one fasta file:

::

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


Stage 3: Validate and submit the files
======================================

Files are validated, uploaded and submitted using the
`Webin command line submission interface <../../general-guide/webin-cli.html>`_.

Please refer to the `Webin command line submission interface <../../general-guide/webin-cli.html>`_
documentation for more information about the submission process.

Assigned accession numbers
==========================

Once the genome assembly has been submitted an analysis (ERZxxxxxx) accession number is immediately assigned and
returned to the submitter by the Webin command line submission interface.

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin
submission service and access their data in the browser.

For binned metagenome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJEBxxxxx) assigned at time of study registration.
- Sample accession (SAMEAxxxxxx) assigned at time of sample registration.

See an example of a publicly available binned metagenome at:
https://www.ebi.ac.uk/ena/browser/view/ERZ1100281

Validation rules
================

Assembly name validation
------------------------

Assembly names must:
- match the pattern: ^\[A-Za-z0-9\]\[A-Za-z0-9 _#\-\.]*$
- not be longer than 50 characters
- not include the taxonomic name of the organism assembled

Sequence validation
-------------------

Sequences must:
- have unique names within an assembly
- be at least 20bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'
