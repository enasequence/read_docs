============================
Moving away from the release
============================

.. Outstanding tickets relating to this documentation
.. DCP-2176 Add documentation endpoint to ENA Browser API, and include in swagger interface.
.. DCP-2175 Add search endpoint to Browser API swagger interface
.. DCP-2173 Partitioning from report improvements. Ability to obtain specific versions.
.. DCO-2172 Add zip download option for the new sequence, coding and non-coding data types
.. DCP-2172 Create new merged data types sequence coding and non-coding
.. Decision on future of FTP update cumulative files. Will need a ticket to make the changes to the FTP file structure and disable flows.

Introduction
============

The ENA is retiring its periodic assembled/annotated sequence release in March 2020.
The last release will be number 143.

The European Nucleotide Archive (ENA) captures, preserves and presents the world's
nucleotide sequence data. Since 1982 the European Nucleotide Archive has made more than 140
individual releases, providing a quarterly snapshot of ENA assembled/annotated
sequence data. During this time, changes to the ways in which users access ENA data,
have led us to develop a portfolio of data access tools, such as our daily FTP
products and the ENA Browser API, which are currently offered in parallel to the
traditional release. In recent years we have faced growing pressure on the release
process in response to increases in data volume and have also seen a shift towards
our newer services from the majority of users. Our release process has remained
largely unchanged for the last two decades, and following an internal review we
have concluded that it is no longer viable for us to continue the current release
process as part of our presentation portfolio.

New data is already included in the ENA on a continuous basis and distributed
daily from our browser, FTP and RESTful API services. The key change is that we
will no longer make an additional separate quarterly release of the assembled/annotated
subset of sequences. We will focus our resources on further developing and supporting
our continuous distribution presentation products.

Additionally, as part of the release retirement we will no longer be creating cumulative FTP
files in the FTP update folders (e.g. http://ftp.ebi.ac.uk/pub/databases/ena/sequence/update/).
These cumulative files tracked daily changes in between release cycles and thus
cannot continue to be produced sustainably. Release 143 will be the last available
in the release folder (available here once released http://ftp.ebi.ac.uk/pub/databases/ena/sequence/release/),
the update folder will be removed after this last release. Set based sequences
have already been removed from the release and will continue to be added to the
FTP in their corresponding folders (e.g. http://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/;
http://ftp.ebi.ac.uk/pub/databases/ena/tsa/public/; http://ftp.ebi.ac.uk/pub/databases/ena/tls/public/).

Release vs Update search data
=============================

Currently we maintain separately indexed datasets for RELEASE and UPDATE data for Sequence and Coding & NonCoding records.
Where RELEASE refers to the last ENA release, and UPDATE refers to any records that have been added or modified since the
last release.
So we have the search result type "sequence_release" which indexes all CON & STD class records from the last release,
and "sequence_update" which indexes the modified or added CON & STD records.
coding_release & coding_update, noncoding_release & noncoding_update are equivalent format CDS and NCR subproducts
from the sequence records respectively.

After the final release (143) in March 2020 we will be merging the '_release' and '_update'
data types for sequence, coding and non-coding. So the data types 'sequence_release'
and 'sequence_update' will be replaced with the data type 'sequence'. This affects
users of our API and Browser advanced search services, who will need to use the
updated data type end points. We're working to make the new data types available in parallel to
the last indexed release & update datasets.

The following guide has been created to assist users in moving away from the release.
This guide outlines accessing assembled/annotated sequences, guidance on how to identify data
based on a last updated timestamp and advice for establishing your own mirroring procedures
using our portfolio of other access services.

Accessing assembled/annotated sequences
=======================================
Assembled/annotated sequences can be obtained from our continuous daily distribution
resources, with API, FTP and web browser-based options. For most use cases we would
recommend the ENA Browser API as it provides the greatest specificity and flexibility
for obtaining a tailored dataset of assembled/annotated sequences for your requirements.

ENA API
-------
Assembled/annotated sequences can be identified and downloaded with our `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_. The http API Swagger interface lists the endpoints, documenting expected parameter and errors.

Examples: (we provide curl examples, but you could use wget or a web browser or a rest client)

Obtaining the latest version of a sequence record by accession:

In EMBL format:

.. code:: bash

  curl -X GET "https://www.ebi.ac.uk/ena/browser/api/embl/BN000065"


In FASTA format

.. code:: bash

  curl -X GET "https://www.ebi.ac.uk/ena/browser/api/fasta/BN000065"

Obtaining a specific version, including suppressed versions, of a sequence record by accession:

In EMBL format:

.. code:: bash

  curl -X GET "https://www.ebi.ac.uk/ena/browser/api/embl/KF961410.1"

.. Update the data type to sequence in below examples once DCP-2172 is complete
The ENA Browser API also allows the user to conduct a search for multiple Assembled/annotated sequences records and download them. In this example searching the sequence data type for human data distributed or updated since 19th August 2019:
In EMBL format

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/browser/api/embl/search?result=sequence_update&query=tax_eq(9606)%20AND%20last_updated%3E%3D2019-08-18&limit=5' -o embl.txt

or FASTA

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/browser/api/fasta/search?result=sequence_update&query=tax_eq(9606)%20AND%20last_updated%3C%3D2019-08-18&limit=5' -o fasta.txt

We have added limits to the above examples to only return 5 records, remove this under normal use. You can search using the sequence, coding or non-coding data type endpoints. In general when using the API search it is important to be as specific as possible with your query to save on downloading sequences that you do not require.

.. read current release notes on data types to help here.

.. Edit if we are to discontinue FTP, following resolution of meeting about continuation of this service.
ENA FTP
-------
The release folders, for example the sequence release folder (http://ftp.ebi.ac.uk/pub/databases/ena/sequence/release/) will contain the final release 143 made in March 2020. No further FTP releases will be made after release 143.

ENA Browser
-----------
For the majority of use cases we would recommend utilizing the
`ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_ for obtaining
assembled/annotated sequences. However, these are also available to search and
download from the `ENA Browser <https://www.ebi.ac.uk/ena/browser/>`_.

The `ENA Browser <https://www.ebi.ac.uk/ena/browser/>`_ provides direct
access to sequences by accession, with subsequent options for downloading in EMBL
or FASTA format; e.g. see https://www.ebi.ac.uk/ena/browser/view/BN000065

The `ENA Browser <https://www.ebi.ac.uk/ena/browser/home>`_ also provides an
`Advanced Search <https://www.ebi.ac.uk/ena/browser/advanced-search>`_ for finding
appropriate assembled/annotated sequences for download.
This feature is also useful for assistance with
constructing complex API queries. In particular one could use the graphical interface
to construct the query and then export it for command line using the "Copy Curl Request" button.

Detailed guidance on the usage of Advanced Search is available in our
`Advanced Search documentation <https://ena-browser-docs.readthedocs.io/en/latest/browser/search/advanced.html>`_,
but we make a brief mention here:

1. Start an advanced search at https://www.ebi.ac.uk/ena/browser/advanced-search

2. Select an assembled/annotated sequence data type such as 'sequence_release',
   'coding_release' or 'noncoding_release'

3. (Recommended) Use the Query builder to be as specific as possible with the available filters to construct a query that will
   limit the resulting dataset to match your needs.
   e.g. Key filters include:

   - limiting by date. Database record -> last updated
   - taxon. Taxonomy and related -> NCBI taxonomy.

4. (optional) Select the fields you want in the resulting data. By default, the INSDC accession and description is provided.

5. (Optional) Use inclusion and exclusion lists of accessions to finely alter the
   returned records.

6. Once you have run your query you can click the hyperlinks to download the full data files  in in either EMBL or FASTA format.

7. (Optional) If desired you can copy your query for command line use with the ENA APIs using the "Copy Curl Request" button.

8. (Optional) You can save this query for future use, by saving it to your Rulespace
   account using the 'Save To Rulespace' button, please refer to this `guide for
   more information <https://www.ebi.ac.uk/ena/rulespace/api/doc>`_.


How to identify data based on a last updated timestamp
======================================================
One common usage of the ENA release was to obtain all assembled/annotated sequence
data changed since the last release, either from the entire new release or from
the incremental update folders. This can be fully replicated in the `ENA Browser
API <https://www.ebi.ac.uk/ena/browser/api/>`_ or `ENA Browser Advanced Search
<https://www.ebi.ac.uk/ena/browser/advanced-search>`_  by using the "last_updated"
query filter with a date value.

For the `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_ search
endpoint, you can include the 'last_updated' filter and provide a timestamp.
This is essentially performing a 'less than or equal to' search, so will provide all
records that are new or have been updated from the provided date to the present day).
It is recommended that you further customize the query with further filters
(for example taxon or geographic) to avoid unnecessarily downloading data you do not require.

Example in FASTA format

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/browser/api/fasta/search?result=sequence_update&query=last_updated%3E%3D2019-08-18&limit=5' -o fasta.txt

or in EMBL format

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/browser/api/embl/search?result=sequence_update&query=last_updated%3E%3D2019-08-18&limit=5' -o embl.txt

You can also provide multiple timestamp filters to give a specific from and to date range, rather than all data to this date, for example data for the first 5 days of August 2019:

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/browser/api/fasta/search?result=sequence_update&query=last_updated%3E%3D2019-08-01%20AND%20last_updated%3C%3D2019-08-05&limit=5' -o fasta.txt

We have added limits to the above examples to only return 5 records, remove this under normal use. You can search using the sequence, coding or non-coding data type endpoints. In general when using the API search it is important to be as specific as possible with your query to save on downloading sequences that you do not require.

.. Give link for more information on API when DCP-2176 is complete

For the `ENA Browser advanced search <https://www.ebi.ac.uk/ena/browser/advanced-search>`_ the 'last_updated' filter can be included in your query. It is located in the Database record filter section.

.. consider complete section on reproducibility of queries

Establishing your own release mirroring procedures - Conducting your own release
================================================================================
This section covers the establishment of a mirroring of ENA assembled/annotated
sequences without the ENA release. Successful mirroring includes the following concepts:

- Data provenance: Track the accessions obtained in your mirroring, so that the data can be obtained again in future.
- Periodic release: Obtain ENA assembled/annotated sequence data from a defined last updated timestamp.
- Data specificity: By preference use a filtered query to only obtain the data you need, unless you really do need to mirror everything.
- Recapturing the same data in future: Instructions for you or your users to use a summary file that you create to obtain the same dataset in future.

This equates to utilizing two separate ENA API services:
- The Data Discovery API to obtain a summary for data provenance
- The Browser API to obtain the data most efficiently.

Data provenance
---------------
Save the accessions and sequence versions that match your search criteria as a report,
which will act as the master document for creating the release.
To create such a list, you can query the ENA Portal API with search parameters
and save the results to a TSV or JSON file, which you can then use to retrieve the
EMBL format or FASTA format records from the ENA Browser API. If you would like to get
the current public versions of the records even at a later time, in the query to Portal
API, include 'sequence_version' in the fields list.
A reason for doing this is to have a fixed list with which you could re-download
the same set of records in the future. As records are added,updated or suppressed,
the public dataset is regularly changing, and as such you may not get a certain record,
or get a different version of a record were you to run the same query in a future date.

e.g.

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/portal/api/search?result=sequence_update&query=last_updated%3E%3D2019-08-01%20AND%20last_updated%3C%3D2019-08-05&fields=sequence_version,last_updated' -o sequence_report.tsv


Periodic release and data specificity
-------------------------------------
Do the above based on your preferred time period for releases and use the last_updated
search parameter.

Instructions for verifying changes since you conducted your release
--------------------------------------------------------------------
At a future date, you could rerun the same query and save a new version of the report,
which then can be compared with the original master report to look for any differences.
We are working on an endpoint that you could upload the original report to and get the
list of differences as a response.
This is important step as you need to be aware of any sequences that have been killed,
as these will not appear in the new data acquisition.

.. provide details on the report

Instructions for obtaining same specific versions of sequences obtained in your release
---------------------------------------------------------------------------------------

If the sequence version has been captured in the report, you could retrieve the same
specific versions at any time from the Browser API, except for any that may have been killed.

Using the accession and sequence_version fields from this report, you can then retrieve the specific version of the record from Browser API in EMBL or FASTA format. If your list is large, this is obviously not very efficient. So you could run the exact same query against the Browser API's search endpoint to retrieve all the matching records in EMBL or FASTA format at once.

e.g.

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/browser/api/embl/search?result=sequence_update&query=last_updated%3E%3D2019-08-01%20AND%20last_updated%3C%3D2019-08-05' -o sequences.txt

.. provide details on the how to do this.

.. Use API or advanced search to create a query with a to and from date.

.. Optional, Start portal API to get accessions. If you customize the field output make sure you include sequence version.


Either of the above, you could parallelize by using the offset and limit parameters
to get different chunks of the data simultaneously.

.. code:: bash

  curl 'https://www.ebi.ac.uk/ena/browser/api/fasta/search?result=sequence_update&query=last_updated%3E%3D2019-08-01%20AND%20last_updated%3C%3D2019-08-05&offset=0&limit=100000' -o sequences_1.txt

  curl 'https://www.ebi.ac.uk/ena/browser/api/fasta/search?result=sequence_update&query=last_updated%3E%3D2019-08-01%20AND%20last_updated%3C%3D2019-08-05&offset=100000&limit=100000' -o sequences_2.txt

etc.

Hint: If in the future you want to only retrieve records that have been added or
changed since your last pull, it is important that you record the timestamp from
when you run the current query and store this so that you can use it for repeating
the process for your next update. Obviously you can now pick an update frequency that most suits your use case.

.. The important for your users is to provide the report you generated earlier, they can then get a better reconstruction of the same dataset as it will contain suppressed records. Killed records can never be retrieved.

 If you need to resume a large download which wasn't parallelized, we would recommend calculating how many records were retrieved so far (e.g. using grep), and then use the offset parameter to get the rest from there onwards. If there is a significant delay between the first and the second call, please be aware that the indexed data may have been updated.

.. Describe new endpoint that will tell you if any records in report file have been updated supressed or killed since it was generated.

.. Describe how you can use the report to get the exact same versions as the mirror download

.. example of a query with a to and from date

.. State that it is better to be very specific with the query for what is actually required for your release, if you only need a certain data type, data from a certain taxon or from a particular region then you should limit this in your query, instructions for constructing queries here.


.. Comment that Rulespace can be used to save a complex query for repeated use

.. Comment that we may establish partitions for users depending on requirements.

.. Give link for more information on any APIs or tech used above


More information resources
==========================
Further documentation on the above services is available in their respective documentation:
- `ENA Discovery Portal API documentation <https://www.ebi.ac.uk/ena/portal/api/doc>`_
- `ENA Browser documentation <https://ena-browser-docs.readthedocs.io/en/latest/>`_

Further assistance
==================
If you currently rely on any aspect of the separate assembled/annotated sequence
release process for your work or resource, and cannot switch to one of our continuous
distribution processes outlined above, please feel free to contact us to discuss your requirements.

In your query please list what features you utilised from the release process. We
can discuss your requirements and determine how we might support your use case through
 one of our existing services or collaborate on an adapted or novel solution.
 Contacting us promptly with your requirements will allow us to ensure adequate
 time and resources to collaborate on a solution.

Please contact us with your questions or concerns at https://www.ebi.ac.uk/ena/browser/support
 with subject ‘ENA release retirement’.

Spot an edit or improvement to this page? Please report it using our
`ENA Support Service <https://www.ebi.ac.uk/ena/browser/support>`_ quoting the URL of this page in your query.
