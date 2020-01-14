============================================================
How to Perform Advanced Searches Across ENA Programmatically
============================================================

The `ENA Advanced Search <https://www.ebi.ac.uk/ena/browser/advanced-search>`_ is a powerful tool for exploring the
datasets within the archive using tailored search queries. The ENA Advanced search in the browser provides a user
interface to build search queries and can be a useful way to start exploring the full functionalities of the
service. Once you are happy with a query, you can click the 'Copy Curl Request' button to allow you to run this
locally on the command line.

This guide will help you explore the search functionalities of the
`ENA Portal API <https://www.ebi.ac.uk/ena/portal/api>`_ and `ENA Browser API <https://www.ebi.ac.uk/ena/browser/api>`_.

When first exploring the APIs, it can be worth testing out the query builder in the
`ENA Advanced Search <https://www.ebi.ac.uk/ena/browser/advanced-search>`_ interface as well as playing around with the
APIs' swagger interfaces. Using a combination of all three of these can help build more complex searches.

In this example we are going to perform a complex search and retrieve raw read and primary metagenome datasets specifically
for *cow rumen samples collected in the UK*.

For a simpler overview on the advanced search, see our guide on using taxonomy to perform searches programmatically
`here <taxon-based-search.html>`_.

Choosing the Right Data Type Result
===================================

Before performing a search, you will first need to determine what 'result' data type to search against. You can use the
`ENA Portal API <https://www.ebi.ac.uk/ena/portal/api>`_ to output the full list:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/results?dataPortal=ena

**Result:**

.. code-block:: bash

   resultId	description
   analysis_study	Studies used for nucleotide sequence analyses from reads
   analysis	Nucleotide sequence analyses from reads
   assembly	Genome assemblies
   coding_release	Protein coding sequences (Release)
   coding_update	Protein coding sequences (Update)
   wgs_set	Genome assembly contig sets (WGS)
   tsa_set	Transcriptome assembly contig sets (TSA)
   environmental	Environmental samples
   noncoding_release	Non-coding sequences (Release)
   noncoding_update	Non-coding sequences (Update)
   noncoding	Non-coding sequences
   read_study	Studies used for raw reads
   read_experiment	Experiments used for raw reads
   read_run	Raw reads
   sample	Samples
   sequence_release	Nucleotide sequences (Release)
   sequence_update	Nucleotide sequences (Update)
   sequence	Nucleotide sequences
   study	Studies
   taxon	Taxonomic classfication

From this list we can see that the **read_run** result provides a platform to search for 'Raw reads' and the
**analysis** result provides a platform to search for 'Nucleotide sequence analyses from reads'.

.. note:: Why are we not using the assembly result?

   You may be wondering why we are not using the **assembly** result to search for the primary metagenomes? Within
   ENA, the Genome Assembly database only accepts high-quality, individual-genome level assemblies such as isolate
   genomes, MAGs and SAGs. As primary metagenomes are sets of contigs with a mixture of genomic data from many
   individuals within an environmental sample, primary metagenome assemblies are archived as 'sequence assembly' type
   **analyses**.

Breaking Down Your Query
========================

To build queries for the API, you need to string together individual search fields with AND or OR operators.
This means you'll need to break down your search question into individual search components.

In this example, the datasets we want to retrieve are those from *'cow rumen samples collected in the UK'*. So let's
break this query down into bite-size chunks. We want to retrieve data from:

samples collected from **Rumen**

AND only those of a **Cow**

AND only those collected **in the UK**

What Fields Can I use in My Search?
-----------------------------------

The easiest way to explore the fields you can use for your search is the
`ENA Advanced Search <https://www.ebi.ac.uk/ena/browser/advanced-search>`_ quwey builder but you can also output
the full list in the Portal API by looking up the **searchFields** for each result:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/searchFields?result=read_run
   https://www.ebi.ac.uk/ena/portal/api/searchFields?result=analysis

Here, we can see in both searches, the following fields can be used:

- **host_body_site** - the site in the host organism where the sample was collected
- **host_tax_id** - the taxon ID for the host - this is the best way to accurately narrow down the host species sampled.
- **country** - the country where the sample was collected

The tax ID for `Bos Taurus <https://www.ebi.ac.uk/ena/browser/view/Taxon:9913>`_ is 9913. So, when we put these together
as a query we get:

.. code-block:: bash

   query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen"

.. note:: Why are we not looking for samples using 'Bos Taurus' as the **scientific_name**?

   A common misunderstanding of how INSDC use taxonomy to label samples is the belief that samples originating from
   a *microbiome within a species* should be labelled with the host taxonomy.
   This is incorrect. The correct way to label these samples would be using *biome-level metagenome taxonomy*
   and including the host taxonomy and information in the metadata as described above.
   Read our `taxonomy tips <../../faq/taxonomy.html#environmental-taxonomic-classifications>`_ for more information
   on environmental taxonomy. You can use metagenome taxonomy to perform more general searches. See
   `here <taxon-based-search.html>`_ for our guide on performing taxonomy-based searches.

Search For Raw Reads
====================

To return a list of all the raw reads for our designed query, we can perform a search in the Portal API against the
**read_run** result:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=read_run&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen"

You can also specify the result format as '&format=tsv' or '&format=json'. TSV is the default.

When looking at this search, we can see that only the accession and description are returned.

What Other Fields Can I Return?
-------------------------------

The easiest way to explore the fields you can return from your search is the
`ENA Advanced Search <https://www.ebi.ac.uk/ena/browser/advanced-search>`_ query builder but you can also output the
full list in the Portal API by looking up the **returnFields** for your result:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/returnFields?result=read_run

So, in this example we wanted to access the resulting raw reads for the search. We can see the following
field can be returned:

- **submitted_ftp** - the FTP links for the submitted raw read files

So we can add this to our search:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=read_run&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen"&fields=submitted_ftp

You could also add the metadata fields that we specifically searched for to check the search performed as we expected:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=read_run&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen"&fields=host_body_site,host_tax_id,country,submitted_ftp

Fetching Full XML Records From Search
-------------------------------------

Now that we've designed our search using the Portal API, we can optionally also run it in the
`Browser API <https://www.ebi.ac.uk/ena/browser/api>`_ to download the
full XML records resulting from the search:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/search?result=read_run&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen"

The XML records can provide details on additional metadata that isn't indexed for search as well as cross-reference
links.

Search For Analyses
===================

To return a list of all the primary metagenome assemblies for our designed query, we can perform a search in the
Portal API against the **analysis** result. However, as analyses can be all kinds of different types, we'll need to
narrow down the search even further here.

In this example we want to search for *primary metagenome assemblies* so we can add the following search components:

- **analysis_type** - the type of analysis record - for assemblies this is SEQUENCE_ASSEMBLY
- **assembly_type** - we specifically want to search for 'primary metagenome' assemblies

Let's add these to our query and search against the **analysis** result:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=analysis&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen" AND analysis_type="SEQUENCE_ASSEMBLY" AND assembly_type="primary metagenome"

When looking at this search, again, we can see that only the accession and description are returned.

What Other Fields Can I Return?
-------------------------------

Let's check out the **returnFields** for the **analysis** result data type:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/returnFields?result=analysis

Again we can see the submitted file FTP location can be returned:

- **submitted_ftp** - the FTP links for the submitted assembly files

So we can add this to our search:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=analysis&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen" AND analysis_type="SEQUENCE_ASSEMBLY" AND assembly_type="primary metagenome"&fields=submitted_ftp

As before, you could also add the details we searched for to check the search performed as we expected:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/search?result=analysis&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen" AND analysis_type="SEQUENCE_ASSEMBLY" AND assembly_type="primary metagenome"&fields=host_body_site,host_tax_id,country,submitted_ftp

Fetching Full XML Records From Search
-------------------------------------

Now that we've designed our search using the Portal API, again, we can optionally also run it in the
`Browser API <https://www.ebi.ac.uk/ena/browser/api>`_ to download the
full XML records resulting from the search:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/search?result=analysis&query=country="United Kingdom" AND host_tax_id=9913 AND host_body_site="rumen" AND analysis_type="SEQUENCE_ASSEMBLY" AND assembly_type="primary metagenome"

Like before, the XML records can provide details on additional metadata that isn't indexed for search as well as
cross-reference links.
