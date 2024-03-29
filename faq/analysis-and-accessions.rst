========================
Analyses and Accessions
========================


ENA accepts different types of secondary analyses such as assemblies, assembled and annotated sequences and other
analyses as ‘Analysis’ submissions.

.. image:: images/metadata_model_assembly.png
   :align: center

For each submission, Webin will report an analysis accession number (ERZxxxxxx) which can be used to track the status
of any post-submission processing. This may or may not be later released with your submission. Some submissions will
also receive post-processing accession numbers. This section lists the various submissions that are considered as
‘Analyses’, their respective accession numbers that will be generated depending on the submission type and if they
will be available publicly or not.


+---------------------------------+-----------------------------+------------------+------------------------------+
| **Submission type**             | **Accessions**              | **Final status** | **Examples**                 |
+---------------------------------+-----------------------------+------------------+------------------------------+
| | **Genome Assembly**           | | Analysis accession        | | Confidential   | ERZxxxxxx (in `Webin Portal  |
| |                               |                             |                  | <https://www.ebi.ac.uk/ena/  |
| |                               |                             |                  | submit/webin/login>`_)       |
| |                               +-----------------------------+------------------+------------------------------+
| |                               | | Genome assembly accession |                  | `GCA_000002305 <https://www. |
| | Accessions are assigned based | | (excludes viruses)        | | Public         | ebi.ac.uk/ena/browser/       |
| | on the `assembly level <https |                             |                  | view/GCA_000002305.1>`_      |
|   ://ena-docs.readthedocs.io/en/+-----------------------------+                  +------------------------------+
|   latest/submit/assembly.       | | Contig accession          |                  | `AAWR02000000 <https://www.  |
|   html#assembly-levels>`_       |                             |                  | ebi.ac.uk/ena/browser/view/  |
| | submitted(Contig/scaffold/    |                             |                  | AAWR02000000>`_              |
| | chromosome)                   +-----------------------------+                  +------------------------------+
|                                 | | Scaffold accession        |                  | `LR607392 <https://www.ebi.  |
|                                 |                             |                  | ac.uk/ena/browser/view/      |
|                                 |                             |                  | LR607392>`_                  |
|                                 +-----------------------------+                  +------------------------------+
|                                 | | Chromosome accession      |                  | `CM000377 <https://www.ebi.  |
|                                 |                             |                  | ac.uk/ena/browser/view/      |
|                                 |                             |                  | CM000377.2>`_                |
+---------------------------------+-----------------------------+------------------+------------------------------+
| | **Metagenome-Assembled**      | | Analysis accession        | | Confidential   | ERZxxxxxx (in `Webin Portal  |
| | **Genome(MAG)**               |                             |                  | <https://www.ebi.ac.uk/ena/  |
| |                               |                             |                  | submit/webin/login>`_)       |
| |                               +-----------------------------+------------------+------------------------------+
| | Accessions are assigned based | | Genome assembly accession | | Public         | `GCA_902751345 <https://     |
| | on the `assembly level <https |                             |                  | www.ebi.ac.uk/ena/browser/   |
|   ://ena-docs.readthedocs.io/en/|                             |                  | view/GCA_902751345>`_        |
|   latest/submit/assembly.       +-----------------------------+                  +------------------------------+
|   html#assembly-levels>`_       | | Contig accession          |                  | `CADDJA01 <https://www.      |
| | submitted(Contig/chromosome)  |                             |                  | ebi.ac.uk/ena/browser/view/  |
|                                 |                             |                  | CADDJA01>`_                  |
|                                 +-----------------------------+                  +------------------------------+
|                                 | | Chromosome accession      |                  | `LR615885 <https://www.ebi.  |
|                                 |                             |                  | ac.uk/ena/browser/view/      |
|                                 |                             |                  | LR615885>`_                  |
+---------------------------------+-----------------------------+------------------+------------------------------+
| | **Primary Metagenome**        | | Analysis accession        | |  Public        | `ERZ1091679 <https://www.    |
| | **Assembly**                  |                             |                  | ebi.ac.uk/ena/browser/view/  |
|                                 |                             |                  | ERZ1091679>`_                |
+---------------------------------+-----------------------------+------------------+------------------------------+
| | **Binned Metagenome**         | | Analysis accession        | |  Public        | `ERZ1100281 <https://www.    |
| | **Assembly**                  |                             |                  | ebi.ac.uk/ena/browser/view/  |
|                                 |                             |                  | ERZ1100281>`_                |
+---------------------------------+-----------------------------+------------------+------------------------------+
| | **Environmental Single-cell** | | Analysis accession        | | Confidential   | ERZxxxxxx (in `Webin Portal  |
| | **Amplified Genome Assembly** |                             |                  | <https://www.ebi.ac.uk/ena/  |
| | **(SAG)**                     |                             |                  | submit/webin/login>`_)       |
| |                               +-----------------------------+------------------+------------------------------+
| | Accessions are assigned based | | Genome assembly accession | | Public         | `GCA_947596155 <https://     |
| | on the `assembly level <https:|                             |                  | www.ebi.ac.uk/ena/browser/   |
|   //ena-docs.readthedocs.io/en/ |                             |                  | view/GCA_947596155>`_        |
|   latest/submit/assembly.       +-----------------------------+                  +------------------------------+
|   html#assembly-levels>`_       |   Contig accession          |                  | `CANQEY01 <https://www.      |
| | submitted(Contig/chromosome)  |                             |                  | ebi.ac.uk/ena/browser/view/  |
|                                 |                             |                  | CANQEY01>`_                  |
|                                 +-----------------------------+                  +------------------------------+
|                                 | | Chromosome accession      |                  | `OX384529 <https://www.ebi.  |
|                                 |                             |                  | ac.uk/ena/browser/view/      |
|                                 |                             |                  | OX384529>`_                  |
+---------------------------------+-----------------------------+------------------+------------------------------+
| | **Transcriptome/**            | | Analysis accession        | | Confidential   | ERZxxxxxx (in `Webin Portal  |
| | **Metatranscriptome Assembly**|                             |                  | <https://www.ebi.ac.uk/ena/  |
|                                 |                             |                  | submit/webin/login>`_)       |
|                                 +-----------------------------+------------------+------------------------------+
|                                 | | Sequence accession        | | Public         | `GAAJ01000000 <https://      |
|                                 |                             |                  | www.ebi.ac.uk/ena/browser/   |
|                                 |                             |                  | view/GAAJ01000000>`_         |
+---------------------------------+-----------------------------+------------------+------------------------------+
|  **SARS-CoV-2 Assembly**        | | Analysis accession        | | Public         | `ERZ1937728 <https://        |
|                                 |                             |                  | www.ebi.ac.uk/ena/browser/   |
|                                 |                             |                  | view/ERZ1937728>`_           |
|                                 +-----------------------------+                  +------------------------------+
|                                 | | Sequence accession        |                  | `FR989630 <https:// www.ebi  |
|                                 |                             |                  | .ac.uk/ena/browser/view      |
|                                 |                             |                  | /FR989630>`_                 |
+---------------------------------+-----------------------------+------------------+------------------------------+
|  **Targeted Sequences**         | | Analysis accession        | | Confidential   | ERZxxxxxx (in `Webin Portal  |
|                                 |                             |                  | <https://www.ebi.ac.uk/ena/  |
|                                 |                             |                  | submit/webin/login>`_)       |
|                                 +-----------------------------+------------------+------------------------------+
|                                 | | Sequence accession        | | Public         | `OX458330 <https://www.ebi   |
|                                 |                             |                  | .ac.uk/ena/browser/view/     |
|                                 |                             |                  | OX458330>`_                  |
+---------------------------------+-----------------------------+------------------+------------------------------+
|   **Other Analyses**            | | Analysis accession        | | Public         | | `ERZ295521 <https://       |
|                                 |                             |                  |   www.ebi.ac.uk/ena/browser/ |
|                                 |                             |                  |   view/ERZ295521>`_          |
|                                 |                             |                  | | `ERZ000003 <https://www.ebi|
|                                 |                             |                  |   .ac.uk/ena/browser/view    |
|                                 |                             |                  |   /ERZ000003>`_              |
+---------------------------------+-----------------------------+------------------+------------------------------+
