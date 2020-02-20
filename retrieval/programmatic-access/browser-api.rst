=================================================
How to Download Records using the ENA Browser API
=================================================

The `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_ can be used to download ENA Records in EMBL flat file,
fasta or XML format dependant on the record type.

+-----------------------+-------------------------------------------------+
| **File Format**       | **Available Record Types**                      |
+-----------------------+-------------------------------------------------+
| XML                   | Study, Sample, Run, Experiment, Analysis, Taxon |
+-----------------------+-------------------------------------------------+
| EMBL Flat File (text) | | Sequences (including coding and non-coding    |
|                       | | sequences), WGS sets, TSA sets                |
+-----------------------+-------------------------------------------------+
| Fasta                 | | Sequences                                     |
+-----------------------+-------------------------------------------------+

API End-points
==============

The Browser API has three endpoints for each file format available in the table above. Using the XML file format as
an example, below is a summary of how to use these end-points to retreive data.

XML Records contain metadata provided by the submitter as well as injected cross-reference links to
other related resources and FTP locations of associated files.

The three endpoints available to access XML records in the Browser API are as follows:

Fetch Records by Accession
--------------------------

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/<accession>

This allows direct access to the XML of a provided accession. The XML file will not be downloaded automatically.

Fetch Records by Free-Text Search
---------------------------------

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/textsearch/<query>

This will return all records in XML format which match your text search. It can be used to perform very broad searches
and is great to quickly access records of a particular datatype. However, be aware that text searches can lead to
false positives so for extensive complex and comprehensive searches, it is best to perform an advanced search.

Fetch Records Using an Advanced Search
--------------------------------------

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/search/<query>

This allows you to perform an advanced search and directly download the resulting records as XMLs. This is
most useful when used alongside the `Portal API <https://www.ebi.ac.uk/ena/portal/api>`_. See our guide on how
to perform programmatic advanced searches `here <advanced-search.html>`_.

Fetch Records Linked to a Sample, Taxon or Study
------------------------------------------------

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/links/<data-type>

This allows you to directly download records associated with a specified Sample, Study or Taxon. You just need to specify
which one of the three datatypes you want to download records from (sample, study or taxon) as well as the accession then
specify which datatype you would like to download that is related to that record.
