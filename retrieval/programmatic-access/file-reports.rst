===========================
Retrieving ENA File reports
===========================

While file reports can be built using the ENA advanced search, there is a special filereport URL that will return
summarised reports about a provided accession. This URL bypasses the advanced search and fetches information
directly from a data cache, increasing the speed of delivery.

This faster resource is available using the following URL template:

.. code-block:: bash

   http://www.ebi.ac.uk/ena/portal/api/filereport?accession=<accession>&result=<result>[&fields=<fields>]

When the fields parameter is used, only those columns requested are returned and they are in the same order as
requested. If the fields parameter is not used, all available columns for the result are returned.

Example with all report fields:

.. code-block:: bash

   http://www.ebi.ac.uk/ena/portal/api/filereport?accession=SRX017289&result=read_run

Example with specified return fields:

.. code-block:: bash

   http://www.ebi.ac.uk/ena/portal/api/filereport?accession=SRX017289&result=read_run&fields=run_accession,fastq_ftp,fastq_md5,fastq_bytes

Run Reports
===========

To retrieve the run file report, the result should be set to read_run. S
tudy accessions (ERP, SRP, DRP, PRJ prefixes), experiment accessions (ERX, SRX, DRX prefixes), sample
accessions (ERS, SRS, DRS, SAM prefixes) and run accessions (ERR, SRR, DRR prefixes) can be supplied.


Analysis Reports
================

To retrieve the analysis file report, the result should be set to analysis. Study accessions
(ERP, SRP, DRP, PRJ prefixes), sample accessions (ERS, SRS, DRS, SAM prefixes)
and analysis accessions (ERZ, SRZ, DRZ prefixes) can be supplied.
