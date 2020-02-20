=====================
Sequence Data Classes
=====================

The ENA archives and displays many different classes of nucleotide sequence. These sequences are separate to the
standard raw read or assembly formats listed in the `General Guide <../>`_ and the records are meant to represent specific
coding/non-coding regions or informative short genetic sequences as opposed to capturing the whole genomic material of
an organism.

These sequences are those which were submitted as `targeted sequence <../../submit/sequence.html>`_ submissions or
were derived from the high-level assembly or annotation of an assembly.

Most sequences are of data-class STD including coding non-coding regions of assemblies

Two additional records listed are derived from genome assembly submissions:

1. CON records - these are high-level constructs of a genome assembly such as individual scaffolds or chromosomes
   (including fully assembled organelles and plasmids). These are held in the archive as individual sequence records
   rather than a full set (like contig level assemblies). They are validated to be high completeness.

2. WGS sequence records - these are not to be confused with the contig sets themselves. WGS sequence records represent
   specific locations of the contig set that are annotated such as coding/non-coding regions. These are derived from
   annotated contig set submissions. The accession for these is derived from the contig set prefix followed by the
   contig number then the location, then the annotation (e.g. AAAABD010000136.1:1193..1283:tRNA).

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
|               |                | | coding) of a Whole Genome Shotgun contig level assembly   | `AAAABD01`_    |
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
.. _`AAAABD01` : https://www.ebi.ac.uk/ena/browser/view/AAAABD010000136.1:1193..1283:tRNA
.. _`KXS48886` : https://www.ebi.ac.uk/ena/browser/view/KXS48886
