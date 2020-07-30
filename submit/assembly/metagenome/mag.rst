==============================================
Submitting A Metagenome-Assembled Genome (MAG)
==============================================

- `What is considered a MAG in ENA?`_
- `Introduction`_
- `Stage 1: Pre-register study, samples and lower level assemblies`_
- `Stage 2: Prepare the files`_
- `Stage 3: Validate and submit the files`_
- `Assigned accession numbers`_
- `Validation rules`_


What is considered a MAG in ENA?
================================

A **Metagenome-Assembled Genome (MAG)** is a single-taxon assembly based on one or more binned metagenomes that
has been asserted to be a close representation to an actual individual genome (that could match an already existing
isolate or represent a novel isolate).

MAG submissions are submitted at the same level as isolate genomes and are distributed within INSDC in the same way.
As an environmental sample can contain many duplicate genomes of the same organism and as MAG assemblies are more prone
to contamination, we request only the highest quality unique-taxon submissions are submitted as MAGs.

There should only be **one MAG** submitted for each species within a biome. This can be determined using a
de-replication step or by choosing the highest quality representative genome for each predicted species.

It is recommended that for all MAG submissions, all lower level assemblies are submitted first. This means a MAG
submission can be used to highlight the best and most representative derived assemblies from a binned metagenome set
and ensures the methods used to derive your MAG are reproducible.

- `Submitting A Primary Metagenome Assembly <primary.html>`_
- `Submitting Binned Metagenome Assemblies <binned.html>`_

If your study is small-scale and you only intend to submit a very small number of MAGs, lower level
metagenome assembly submissions may not be necessary, though are still recommended where possible. Please contact
our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ if you have any questions.


Introduction
============

Metagenome assemblies can be submitted to the European Nucleotide Archive (ENA) using the
`Webin command line submission interface <../../general-guide/webin-cli.html>`_ with ``-context genome``.

Please contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ if you intend to submit an assembly
assembled from third party data.

Each MAG from an environmental source requires a virtual derived **MAG** sample so please follow instructions carefully.

Genome assembly submissions include plasmids, organelles, complete virus genomes, viral segments/replicons,
bacteriophages, prokaryotic and eukaryotic genomes.

A Metagenome-Assembled Genome consists of:

- General assembly information

   - Study accession or unique name (alias)
   - **MAG** Sample accession or unique name (alias)
   - Assembly name
   - Assembly program
   - Sequencing platform
   - Minimum gap length
   - Molecule type (genomic DNA, genomic RNA or viral cRNA)
   - Coverage
   - Free text description of the assembly (optional)

- Contig sequences (if any)
- Scaffold sequences (if any)
- Chromosome sequences (if any)
- Unlocalised sequences (if any)
- Functional annotation (optional)

For assembly submission purposes, the term 'chromosome' should be understood to include organelles
(e.g. mitochondria and chloroplasts), plasmids and viral segments.

The below image illustrates the stages of the MAG submission process:

.. image:: ../../images/webin-cli_04.png


Stage 1: Pre-register study, samples and lower level assemblies
===============================================================

Each submission must be associated with a pre-registered study and a **MAG** sample.

Genome assemblies except primary metagenomes are uniquely associated with a study and a sample.

If you have not done so already, please register a study. If you intend to submit your MAG with annotation, make
sure to register locus tag prefixes during this stage.

- `Register a Study <../../study.html>`_

It is recommended to also submit all lower level metagenomic assemblies and raw reads before submitting MAGs to help
record your methods and make your data reproducible.

- `Submitting Raw Reads <../../reads.html>`_
- `Submitting A Primary Metagenome Assembly <primary.html>`_
- `Submitting Binned Metagenome Assemblies <binned.html>`_

Registering MAG samples
-----------------------

Each **MAG** assembly submission must be associated with a **MAG** sample. This is because a MAG is not an assembly
of the whole set of raw data but an assembly derived from a smaller subset of those data. These virtual
samples represents the subset of that data and hold all metadata related to the taxonomy of that subset as well as
methods used to derive it.

.. image:: ../../images/metadata_model_derivedanalysis.png

**MAG** samples should be as `specific in taxonomy <../../../faq/taxonomy.html#environmental-organism-level-taxonomy>`_ as they can
be and use the specific `GSC MIMAGS <https://www.ebi.ac.uk/ena/browser/view/ERC000047>`_ checklist.

Please make sure these **MAG** samples correctly reference the sample they were derived from (e.g. a **binned**
sample used to submit a metagenomic bin or the **environmental** sample used to submit the raw reads the MAG was derived from).

This can be done from within the checklist using the mandatory “sample derived from” attribute. If the assembly was derived from multiple
samples or runs you can list these with a comma separated list or range.

You should also reference the source sample in the description:

“This sample represents a MAG derived from the metagenomic sample ERSXXXXX”

.. admonition:: What if I only want to submit MAGs and not lower level assemblies or reads?

   If you do not intend to submit raw reads or lower level assemblies as part of your metagenome assembly submission,
   please still register an **environmental** sample and reference this within your **MAG** sample to show the source of the data
   and reference this within your **MAG** sample.
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

The files required for submission of a genome assembly depends on the assembly level:

- `Contig assembly`_
- `Scaffold assembly`_
- `Chromosome assembly`_

Contig assembly
---------------

Consists of the following files:

- 1 manifest file
- 1 FASTA file OR 1 `flat file <../../fileprep/assembly.html#flat-file>`_

This assembly level only requires information on the sequences and annotation (if any).
You will receive an error if less than 2 or more than 1,000,000 sequences are submitted. If you have less than 2
sequences, then you will need to submit at a higher assembly level or as
`template sequences <../../sequence/webin-cli-flatfile.html>`_.

Scaffold assembly
-----------------

Consists of the following files:

- 1 manifest file
- 1 FASTA file OR 1 `flat file <../../fileprep/assembly.html#flat-file>`_
- 1 `AGP files <../../fileprep/assembly.html#agp-file>`_

This assembly level requires information on the sequences and annotation (if any).
It also allows the submitter to provide an AGP file to give instructions for the assembly of the scaffolds from the
contigs.

Chromosome assembly
-------------------

Consists of the following files:

- 1 manifest file
- 1 FASTA file OR 1 `flat file <../../fileprep/assembly.html#flat-file>`_
- 1 `chromosome list file <../../fileprep/assembly.html#chromosome-list-file>`_
- 0-1 `unlocalised list files <../../fileprep/assembly.html#unlocalised-list-file>`_
- 0-1 `AGP files <../../fileprep/assembly.html#agp-file>`_

This assembly level allows the submission of fully assembled chromosomes (including organelles, plasmids, and viral
segments). This requires information on the sequences and annotation (if any) and submission of a chromosome list file
to indicate which sequences represent which ‘chromosomes’.

If these chromosomes contain unlocalised sequences (where the chromosome of the sequence is known but not the exact
location) you can submit an additional unlocalised list file. However, please note, if you wish to submit unplaced
contigs, you will have to submit at a lower level and use an AGP file to indicate which scaffolds/contigs are
assembled to form each chromosome. Any sequences that are not used to assemble chromosomes are considered unplaced.

For this assembly level in particular, it is important to understand how sequence names are formatted so they can
be consistent between files otherwise the system will just register your submission at contig level.

Sequence names
--------------

Sequences must have a unique name within the submission that is provided in the fasta, AGP or flat files.
It is essential that the sequence names are unique and used consistently between files.

For example, the chromosome list file must refer to the chromosome sequences using the unique sequence names.
Similarly, an AGP file must refer to scaffolds or contigs using the unique sequence names.

Manifest file
-------------

The manifest file has two columns separated by a tab (or any whitespace characters):

- Field name (first column): case insensitive field name
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias)
- SAMPLE: MAG sample accession or unique name (alias)
- ASSEMBLYNAME: Unique assembly name
- ASSEMBLY_TYPE: 'Metagenome-Assembled Genome (MAG)'
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
- FLATFILE: sequences in `EMBL-Bank flat file format <../fileprep/flat-file-example.html>`_
- AGP: sequences in `AGP format <https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Specification/>`_
- CHROMOSOME_LIST: list of chromosomes

For example, the following manifest file represents a MAG consisting of contigs provided in one FASTA file:

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
    FASTA   metagenome_assembled_genome.fasta.gz


Stage 3: Validate and submit the files
======================================

Files are validated, uploaded and submitted using the
`Webin command line submission interface <../../general-guide/webin-cli.html>`_.

Please refer to the `Webin command line submission interface <../../general-guide/webin-cli.html>`_ documentation for
more information about the submission process.


Assigned accession numbers
==========================

Once the genome assembly has been submitted an analysis (ERZxxxxxx) accession number is immediately assigned and
returned to the submitter by the Webin command line submission interface (Webin-CLI).

ERZ accessions **should not** be used to reference the assembly in publications.
The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the Webin
submission service. For example, the submitter can retrieve the assigned genome assembly and sequence accessions from
the `Webin submissions portal <../../general-guide/submissions-portal.html>`_ or from the `Webin reports service
<../../general-guide/reports-service.html>`_ using the ERZ accession number.
This accession should be used to refer to the assembly in any conversations with helpdesk staff.

For metagenome assemblies, long term stable accession numbers that can be used in publications are:

- Study accession (PRJEBxxxxx) assigned at time of study registration.
- Sample accession (SAMEAxxxxxx) assigned at time of sample registration.
- Genome assembly accession (GCA_xxxxxxx) assigned once the assembly has been fully processed by ENA.
- Sequence accession(s) assigned once the assembly has been fully processed by ENA.

Submitters can retrieve the genome and sequence accession numbers from the
`Webin submissions portal <../../general-guide/submissions-portal.html>`_ or from the
`Webin reports service <../../general-guide/reports-service.html>`_.
These accession numbers are also sent to the submitters by e-mail.


Validation rules
================

Assembly submissions are subject to a great deal of validation before submission is allowed. Some key points
are described here.

Sample And Study Validation
---------------------------

- Sample and study (BioProject) pair must be unique for an assembly (except primary metagenomes)
- Sample taxonomic classification must be species rank or below (or equivalent) within NCBI taxonomy.

Assembly name validation
------------------------

Assembly names must:

- match the pattern: ^\[A-Za-z0-9\]\[A-Za-z0-9 _#\-\.]*$
- not be longer than 50 characters
- not include the name of the organism assembled

Chromosome name validation
--------------------------

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

Sequence validation
-------------------

Sequences must:

- have unique names within an assembly
- be at least 20bp long
- not have terminal Ns
- consist of bases: 'a','c','g','t','u','b','d','h','k','m','n','r','s','v','w','y'
