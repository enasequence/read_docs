==================================
How to Access ENA Programmatically
==================================

There are a number of REST APIs available for programmatic access of the European Nucleotide Archive.
These enable programmatic access to the functionality of the ENA Advanced Search as well as direct download of ENA
records and associated files.

Please see the relevant guides below for examples and tutorials on ENA programmatic
data access and retrieval.

.. note::
   Our programmatic guides are not yet complete - these will be coming soon! If you have any questions about
   topics mentioned in this guide which are not yet covered please contact us via our
   `support form <https://www.ebi.ac.uk/ena/browser/support>`_.

Perform Searches
================

All functionalities of the ENA Advanced Search can be performed programmatically using a combination of the
`ENA Portal API <https://www.ebi.ac.uk/ena/portal/api/>`_ and the
`ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_.

You can further explore related records outside of the
European Nucleotide Archive by programmatically accessing the
`ENA Cross Reference Service <https://www.ebi.ac.uk/ena/xref/rest/>`_.

For examples and tutorials on how to use these APIs, please see the guidelines below:

.. toctree::
   :maxdepth: 1

   retrieval/advanced-search
   retrieval/cross-reference

Retrieve and Download Records
=============================

All public records within ENA are available from within the `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_
so records can be programmatically downloaded directly from the API. Associate files can be downloaded using FTP.

For further simplicity, `enaBrowserTools <https://github.com/enasequence/enaBrowserTools>`_
can be downloaded and run locally to fetch files associated with records by using accession. It can also be used
to bulk download records related to a specified Sample or Study.

For examples and tutorials on how to use the Browser API, FTP and enaBrowserTools, please see the guidelines below:

.. toctree::
   :maxdepth: 1

   retrieval/browser-api
   retrieval/ftp-download
   retrieval/browser-tools

Explore Taxonomy and Related Records
====================================

All sample records in ENA have taxonomic assignment. As a result, the majority of records stored within the archive
can be searched based on their taxonomy. The ENA has a REST API for access to taxonomic information (e.g. lineage and
rank) so taxonomic records can be explored programmatically.


.. toctree::
   :maxdepth: 1

   retrieval/taxon-api
   retrieval/taxon-based-search

Access the CRAM Reference Registry
==================================

The CRAM reference registry provides access to reference sequences used in CRAM files. Programmatic retrieval of
reference sequences from the CRAM reference registry is provided by MD5 or SHA1 checksum through the endpoints
documented in the `CRAM reference registry API <https://www.ebi.ac.uk/ena/cram/>`_.

To reduce network traffic originating from the use of the CRAM Reference Registry we recommend using locally
cached reference sequences. In addition to local caches supported by Samtools it is possible to cache
sequences using an HTTP proxy.

In the tutorial below, the Squid is used as a reverse proxy to cache reference sequences retrieved from the
CRAM Reference Registry.

.. toctree::
   :maxdepth: 1

   retrieval/cram-reference-cache
