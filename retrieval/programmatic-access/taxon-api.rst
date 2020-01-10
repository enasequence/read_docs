================================================
Programmatically Accessing Taxonomic Information
================================================

Every ENA sample object should have a taxonomic classification. The INSDC maintains a database of all unique
taxonomic classifications known to us. Each classification has a unique id and this is expanded to show the scientific
name and common name of the organism when the sample is viewed in the
`ENA Browser <https://www.ebi.ac.uk/ena/browser/view/Taxon:9606>`_.

There are several ways that you can access information about taxonomy or related records using the REST APIs available
through our taxonomy services.

Finding General Information about Taxa
======================================

If you know the scientific name of the organism you can find the taxonomy ID with this endpoint:

.. code-block:: bash

   www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/scientific-name/

Simply append the scientific name to the URL:

.. code-block:: bash

   > curl "http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/scientific-name/Leptonycteris%20nivalis"
   [
     {
       "taxId": "59456",
       "scientificName": "Leptonycteris nivalis",
       "commonName": "Mexican long-nosed bat",
       "formalName": "true",
       "rank": "species",
       "division": "MAM",
       "lineage": "Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Mammalia; Eutheria; Laurasiatheria; Chiroptera; Microchiroptera; Phyllostomidae; Glossophaginae; Leptonycteris; ",
       "geneticCode": "1",
       "mitochondrialGeneticCode": "2",
       "submittable": "true"
     }
   ]

You can also do this with the common name using this endpoint:

.. code-block:: bash

   www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/any-name/

Simply append the common name to the URL:

.. code-block:: bash

   > curl "http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/any-name/golden%20arrow%20poison%20frog"
   [
     {
       "taxId": "377316",
       "scientificName": "Atelopus zeteki",
       "commonName": "golden arrow poison frog",
       "formalName": "true",
       "rank": "species",
       "division": "VRT",
       "lineage": "Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Hyloidea; Bufonidae; Atelopus; ",
       "geneticCode": "1",
       "mitochondrialGeneticCode": "2",
       "submittable": "true"
     }
   ]

If you do not know the scientific name or the common name but you have an idea, you can use the *suggest* endpoint:

.. code-block:: bash

   www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/suggest-for-submission/

See this example using the search term "curry":

.. code-block:: bash

   > curl "http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/suggest-for-submission/curry"
   [
     {
       "taxId": "159030",
       "scientificName": "Murraya koenigii",
       "displayName": "curry leaf"
     },
     {
       "taxId": "261786",
       "scientificName": "Helichrysum italicum",
       "displayName": "curry plant"
     }
   ]

Accessing Taxon XML Records and Full Lineage
============================================

You can access the XML record of any public taxon using the `Browser API <https://www.ebi.ac.uk/ena/browser/api/>`_.
For example, to access the record of the
`ant fungus garden metagenome <https://www.ebi.ac.uk/ena/browser/view/Taxon:797283>`_ taxon, we can provide the Browser
API XML endpoint with the tax ID **797283**.

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/797283

You can also choose to download this directly from the API by specifying "download=true":

.. code-block:: bash

   https://www.ebi.ac.uk/ena/browser/api/xml/797283?download=true

This XML record provides general taxonomic information such as rank or translation genetic code as well as the
scientific names and tax IDs of the parent and child taxa related to the record. This allows full exploration of the
lineage of the taxon.

Finding Associated Records
==========================

For a report of all records associated with a taxon, you can use the
`Discovery Portal API <https://www.ebi.ac.uk/ena/portal/api/>`_. This API can provide a table of record counts as
well as provide a list of record IDs and descriptions when provided a 'result type'.

For example, to provide a report of all records that link to the 'ant fungus garden metagenome' taxon, we could
provide the Portal API with the taxon ID using the 'links/taxon' endpoint. This can be in tsv or json format:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/links/taxon?accession=797283&format=tsv

**Result:**

.. code-block::

   result_id	description	entry_cnt	base_cnt	subtree_entry_cnt	subtree_base_cnt
   read_experiment	Experiment	236	12253983418	236	12253983418
   sequence_update	Sequence (Update)	0	0	0	0
   sample	Sample	236	0	236	0
   analysis_study	Study	0	0	0	0
   analysis	Analysis	0	0	0	0
   study	Study	15	0	15	0
   assembly	Assembly	4	340564769	4	340564769
   sequence_release	Sequence (Release)	10	2048	10	2048
   wgs_set	Genome assembly contig set	4	0	4	0
   noncoding_release	Non-coding (Release)	10	2048	10	2048
   noncoding	Non-coding	10	2048	10	0
   coding_update	Coding (Update)	0	0	0	0
   tsa_set	Transcriptome assembly contig set	0	0	0	0
   read_run	Read	236	12253983418	236	12253983418
   read_study	Study	7	12253983418	7	12253983418
   sequence	Sequence	10	2048	10	0
   coding_release	Coding (Release)	4	144	4	144
   noncoding_update	Non-coding (Update)	0	0	0	0


From this summary, we can see that this taxon has 15 studies associated with it. To then see a report of the study IDs
and descriptions, we can specify this with the addition of 'result=study':

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/links/taxon?accession=797283&format=tsv&result=study

**Result:**

   study_accession	description
   PRJNA258031	Atta colombica refuse dump Targeted Locus (Loci)
   PRJNA336974	Cyphomyrmex longiscapus fungus garden microbial communities from Gamboa, Panama metagenome
   PRJNA336975	Apterostigma dentigerum fungus garden microbial communities from Gamboa, Panama metagenome
   PRJNA336982	Leaf cutter ant microbial communities from the University of Wisconsin-Madison, USA, from External Dump - Dump Bottom metagenome
   PRJNA336984	Leaf cutter ant microbial communities from the University of Wisconsin-Madison, USA, from External Dump - Dump Top metagenome
   PRJNA336998	Leaf cutter ant microbial communities from the University of Wisconsin-Madison, USA, from fungus growing ant-garden - Acromyrmex fungus garden Combined metagenome
   PRJNA336999	Leaf cutter ant microbial communities from the University of Wisconsin-Madison, USA, from fungus growing ant-garden - Atta cephalotes fungus garden Combined metagenome
   PRJNA337000	Atta colombica fungus garden Top metagenome
   PRJNA337001	Atta colombica fungus garden Bottom metagenome
   PRJNA337002	Atta texana Internal Dump Top metagenome
   PRJNA337003	Atta texana Internal Dump Bottom metagenome
   PRJNA39805	Atta colombica Fungus Garden Metagenome
   PRJNA62039	Atta cephalotes Fungus Garden Metagenome
   PRJNA62041	Atta colombica Fungus Garden Top Metagenome
   PRJNA62043	Atta colombica Fungus Garden Bottom Metagenome

When exploring links to taxon records, you can also specify a taxonomic node such as a genus or family rank taxon
and request all links in that subtree. For example, if you would like a report of all studies associated with taxa
that are under the tax node `ecological metagenomes <https://www.ebi.ac.uk/ena/browser/view/Taxon:410657>`_. You
could specify this with the addition of "subtree=true":

.. code-block:: bash

   https://www.ebi.ac.uk/ena/portal/api/links/taxon?accession=410657&result=study&subtree=true
