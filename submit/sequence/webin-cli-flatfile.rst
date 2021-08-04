=================================================
Submit Targeted Sequence Flatfiles with Webin-CLI
=================================================


Introduction
============


Submission of targeted sequences may be done using `Webin-CLI <../general-guide/webin-cli.html>`_ as described in this
page's parent page: `How to Submit Targeted Sequences <../sequence.html>`_.
The native format for annotated sequences in ENA is the `EMBL flat file format <../fileprep/flat-file-example.html>`_.
You may prepare your annotated targeted sequence in this format and submit it directly to us, subject to it passing
validation.

Because of the highly flexible nature of the format and the diversity of sequences which may be submitted in it, this
page does not provide prescriptive information on how to prepare your file, but lists some useful resources.


Tips On Preparing Your File
===========================


If you are not familiar, please see an example of the `EMBL flat file format <../fileprep/flat-file-example.html>`_.
When you have completed your file, you must compress it with GZIP or BZIP2.


Flat File Format Description
----------------------------


When preparing a flat file using the above, note a few things:

- The sections which read 'XXX' will be automatically filled by our pipeline on submission, and anything you write here
  will be overwritten
- Information on centre name and address, and author names, is autofilled into the 'RX' lines (RN, RP, RA, etc.)

  - Anything you write here will not be retained, and will be overwritten by the centre and contact information
    associated with your account, so please ensure this is correct before you submit

- The feature table section (FT lines) are where your annotation should be inserted

  - The first column of the feature table should name the 'feature', e.g. source, gene, intron
  - Each feature need only be named once: following lines are treated as part of the same feature, until a new feature
    is named
  - The second column names qualifiers which provide information about the feature and starts with a '/' character,
    e.g. /organism, /gene, /product

- Each sequence entry must contain exactly one source feature, which names the biological origin of the record

  - This must include one /organism qualifier which must match with the scientific name of a species-rank taxon in the
    NCBI Taxonomy database
  - See `tips for sample taxonomy <../../faq/taxonomy.html>`_ for help with how to identify an appropriate name

- A flat file may contain multiple sequence records, which should be separated within the file by a single line which
  contains only ``//``


Flat File Preparation Resources
-------------------------------


There are various tools which can help you with the preparation of your flat file, some of which are listed in our
`Third Party Tools page <../../faq/third_party_tools.html>`_.

`Entry Upload Templates <../fileprep/sequence_flatfile.html>`_
  Some flat file templates are provided at the linked page which may help with the preparation of some submissions.
  These are different from the checklist-based templates available from the Webin Submissions Portal, described
  elsewhere in this documentation.

`WebFeat <https://www.ebi.ac.uk/ena/WebFeat/>`_
  This is where we provide a comprehensive directory of the available features and qualifiers you may use in your
  flat files, as well as information on how they should be used

`Webin-CLI Validator <../sequence.html>`_
  When you submit your flat file you will do so via Webin-CLI.
  The above links back to the parent of this page which describes submission of flat files via Webin-CLI.
  This tool includes a validation mode able to point out errors in your file which would prevent it from being
  submitted.
  While being valid may not be the same as being complete and well-annotated, this is a useful check you can do.

`EMBLmyGFF3 <https://github.com/NBISweden/EMBLmyGFF3>`_
  If you have your annotation in GFF3 format already, this tool created by staff at NBI Sweden can be used to convert
  them to EMBL flat file format.
  Read more in the `Third Party Tools page <../../faq/third_party_tools.html>`_.

`annonex2embl <https://github.com/michaelgruenstaeudl/annonex2embl>`_
  For multiple sequence alignments in NEXUS format with annotation, this tool is available for conversion to
  EMBL flat file format.
  Read more in the `Third Party Tools page <../../faq/third_party_tools.html>`_.
