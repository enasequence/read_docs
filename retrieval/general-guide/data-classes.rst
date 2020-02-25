=====================
Sequence Data Classes
=====================

The ENA archives and displays different data classes of nucleotide sequence which fall under the three tiers of ENA:
reads, assembly and annotation. These sequences are separate to the standard raw read *Runs/Experiments* or *Assembly* 
records listed in the `General Guide <../>`_. Sequence records often represent specific areas of genetic interest as 
opposed to capturing the whole genomic material of an organism.

Sequence records can be specific coding/non-coding regions derived from an annotated submission, submissions 
of individual targeted sequences of interest, or high-level assembly sequences such as scaffolds or chromosomes.

Sequence records and are all available in EMBL or FASTA format.

+---------------+----------------+-------------------------------------------------------------+----------------+
| **Data Tier** | **Data Class** | | **Definition**                                            | **Example**    |
+---------------+----------------+-------------------------------------------------------------+----------------+
| Reads         | EST            | | A record representing raw expressed sequence tag sequence | `AL022645`_    |
|               |                | | data (no qualities) and sample/library information        |                |
|               +----------------+-------------------------------------------------------------+----------------+
|               | GSS            | | A record representing genome survey sequence; single      | `AG007113`_    |
|               |                | | pass, single direction sequence                           |                |
|               +----------------+-------------------------------------------------------------+----------------+
|               | STS            | | A record representing a sequence tagged site              | `AL022542`_    |
+---------------+----------------+-------------------------------------------------------------+----------------+
| Assembly      | CON            | | A record representing high level (scaffold upwards)       | `DS830848`_    |
|               |                | | assembly information, constructed sequence and optional   |                |
|               |                | | annotation.                                               |                |
|               +----------------+-------------------------------------------------------------+----------------+
|               | TSA            | | A Transcriptome Shotgun Assembly record                   | `EZ000160`_    |
|               +----------------+-------------------------------------------------------------+----------------+
|               | TPA            | | A Third PArty sequence data record                        |  `BN000166`_   |
+---------------+----------------+-------------------------------------------------------------+----------------+
| Annotation    | HTC            | | A record representing high throughput assembled           | `AL122108`_    |
|               |                | | transcriptomic sequence and optional annotation           |                |
|               +----------------+-------------------------------------------------------------+----------------+
|               | HTG            | | A record representing high throughput assembled genomic   | `AC011759`_    |
|               |                | | sequence and optional annotation                          |                |
|               +----------------+-------------------------------------------------------------+----------------+
|               | STD            | | A record representing standard targeted annotated         | `AJ005668`_    |
|               |                | | assembled sequence or derived annotation                  |                |
|               +----------------+-------------------------------------------------------------+----------------+
|               | PAT            | | A record representing a sequence associated with a patent | `A77200`_      |
|               |                | | process                                                   |                |
|               +----------------+-------------------------------------------------------------+----------------+
|               | WGS            | | A record representing an annotated region (coding or non  | `KXS48886`_    |
|               |                | | coding) of a Whole Genome Shotgun contig level assembly   |                |
+---------------+----------------+-------------------------------------------------------------+----------------+

.. _`AL022645` : https://www.ebi.ac.uk/ena/browser/view/AL022645
.. _`AG007113` : https://www.ebi.ac.uk/ena/browser/view/AG007113
.. _`AL022542` : https://www.ebi.ac.uk/ena/browser/view/AL022542
.. _`DS830848` : https://www.ebi.ac.uk/ena/browser/view/DS830848
.. _`EZ000160` : https://www.ebi.ac.uk/ena/browser/view/EZ000160
.. _`BN000166` : https://www.ebi.ac.uk/ena/browser/view/BN000166
.. _`AL122108` : https://www.ebi.ac.uk/ena/browser/view/AL122108
.. _`AC011759` : https://www.ebi.ac.uk/ena/browser/view/AC011759
.. _`AJ005668` : https://www.ebi.ac.uk/ena/browser/view/AJ005668
.. _`A77200` : https://www.ebi.ac.uk/ena/browser/view/A77200
.. _`KXS48886` : https://www.ebi.ac.uk/ena/browser/view/KXS48886
