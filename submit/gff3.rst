.. _gff3-annotation-submission:

How to submit GFF3 annotation
==========================

What is GFF3
------------

GFF3 (Generic Feature Format version 3) is a plain text format for annotating
features on biological sequences. Each feature record has nine tab-separated
columns, which identify the reference sequence, feature type, coordinates, strand
and associated attributes.

Features can include genes, messenger RNAs (mRNAs), exons, coding sequences (CDSs)
and non-coding RNAs. Feature types use Sequence Ontology terms. The ``ID`` and
``Parent`` attributes describe relationships between features, such as exons
belonging to a transcript and a transcript belonging to a gene.

ENA has now implemented a specification as part of decoupled annotation. This
document outlines the submission process and format accepted at ENA. In the
decoupled workflow, the GFF3 annotation is submitted separately from the
nucleotide sequence and refers to sequences that have already been submitted
and accessioned.

Before you start
----------------

Please make sure you have the following before preparing your annotation
submission:

* A Webin submission account and credentials.
* The underlying sequence data in ENA. If you are submitting new sequences,
  register the study and sample and complete the sequence submission first as
  outlined in the `genome assembly submission guide
  <https://ena-docs.readthedocs.io/en/latest/submit/assembly.html>`__.
* Identifiers for the exact sequence records being annotated. For accessioned
  sequences, use the appropriate sequence accession and version consistently
  throughout the GFF3 file.
* A study accession for the annotation submission. This will differ from the
  assembly's study accession if the annotation submitter is not the original
  assembly submitter.
* The primary identifier for the annotation manifest: an INSDC genome assembly
  identifier (``GCA_xx``) or an INSDC sequence accession for a targeted sequence.
* A registered locus tag prefix when submitting genome gene annotation. Use the
  same locus tag for a gene and its component features. You can read more about
  this in the `locus tag guide
  <https://ena-docs.readthedocs.io/en/latest/submit/general-guide/locus-tags.html>`__.

Submitting the underlying sequences
-----------------------------------

Submit genome sequences separately with the ``genome`` context and a gzipped
FASTA file. Use the ``annotation`` context for GFF3.

GFF3 submission requirements
----------------------------

The requirements in this section outline ENA GFF3 specification. These are based
upon Lincoln Stein's SO GFF3 specification, but allow less flexibility and
reduced ambiguity.

General file rules
~~~~~~~~~~~~~~~~~~

* Use ASCII characters and separate the nine feature columns with literal tab
  characters.
* Begin the file with a ``##gff-version`` directive, for example
  ``##gff-version 3``.
* Provide one ``##sequence-region`` directive for every reference sequence used
  by the features. Place it before the features for that sequence.
* Use sequence identifiers that refer to the underlying nucleotide records.
  Keep each identifier identical in column 1 and its ``##sequence-region``
  directive.
* Use one-based, inclusive coordinates. Normally the start must be less than or
  equal to end, including on the reverse strand.
* The relevant nucleotide sequences should be present in the referenced
  sequence submission. An embedded ``##FASTA`` section is used only for peptide
  sequences.
* The recommended ordering is by sequence ID, with parents before descendants
  and siblings sorted by start and then end.

GFF3 file content
~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 8 16 76

   * - Column
     - Field
     - What to provide
   * - 1
     - ``seqid``
     - The reference sequence identifier used for the feature coordinates.
   * - 2
     - ``source``
     - The annotation source or software name; use ``.`` if unspecified.
   * - 3
     - ``type``
     - An ENA-supported Sequence Ontology feature type, such as ``gene``,
       ``mRNA``, ``exon`` or ``CDS``.
   * - 4
     - ``start``
     - The first coordinate, using one-based numbering.
   * - 5
     - ``end``
     - The last coordinate, inclusive. See circular sequences below for
       origin-spanning features.
   * - 6
     - ``score``
     - A numeric score, or ``.`` if no score is supplied.
   * - 7
     - ``strand``
     - ``+`` or ``-``; base GFF3 also defines ``.`` for unstranded features and
       ``?`` for unknown strand.
   * - 8
     - ``phase``
     - For each CDS row, ``0``, ``1`` or ``2``. Use ``.`` for other feature types.
   * - 9
     - ``attributes``
     - Semicolon-separated ``tag=value`` attributes describing the feature.

CDS phase identifies how many bases from the biological start of the current
CDS interval precede the next complete codon. Read it from the start coordinate
on the forward strand and the end coordinate on the reverse strand.

Feature types must belong to the sequence-feature branch of the Sequence
Ontology, through an ``is_a`` or ``part_of`` relationship to
``sequence_feature`` (``SO:0000110``).

GFF3 metadata requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 36 64

   * - Directive
     - Submission guidance
   * - ``##gff-version 3``
     - Required first line. Identifies the GFF format version.
   * - ``##sequence-region seqid start end``
     - Required for each reference sequence. Give its coordinate bounds before
       its features.
   * - ``##species URI``
     - Supply a taxonomy URI containing the taxon ID for annotation validation;
       do not substitute an organism name.
   * - ``##FASTA``
     - Optional peptide sequence section. Do not embed nucleotide sequences
       here.

Attributes and feature relationships
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 22 78

   * - Attribute
     - Requirement and use
   * - ``ID``
     - Required for a feature with children or a feature represented on multiple
       rows. Each ID identifies one feature within the file.
   * - ``Parent``
     - Required when a feature has a parent. The value must refer to the parent
       feature ID. Each row must have only one parent.
   * - ``locus_tag``
     - Required for genes and their component features in genome gene
       annotation. Optional for other gene annotation. Use a registered prefix.
   * - ``transl_table``
     - Required on a translated CDS unless a file-level declaration defines the
       applicable table. Omit it for pseudogene CDS features.
   * - ``partial``
     - Required when an outer feature boundary is incomplete. Use ``start`` or
       ``end`` or ``start,end`` in the biological orientation.
   * - ``protein_id``
     - Not required for a new submission. When updating an existing annotation,
       provide the existing protein identifier on the updated CDS.
   * - ``transcript_id``
     - Optional. If supplied, use a unique value within the genome or GFF3 file
       and it needs to be without spaces.
   * - ``Dbxref`` and ``Note``
     - Optional cross-references and free text. Database tags in ``Dbxref`` must
       follow the `INSDC controlled vocabulary
       <https://www.insdc.org/submitting-standards/dbxref-qualifier-vocabulary/>`__.

.. note::

   Attribute names are case sensitive. Use the exact spelling of ``ID``,
   ``Parent``, ``Dbxref`` and ``Note``. Separate attributes with semicolons.

For a discontinuous feature, use the same ID on each row that represents part
of that one feature. If an exon belongs to more than one transcript, represent
it in separate rows with one parent per row; use separate feature IDs where
IDs are supplied.

Including a gene feature for each gene model is strongly recommended in the
submission.

Reserved characters
~~~~~~~~~~~~~~~~~~~

Percent-encode reserved characters when they occur as literal content in
attribute values. Keep semicolons and equals signs that serve as attribute
separators.

.. list-table::
   :header-rows: 1
   :widths: 60 40

   * - Literal character
     - Encoding
   * - Percent sign ``%``
     - ``%25``
   * - Semicolon ``;``
     - ``%3B``
   * - Equals sign ``=``
     - ``%3D``
   * - Ampersand ``&``
     - ``%26``
   * - Comma ``,``
     - ``%2C``

Example:

.. code-block:: text

   product=ribosomal protein L36%2C isoform B
   gene_synonym=dSkip-1,dSKP1,dskpA,SKP1

The ``product`` line describes one product containing a literal comma. The
``gene_synonym`` line lists four gene synonyms.

Peptide sequences
~~~~~~~~~~~~~~~~~

If you supply peptide sequences after ``##FASTA``, make each peptide identifier
match the corresponding CDS ``protein_id``, if present, or the CDS ``ID``.
Supplied peptides should match the conceptual translation unless a supported
translation exception applies.

Preparing your GFF3 file
------------------------

The example below illustrates a targeted-sequence gene model on the forward
strand.

.. code-block:: text

   ##gff-version 3
   ##sequence-region SEQ1.1 1 1000
   ##species https://www.ebi.ac.uk/ena/taxonomy/rest/tax-id/6239
   SEQ1.1	.	gene	100	600	.	+	.	ID=g1
   SEQ1.1	.	mRNA	100	600	.	+	.	ID=t1;Parent=g1
   SEQ1.1	.	exon	100	249	.	+	.	ID=e1;Parent=t1
   SEQ1.1	.	exon	400	600	.	+	.	ID=e2;Parent=t1
   SEQ1.1	.	CDS	130	249	.	+	0	ID=c1;Parent=t1;product=example;transl_table=1
   SEQ1.1	.	CDS	400	582	.	+	0	ID=c1;Parent=t1;product=example;transl_table=1

* The transcript ``t1`` belongs to gene ``g1``; both exons and the CDS belong to
  ``t1``.
* The two CDS rows share ``ID=c1`` because they describe two intervals of one
  coding sequence.
* The first CDS interval is 120 bases long, so the second interval also starts
  with phase 0. Check phase and translation against the actual nucleotide
  sequence.
* For genome gene annotation, add the same registered ``locus_tag`` to the gene
  and its component features. Distinct genes require distinct locus tags.

Partial features
~~~~~~~~~~~~~~~~

Use ``partial=start`` or ``partial=end`` or ``partial=start,end`` for incomplete
outer boundaries. On the forward strand, the biological start is the lower
coordinate. On the reverse strand, it is the higher coordinate. Do not use
``partial`` to describe an uncertain internal splice junction.

Circular sequences
~~~~~~~~~~~~~~~~~~

The topology recorded for the underlying sequence determines whether
origin-spanning annotation is allowed. An ``Is_circular=true`` attribute on a
landmark feature does not replace the topology on the sequence record.

For a circular sequence of length 15,000, a feature running from position 14,700
through the origin to position 600 is represented with start ``14700`` and end
``15600``. The end is the biological end plus the sequence length. Shift child
feature coordinates consistently into the same coordinate space.

The figure below shows:

a) a schematic visualisation of a gene feature that crosses the origin of a
   circular nucleic acid of 15000 bp in length.
b) the GFF3 implementation of a snippet.

Note that the gene and all the features follow the same convention of
end = the biological end coordinate + the length of the sequence.

.. The original PDF figure is preserved below. Its circular schematic labels
   a CDS from 4900 to 200, whereas the prose and embedded GFF3 snippet use
   a 15000-base sequence and coordinates 14700 to 15600.

.. figure:: ../images/gff3-circular-sequence.png
   :alt: Original two-panel figure showing a circular sequence with a CDS
         crossing the origin and a GFF3 snippet using coordinates 14700 to 15600.
   :width: 700px
   :align: center

Other annotation cases
~~~~~~~~~~~~~~~~~~~~~~

Use the following conventions where applicable.

.. list-table::
   :header-rows: 1
   :widths: 22 78

   * - Case
     - Guidance
   * - Pseudogenes
     - Use standard feature types with the appropriate ``pseudo=true`` or
       ``pseudogene`` attribute. Omit ``transl_table`` for pseudogene CDS
       features.
   * - Assembly gaps
     - Use ``gap`` with a controlled ``gap_type`` and ``estimated_length``, which
       is an integer or ``unknown``.
   * - tRNA anticodons
     - Represent an anticodon as a child of the tRNA, within its exon bounds.
       Include ``amino_acid`` using the full amino acid name.
   * - Atypical interval order
     - Use ``part`` to specify interval order where coordinate sorting is
       insufficient.

Submitting with Webin CLI
-------------------------

Decoupled annotation files are validated and submitted to the ENA using
Webin-CLI. You will use ``-context annotation`` and
``ANALYSIS_TYPE DECOUPLED_ANNOTATION``. The annotation manifest is separate from
the manifest used to submit the underlying sequences.

Prepare the manifest
~~~~~~~~~~~~~~~~~~~~

Create a plain text, tab-separated manifest. Replace every value in angle
brackets with your own value.

.. The PDF names the study field STUDY_ID in this table but uses STUDY in
   both manifest examples. Both forms have been retained as written.

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - Field
     - Value to provide
   * - ``NAME``
     - A name for the annotation submission.
   * - ``STUDY_ID``
     - The study accession for the annotation.
   * - ``ANALYSIS_TYPE``
     - ``DECOUPLED_ANNOTATION``.
   * - ``PRIMARY_ID``
     - Assembly: The genome assembly identifier. Targeted sequence: the INSDC
       sequence accession.
   * - ``GFF3``
     - The GFF3 file path, for example ``annotation.gff3``.
   * - ``DESCRIPTION``
     - A description of the annotation.

WGS annotation manifest
^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: text

   NAME	<ANNOTATION_NAME>
   STUDY	<STUDY ACCESSION>
   ANALYSIS_TYPE	DECOUPLED_ANNOTATION
   PRIMARY_ID	<GC_ID> e.g. GCA_12345.2
   GFF3	annotation.gff3
   DESCRIPTION	<ANNOTATION_DESCRIPTION>

Targeted sequence annotation manifest
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: text

   NAME	<ANNOTATION_NAME>
   STUDY	<STUDY ACCESSION>
   GFF3	annotation.gff3
   ANALYSIS_TYPE	DECOUPLED_ANNOTATION
   PRIMARY_ID	<INSDC_ACCESSION>
   DESCRIPTION	<ANNOTATION_DESCRIPTION>

Validate the GFF3 file
~~~~~~~~~~~~~~~~~~~~~~

You can validate your GFF3 file prior to submission using Webin-CLI:

.. code-block:: bash

   java -jar webin-cli-11.0.0.jar \
     -context annotation \
     -manifest manifest.txt \
     -username "<WEBIN_USERNAME>" \
     -password "<WEBIN_PASSWORD>" \
     -outputDir output \
     -validate

Submit the GFF3 file
~~~~~~~~~~~~~~~~~~~~

You can submit your GFF3 file with Webin-CLI using ``-submit``:

.. code-block:: bash

   java -jar webin-cli-11.0.0.jar \
     -context annotation \
     -manifest manifest.txt \
     -username "<WEBIN_USERNAME>" \
     -password "<WEBIN_PASSWORD>" \
     -outputDir output \
     -submit

Webin-CLI performs validation and handles the upload as part of submission.
You do not need to pre-upload files or register their MD5 checksums separately
when using Webin-CLI.

Common errors
-------------

Use the validation report to identify the affected record and field. The checks
below summarise common problems to resolve before resubmitting.

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - Problem to check
     - What to review
   * - Incorrect column count
     - Use nine columns separated by tabs. Keep tabs and line breaks out of
       attribute values.
   * - Reference sequence not found
     - Check the exact sequence identifier and version and confirm that the
       sequence exists in the service environment you are using.
   * - Missing sequence region
     - Add a matching ``##sequence-region`` before the features for each
       sequence.
   * - Coordinates outside bounds
     - Check the coordinate system, inclusive end coordinate and sequence
       length. Use origin-spanning coordinates only for a sequence recorded
       as circular.
   * - Broken feature relationships
     - Make every ``Parent`` resolve to an ``ID``. Use one parent per row and
       reserve repeated IDs for intervals of one feature.
   * - Missing genome locus tags
     - Apply the registered prefix and use the same ``locus_tag`` across each
       gene model.
   * - CDS translation problems
     - Check phase for every CDS interval, the genetic code, sequence strand
       and any supported translation exception.
   * - Incorrect attribute parsing
     - Check case-sensitive attribute names and percent-encode reserved
       characters inside values.
