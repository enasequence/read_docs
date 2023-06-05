========================
Tips for Sample Taxonomy
========================


The classification system for source biological organisms for all INSDC records is the NCBI Taxonomy and is available
from the `ENA browser <https://www.ebi.ac.uk/ena/browser/view/Taxon:9606>`_.
The ENA team work alongside taxonomists at NCBI to ensure that all ENA records display the accepted organism name and
classification hierarchy.
NCBI Taxonomy covers the complete tree of life and also includes other types, such as synthetic constructs and
environmental samples.
However, it is an incomplete classification system in that it only considers taxa for data that are represented in INSDC
records.
Users should note that taxa are only displayed if at least one associated ENA record is available.


Choosing the Right Taxonomy For Your Submission
===============================================


Submitted organism names must be at ‘species’ rank.
This rank type does not automatically mean the name is a published binomen (e.g. *Homo sapiens*): it is simply a rank,
which differentiates the sequenced organism from another.
For example, unidentified strains of the same bacterial genus should be kept as separate species, rather than binned
together under the same genus name.

.. tip::
    A `binomial <taxonomy.rst#checking-a-taxon-is-binomial>`_ taxonomy ID should be used in most cases, and is highly recommended.
    A binomial taxonomy ID is **required** when submitting a 'clone or isolate' genome assembly. If your sample has been identified
    to species-level rank, but is not yet a published binomen, a placeholder taxonomy ID may be used.
    A `placeholder <taxonomy_requests.html#unidentified-novel-organisms>`_ taxon ID is classed as a binomial taxon ID for data submission purposes.

If your sample cannot be identified using a binomial taxon ID, an environmental biome-level or organism-level
taxonomy ID can be used.

When registering your samples using the interactive `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin>`_
you will need to enter a valid species rank taxon in your template spreadsheet.

Programmatic submitters will apply the taxonomic information to the sample object using the sample_name block:

.. code-block:: xml

    <SAMPLE_NAME>
      <TAXON_ID>450267</TAXON_ID>
      <SCIENTIFIC_NAME>Chlamyphorus truncatus</SCIENTIFIC_NAME>
      <COMMON_NAME>Pink fairy armadillo</COMMON_NAME>
    </SAMPLE_NAME>


If you do not know the scientific name or the common name that you would like to use for your submission but you
have an idea, you can use this *suggest* endpoint for the ENA taxonomy service:

.. code-block:: bash

   www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/

For example, using curl or pasting the URL in the browser for "curry" looks as follows:

Link:
  http://www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/curry

.. code-block:: bash

   > curl "http://www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/curry"
   [
     {
       "taxId": "159030",
       "scientificName": "Murraya koenigii",
       "displayName": "curry leaf"
       "binomial" : "true"
     },
     {
       "taxId": "261786",
       "scientificName": "Helichrysum italicum",
       "displayName": "curry plant"
       "binomial" : "true"
     }
   ]

As shown, some species have common names ("displayName") in addition to their scientific name.
This makes it possible to search for such names with common English names like 'dog' or 'human':

Link:
  https://www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/dog

.. code-block:: bash

   > curl "https://www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/dog"
   [
     {
       "taxId" : "9615",
       "scientificName" : "Canis lupus familiaris",
       "commonName" : "dog",
       "displayName" : "dog"
       "binomial" : "true"
     }
   ]


Checking a taxon is submittable
-------------------------------


If you know the taxon you would like to use, you can check if it is submittable and find any additional information
about it, including if it is **binomial**, by using one of the following urls:


.. code-block:: bash

   www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/

   www.ebi.ac.uk/ena/taxonomy/rest/any-name/

   www.ebi.ac.uk/ena/taxonomy/rest/tax-id/


Checking a taxon is binomial
****************************

We recommend that you use a binomial taxonomy ID for your sample registration. A binomial sample taxon ID is **required**
if you plan to submit 'clone or isolate' genome assembly data. If a suitable binomial taxonomy ID does not exist, you can
request a `placeholder <taxonomy_requests.html#unidentified-novel-organisms>`_ taxon ID. For cases where your sample
cannot be identified using a binomial taxonomy ID, an `environmental sample <#environmental-taxonomic-classifications>`_ can be registered.

For example, using curl or pasting the URL into your browser for *Canis lupis familiaris* looks as follows:

Link:
  https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/canis%20lupus%20familiaris

.. code-block:: bash

   > curl "https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/canis%20lupus%20familiaris"
   [
     {
      "taxId" : "9615",
      "scientificName" : "Canis lupus familiaris",
      "commonName" : "dog",
      "formalName" : "true",
      "rank" : "subspecies",
      "division" : "MAM",
      "lineage" : "Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Mammalia; Eutheria; Laurasiatheria; Carnivora; Caniformia; Canidae; Canis; ",
      "geneticCode" : "1",
      "mitochondrialGeneticCode" : "2",
      "submittable" : "true"
      "binomial" : "true"
     }
   ]


Please see our `guide on exploring taxonomy <../retrieval/programmatic-access/taxon-api.html>`_ for more advice on
exploring our taxonomy services programmatically.


Environmental Taxonomic Classifications
=======================================

Every sample object in ENA must have a taxonomic classification assigned to it. There are specific taxonomic IDs which
may be used for environmental samples, which may be broadly classified into biome-level taxonomy IDs and organism-level
taxonomy IDs.


Environmental Biome-Level Taxonomy
----------------------------------

Environmental biome-level samples can not be described with a single organism identifier because they represent an environment
with an unknown variety and number of organisms. For this purpose there are entries in the Tax Database that apply exclusively to
environmental biome-level samples.

Biome-level environmental taxa can be immediately identified as they contain the term "metagenome" as part
of the scientific name. These are searchable within the Tax Database using the same methods described above.

.. code-block:: bash

   curl "https://www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/marsupial%20meta"
   [
     {
       "taxId": "1477400",
       "scientificName": "marsupial metagenome",
       "displayName": "marsupial metagenome"
       "binomial" : "false"
     }

If you are submitting a metagenomic sample (e.g. for metagenomic reads) there are numerous metagenomic taxa. To view all
environmental metagenome taxonomy available please visit the
`"metagenomes" tax node <https://www.ebi.ac.uk/ena/browser/view/408169?show=tax-tree>`_.
Click the arrows to expand lineages:

.. image:: images/tax_p01.png
   :align: center

The metagenomic term that is used to describe the biome is also the scientific name of the chosen taxon and can be used
to find the tax ID in the same methods described above.
For example, you can find the tax ID for *termite fungus garden metagenome* here:

.. code-block:: bash

   www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/termite fungus garden metagenome

Please note that new metagenome taxonomic records are rarely added, particularly those that add granularity.
Please use the closest available choice, even if this is a less granular option.
Only request a new term if you are sure you are unable to use anything in the lists available.


Environmental Organism-Level Taxonomy
-------------------------------------

If you are submitting assembled/annotated sequences which are identified taxonomically from homology alone with no prior
culturing or isolation of the organism, this is considered an *environmental sample*.
As an example, these may have been produced by 16S amplification of a metagenomic sample. These samples should be registered
with a suitable taxonomy to make it clear they were derived from an environmental source.
A typical use-case of this would be the submission of a single fully assembled genome from a mixed DNA sample (i.e.,
from a metagenomic source).

Exceptions to this group include organisms which can be reliably recovered from their diseased host (e.g. endosymbionts,
phyoplasmas) and organisms from samples which are readily identifiable by other means (e.g. cyanobacteria).
Such organisms are not considered in the way described here.

The taxonomy used for environmental organism-level samples should have an identification which is as granular as possible.
A general environmental record should also be registered to describe the biome that was originally sequenced.
This biome-level environmental sample should also be referenced within the organism-level sample using the "sample
derived from" attribute. The metadata structure for metagenomic submissions is described `here <../../submit/assembly/metagenome.html>`_.
If you are unsure whether your sample should be
registered as environmental, contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ for assistance.

When registering an environmental organism-level sample, more granular identification is preferred, up to genus level.
A non-binomial genus-level taxonomy with a species epithet can be used, for example:

::

    Escherichia sp.
    Bacillus sp.
    Thermococcus sp.

For fungi, the 'sp.' is dropped:

::

    uncultured <Rank>
    uncultured Glomus
    uncultured Saccharomycetes

If a more granular identification can not be used, a Family or Order level taxon id may also be used, for example:

::

    Neisseriaceae bacterium  (taxid:2014784)
    Spirochaetaceae bacterium  (taxid:1898206)
    Pleosporales sp. enrichment culture  (taxid:1836897)
    Filobasidium mucilaginum  (taxid:2877763)
