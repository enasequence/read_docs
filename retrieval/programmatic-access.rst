==================================
How to Access ENA Programmatically
==================================

There are a number of REST APIs available for programmatic access of the European Nucleotide Archive.
These enable programmatic access to the functionality of the ENA Advanced Search as well as direct download of ENA
records and associated files.

Please see the relevant guides below for examples and tutorials on ENA programmatic
data access and retrieval.

Perform Searches
================

All functionalities of the ENA Advanced Search can be performed programmatically using a combination of the
`ENA Portal API <https://www.ebi.ac.uk/ena/portal/api/>`_ and the
`ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_. You can download the API docs for the Portal API
`here <https://www.ebi.ac.uk/ena/portal/api/doc>`_ and the Browser API
`here <https://www.ebi.ac.uk/ena/browser/api/doc>`_.

You can further explore related records outside of the
European Nucleotide Archive by programmatically accessing the
`ENA Cross Reference Service <https://www.ebi.ac.uk/ena/xref/rest/>`_.

For examples and tutorials on how to use these APIs, please see the guidelines below:

.. toctree::
   :maxdepth: 1

   programmatic-access/advanced-search
   programmatic-access/cross-reference

Retrieve and Download Records
=============================

All public records within ENA are available to retrieve from the `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_
so records can be programmatically downloaded directly from the API. Associated files can be downloaded using FTP or
Aspera protocol.

For a quick summary of metadata and file retrieval locations of records, you can use the ENA file reports.

For further simplicity, `enaBrowserTools <https://github.com/enasequence/enaBrowserTools>`_
can be downloaded and run locally on the command line to fetch files associated with records by accession. It can also be used
to bulk download records related to a specified Sample or Study.

For examples and tutorials on how to use the Browser API, file reports and enaBrowserTools, please see the guidelines below:

.. toctree::
   :maxdepth: 1

   programmatic-access/browser-api
   programmatic-access/file-reports
   programmatic-access/browser-tools

Explore Taxonomy and Related Records
====================================

All sample records in ENA have taxonomic assignment. As a result, the majority of records stored within the archive
can be searched based on their taxonomy.

The ENA has a REST API for access to taxonomic information (e.g. lineage and
rank) so taxonomic records can be explored programmatically. You can also download taxon records in XML format using
the `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_ or explore related records with the
`ENA Portal API <https://www.ebi.ac.uk/ena/portal/api/>`_.

For examples and tutorials on how to use the ENA taxonomy services, please see the guidelines below:

.. toctree::
   :maxdepth: 1

   programmatic-access/taxon-api
   programmatic-access/taxon-based-search

Sequence similarity search
==========================

EBI's central NCBI BLAST service can be accessed via
`REST and SOAP <https://www.ebi.ac.uk/seqdb/confluence/display/JDSAT/Job+Dispatcher+Sequence+Analysis+Tools+Home>`_.

For usage details and parameter options, see the
`NCBI BLAST+ documentation <https://www.ebi.ac.uk/seqdb/confluence/pages/viewpage.action?pageId=94147939>`_.


Access the CRAM Reference Registry
==================================

The CRAM reference registry provides access to reference sequences used in CRAM files.
Retrieval of reference sequences from the CRAM reference registry is provided by MD5 or
SHA1 checksum through the endpoints documented in the `CRAM reference registry API <https://www.ebi.ac.uk/ena/cram/>`_.

CRAM Format
-----------

CRAM is a sequencing read file format that is highly space efficient by using reference-based compression of
sequence data and offers both lossless and lossy modes of compression. The format specification for CRAM is
maintained by the `Global Alliance for Genomics and Health (GA4GH) <https://www.ga4gh.org/cram/>`_
whose members provide multiple implementations and coordinate future specification changes.

The CRAM reference registry is used by GA4GH `Samtools <http://www.htslib.org/>`_.

CRAM Reference Registry reverse proxy
-------------------------------------

To reduce network traffic originating from the use of the CRAM Reference Registry we recommend using locally
cached reference sequences. In addition to local caches supported by Samtools, it is possible to cache sequences
using an HTTP proxy.

In the tutorial below, the Squid is used as a reverse proxy to cache reference sequences retrieved from the
CRAM Reference Registry:

.. toctree::
   :maxdepth: 1

   programmatic-access/cram-reference-cache

Rate Limits
===========
In order to ensure a smooth and fair user experience, we have implemented rate limits on our data discovery and retrieval RESTful APIs.

It helps us in maintaining optimal performance and preventing overload on our servers. By regulating the number of requests from individual users, we can ensure that everyone gets a consistent and responsive experience. It also acts as a protective measure against malicious activities such as DDoS attacks and brute-force attempts.

At present we have set the upper limit at **50 requests per second** which we think should be sufficient for most of the use-cases. If the requests breach this limit then it will be rejected with error **"Too Many Requests" (HTTP status code 429)**.
