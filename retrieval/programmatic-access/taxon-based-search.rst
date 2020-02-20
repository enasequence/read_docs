=====================================================================
How to Programmatically Perform a Search Across ENA Based on Taxonomy
=====================================================================

The Taxonomy of ENA Sample records and associated data are maintained in the NCBI taxonomy database.

As a result, before searching through ENA using Taxonomy, you'll need to find the appropriate taxon for the search
within the Tax Database.

If you know the scientific name of the taxon for the search, you catch retrieve the tax ID using the taxonomy
database API:

.. code-block:: bash

   www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/<scientific-name>

If you do not know the scientific name or the common name but you have an idea, you can use the *suggest* endpoint:

.. code-block:: bash

   www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/<search-term>

Search For All Reads of a Specified Taxon
=========================================

As an example, let's look at a search that will return all reads of the taxon
`ant fungus garden metagenome <https://www.ebi.ac.uk/ena/browser/view/797283>`_.

The `ENA Discovery Portal API <https://www.ebi.ac.uk/ena/portal/api>`_ can be used to tailor powerful and complex
searches across the archive. This API returns a report of the results of your search in TSV or JSON format. See
the Swagger interface or API docs for full usage details.

For the purpose of a simple taxon based search, the query that would be run would use the parameter
**tax_eq(**<tax_id>**)**.

The following search would provide all accessions and descriptions for raw reads which are from ant fungus garden
samples (the default format is a tsv):

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=read_run&query=tax_eq(797283)

You can then further tailor your search to return particular fields of interest such as the sample collection date,
the host sex of the sample, the sequencing platform etc. In this example, we will look at adding the following fields to
the returned report:

- accession - the resulting Sample accession
- description - the record description
- collection_date - the sample collection date
- instrument_platform - the sequencing platform
- fastq_ftp - the FTP location of the fastq raw read files

You can view the Portal API docs for more information on what fields are available for different search types.

These fields are added as a comma separated list to the API call:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=read_run&query=tax_eq(797283)&fields=accession,description,collection_date,instrument_platform,fastq_ftp

Download the Resulting Sequencing Data Files
--------------------------------------------

By returning the FTP location of the ftp files, you can now download the raw read files directly from the FTP.

Download the XML Records of the Resulting Reads
===============================================

There are limitations to generating a metadata report from the ENA Portal API. The Portal API only holds indexed fields
meaning any details or custom metadata that a submitter has provided will not be returned.

If you want to explore ENA records in full detail, you may wish to download the records themselves as full XMLs.

To do this, you can use the `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api>`_ and use the same search query
there (without the specified fields to return). This will download all the resulting
XML records for that particular taxon:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/search?result=read_run&query=tax_eq(797283)

Including The Taxon Sub-tree in Searches
========================================

If you would like to search at a higher level in the taxonomy tree, e.g. Genus level, then you can specify to return
all records under that tax node. This allows you to capture all Records of a taxonomic lineage.

To do this, simply swap the **tax_eq(<tax_id>)** for **tax_tree(<tax_id>)**.

For example, the search below searches for a summary of ALL metagenome raw read records by searching under the tax node
`metagenomes <https://www.ebi.ac.uk/ena/browser/view/408169>`_:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=read_run&query=tax_tree(408169)
