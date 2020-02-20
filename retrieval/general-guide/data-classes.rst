=====================
Sequence Data Classes
=====================

The ENA archives and displays many different classes of nucleotide sequence. These sequences are separate to the
standard raw read or assembly formats listed in the `General Guide <../>`_ and these records are meant to represent specific
coding/non-coding regions or individual targeted, assembled and annotated sequences as opposed to capturing the whole
genomic material of an organism.

These sequences are those which were submitted as `targeted sequence <../../submit/sequence.html>`_ submissions or
were derived from the high-level assembly or annotation of an assembly.

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
|               | WGS            | | A record representing an annotated region (coding or non  | Annotation for |
|               |                | | coding) of a Whole Genome Shotgun contig level assembly   | `KXS48886`_    |
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
.. https://www.ebi.ac.uk/ena/browser/view/AAAABD010000136.1:1193..1283:tRNA
.. _`KXS48886` : https://www.ebi.ac.uk/ena/browser/view/KXS48886
