========================
Text Tags On ENA Objects
========================

.. contents:: Table of Contents
   :local:
   :depth: 2

.. _my-reference-label:

What are tags and why are they useful?
--------------------------------------

Tags are controlled textual annotations added to ENA records to make searching and filtering easier. They can help identify records for a data portal, such as the `Pathogens Portal <https://www.pathogensportal.org>`_, or select data associated with a particular environment or external resource.

A record can have zero or multiple tags. Tags can also have child tags that provide more specific classifications. For example, pathogen:bacterium identifies a record classified in the bacterium pathogen group.

Tags are assigned using taxonomy, study membership, ENA Data Hub metadata, structured sample data, WoRMS cross-references, metagenome metadata and geographic information. Cross-reference tags are based on external data resources, as described in `Cross-reference tags`_.

What tags are available?
------------------------

.. list-table:: Available tags
   :widths: 20 35 45
   :header-rows: 1

   * - Tag
     - Child tags
     - Description
   * - pathogen
     - bacterium, fungus, helminth, protozoan, virus (with child tag arbovirus), priority
     - Classification based on pathogen taxonomy lists.
   * - covid19
     -
     - COVID-19 classification based on taxonomy or study membership.
   * - covid19_host
     -
     - Eukaryotic records belonging to COVID-19 host studies.
   * - datahub
     - Data hub name or identifier
     - Membership of an ENA Data Hub.
   * - env_tax
     - marine, brackish, freshwater, terrestrial
     - Environmental classifications derived from WoRMS or metagenome metadata.
   * - env_geo
     - marine, coastal, freshwater, terrestrial
     - Environmental classifications derived from geographic location.
   * - structured_data
     - Structured data types
     - Structured data present in a sample's BioSamples record.

Tags by Data Class
------------------

The following table shows which tags are assigned to each type of ENA record.
Cross-reference tags are listed separately under `Cross-reference tags`_.

.. list-table:: Tags by record type
   :widths: 25 75
   :header-rows: 1

   * - Data class
     - Classifications
   * - taxon
     - pathogen, env_tax, env_geo
   * - sample
     - env_tax, env_geo, pathogen, covid19, structured_data
   * - analysis
     - datahub, covid19
   * - read_run
     - datahub, covid19, covid19_host
   * - assembly
     - pathogen
   * - sequence
     - pathogen, covid19
   * - secondary_study
     - datahub, pathogen
   * - study
     - pathogen, covid19

How are the Tags Created?
-------------------------

Tags are assigned automatically from record metadata and reference data. The
classification rules and reference sources can change, and tags are refreshed
to reflect these updates.

pathogen
^^^^^^^^

Pathogen tags are based on maintained lists of taxonomy IDs. Records associated
with a listed taxon or one of its descendants receive the corresponding tag.
The pathogen child tags are bacterium, fungus, helminth, protozoan, virus and
priority. The virus tag has a further child tag, arbovirus.

covid19
^^^^^^^

A record receives the covid19 tag when either of the following conditions
is true:

* It is associated with SARS-CoV-2 taxonomy ID 2697049.
* It belongs to a component study of one of the COVID-19 umbrella studies: PRJEB39908, PRJEB40349 or PRJEB40770.

covid19_host
^^^^^^^^^^^^

A record receives the covid19_host tag when both of the following conditions
are true:

* It is in the descendant taxonomy of all eukaryotes, rooted at taxonomy ID 2759.
* It belongs to a component study of one of the COVID-19 host umbrella studies: PRJEB40771 or PRJEB40772.

datahub
^^^^^^^

Data hub tags identify records shared with an ENA Data Hub. The tag uses the
data hub's display name when available, or its identifier otherwise.

Only data hubs with a display name that does not start with ``dcc`` are shown
in the browser.

env_tax
^^^^^^^

Taxonomy-derived environmental tags use environmental information associated
with the organism in `WoRMS <https://www.marinespecies.org/>`_ and metagenome
metadata. WoRMS information is checked first; information from closely related
taxa may also be used.

The possible child tags are marine, brackish, freshwater and
terrestrial.

env_geo
^^^^^^^

Geography-derived environmental tags are assigned by comparing a record's
geographic coordinates with maps of marine, coastal, freshwater and terrestrial
areas.

.. list-table:: Geographic tag sources
   :widths: 25 75
   :header-rows: 1

   * - Child tag
     - Shapefile source
   * - marine
     - `OpenStreetMap water polygons <https://osmdata.openstreetmap.de/data/water-polygons.html>`_
   * - coastal
     - Longhurst Provinces from `Marine Regions <https://www.marineregions.org/>`_,
       filtered to coastal features
   * - freshwater
     - `WWF Global 200 freshwater <https://www.worldwildlife.org/publications/global-200>`_
   * - terrestrial
     - `OpenStreetMap land polygons <https://osmdata.openstreetmap.de/data/land-polygons.html>`_

structured_data
^^^^^^^^^^^^^^^

Structured data tags identify samples with structured data in BioSamples.
Tag values use lower-case text, with spaces and hyphens replaced by underscores.

Cross-reference tags
--------------------

Cross-reference (xref) tags are based on external data resources that provide
mappings between their records and ENA records. A tag for a specific external
resource can be enabled on request.

Cross-reference tags identify the external resource and record using the format
xref:resource:ID. For example, xref:UniEuk:49054 links to UniEuk record 49054.
WoRMS cross-references link taxon records to WoRMS; environmental information
from WoRMS is also used to assign env_tax tags. The table below lists the
resource prefixes.

.. list-table:: Cross-reference tags
   :widths: 30 45 25
   :header-rows: 1

   * - Tag prefix
     - External resource
     - Data class
   * - xref:arrayexpress
     - `ArrayExpress <https://www.ebi.ac.uk/biostudies/arrayexpress>`_
     - study
   * - xref:europepmc
     - `Europe PMC <https://europepmc.org>`_
     - study
   * - xref:pubmed
     - `PubMed <https://pubmed.ncbi.nlm.nih.gov>`_
     - study
   * - xref:worms
     - `WoRMS <https://www.marinespecies.org/>`_
     - taxon
   * - xref:unieuk
     - `UniEuk <https://unieuk.net>`_
     - sequence

Miscellaneous
-------------

The tags described on this page are distinct from locus tags.
