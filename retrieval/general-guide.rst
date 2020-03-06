===================================
General Guide on ENA Data Retrieval
===================================

Welcome to the general guide for the European Nucleotide Archive data discovery and retrieval.
Please take some time to view this introduction and explore all the options available for
our data retrieval services.

Viewing and Exploring ENA Records
=================================

The table below summarises the Domains of data held within ENA and example records that are archived within 
each domain and displayed within the `ENA Browser <https://www.ebi.ac.uk/ena/browser/home>`_. 
Please see our *How To* guide on exploring an ENA project for an example of how to navigate through an 
ENA Project in the browser:

.. toctree::
   :maxdepth: 1
   
   ena-project

+-----------------------+-----------------------------------------+-----------------------------+
| **Data Domain**       | **Description**                         | **Example Records**         |
+-----------------------+-----------------------------------------+-----------------------------+
| Projects/Studies      | | Contains information on a biological  | `PRJEB1787 (ERP001736)`_    |
|                       | | research project. This holds all the  |                             |
|                       | | data generated as part of this        |                             |
|                       | | research                              |                             |
+-----------------------+-----------------------------------------+-----------------------------+
| Samples               | | Represents biological samples         | `SAMEA2620084 (ERS488919)`_ |
|                       | | collected and sequenced in real life  |                             |
+-----------------------+-----------------------------------------+-----------------------------+
| Runs/Experiments      | | Hold raw read files and sequencing    | | `ERR1701760`_             |
|                       | | methods                               | | `ERX1772048`_             |
+-----------------------+-----------------------------------------+-----------------------------+
| Analyses              | | Hold results files of analyses        | `ERZ1195979`_               |
|                       | | performed on sequencing data and      |                             |
|                       | | analysis methods                      |                             |
+-----------------------+-----------------------------------------+-----------------------------+
| Contig set            | | Hold contig sets generated as part of |  `CABHOY010000000.1`_       |
|                       | | a genome or transcriptome assembly.   |                             |
+-----------------------+-----------------------------------------+-----------------------------+
| Assemblies            | | Represents an entire genome assembly  | `GCA_000001405.28`_         |
|                       | | and holds any contig sets or sequence |                             |
|                       | | records generated as part of the      |                             |
|                       | | assembly                              |                             |
+-----------------------+-----------------------------------------+-----------------------------+
| | Assembled/Annotated | | Any sequence records from coding or   | `CM000667.2`_               |
| | Sequences (*)       | | non-coding regions to full assembled  |                             |
|                       | | chromosomes                           |                             |
+-----------------------+-----------------------------------------+-----------------------------+
| Taxon                 | | The sequenced organism or metagenome  | `Taxon:9606`_               |
|                       | | of a sample                           |                             |
+-----------------------+-----------------------------------------+-----------------------------+
| Sample Checklist      | | The checklist of metadata that the    | `ERC000013`_                |
|                       | | sample was registered with            |                             |
+-----------------------+-----------------------------------------+-----------------------------+

.. _`PRJEB1787 (ERP001736)`: https://www.ebi.ac.uk/ena/browser/view/PRJEB1787
.. _`SAMEA2620084 (ERS488919)`: https://www.ebi.ac.uk/ena/browser/view/SAMEA2620084
.. _`ERR1701760`: https://www.ebi.ac.uk/ena/browser/view/ERR1701760
.. _`ERX1772048`: https://www.ebi.ac.uk/ena/browser/view/ERX1772048
.. _`ERZ1195979`: https://www.ebi.ac.uk/ena/browser/view/ERZ1195979
.. _`CABHOY010000000.1`: https://www.ebi.ac.uk/ena/browser/view/CABHOY010000000.1
.. _`GCA_000001405.28`: https://www.ebi.ac.uk/ena/browser/view/GCA_000001405.28
.. _`CM000667.2`: https://www.ebi.ac.uk/ena/browser/view/CM000667.2
.. _`Taxon:9606`: https://www.ebi.ac.uk/ena/browser/view/Taxon:9606
.. _`ERC000013`: https://www.ebi.ac.uk/ena/browser/view/ERC000013

\* Assembled and annotated sequence records fall into different Data Classes. Read 
more about the different classes of sequences `here <./general-guide/data-classes.html>`_.

Search and Retrieval
====================

You can search across the ENA browser in a number of ways:

- `free text search <https://www.ebi.ac.uk/ena/browser/text-search>`_
- `sequence similarity search <https://www.ebi.ac.uk/ena/browser/sequence-search>`_
- `cross-reference search <https://www.ebi.ac.uk/ena/browser/xref>`_
- `advanced search <https://www.ebi.ac.uk/ena/browser/advanced-search>`_

The advanced search in the browser provides a simple interface for building more complex search queries that can be saved and run again with `Rulespace <https://www.ebi.ac.uk/ena/browser/rulespace>`_. See our step by step guide on how to use the advanced search for examples on how to build queries and how to use Rulespace:

.. toctree::
   :maxdepth: 1

   advanced-search

The ENA Browser also provides different means to download data from the archive whether its XML ENA records,
a tabulated summary of metadata resulting from a search or sequencing data files submitted as part of a research
project. See our guide on file download for details on how to use our data retrieval services
to download data from the archive:

.. toctree::
   :maxdepth: 1
   
   file-download

Programmatic Access
===================

When working with a large number of records or when developing an automated pipeline, it can be preferable
to explore and interact with the programmatic services that ENA has to offer.

Once you are familiar with how ENA records are linked and what data are available associated with each record,
please explore our more advanced guides foraccessing data from the archive programmatically:

.. toctree::
   :maxdepth: 1
   
   programmatic-access
