========================
Text Tags On ENA Objects 
========================

-----------------
Table of Contents
-----------------

* What are Tags and Why are they Useful?
* How many Tags can an Object Possess?
* What Tags are Available?
* How are the Tags Created?
* Miscellaneous

.. _my-reference-label:

--------------------------------------
What are Tags and Why are they Useful?
--------------------------------------
The tags are controlled textual annotations provided to objects, such as sample and taxonomy.

The purpose of these is to make searching and filtering much easier. In ENA they are often used to determine object membership of certain data portals. Vice versa they can also be used to easily access vignettes of data from which to build a new data portal rapidly.

Examples:

* Find all pathogenic samples by using the “pathogen” tag (this is used to drive the data coverage of the `Pathogens Portal <https://www.pathogensportal.org>`_.)
* Use “marine:high_confidence” tag to find all samples that are highly likely to be from the marine environment.
* Find all records in ENA data that have a corresponding record cross-referenced to the `WoRMS - World Register of Marine Species <https://www.marinespecies.org/>`_, by searching “xref:worms”.

The tagging system has proved useful in determining the object membership of certain domain specific data portals such as Pathogens Portal. Conversely they can also be used to easily obtain vignettes of data from which to build a new data portal rapidly.

------------------------------------
How many Tags can an Object Possess?
------------------------------------
An object such as a sample can have zero or multiple tags. 

A sample for example could be tagged as both “marine:high_confidence” and “terrestrial:low_confidence”.

------------------------
What Tags are Available?
------------------------

Most of the sample and taxonomy tags have the format:  high_level_tag:low_level_tag. The high level tag is often used to provide some extra context to the more granular tag.


^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Table of Object High Level Tags
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


.. csv-table:: High Level Tags
   :header: "high level tag", "description", "object type"
   :widths: 20, 300, 50

   "pathogen", "The record has been determined to be from a pathogenic source", "assembly; sample; sequence; study; secondary_study; taxonomy"
   "coastal_brackish", "The record has been determined by evaluation of GPS and other parameters to have some evidence of being collected from either a coastal or brackish environment.", "read_run; sample; taxonomy"
   "freshwater", "The record has been determined by evaluation of GPS and other parameters to have some evidence of being collected from a freshwater environment.", "read_run; sample; taxonomy"
   "marine", "The record has been determined by evaluation of GPS and other parameters to have some evidence of being collected from a marine environment.", "read_run; sample; taxonomy"
   "terrestrial", "The record has been determined by evaluation of GPS and other parameters to have some evidence of being collected from a terrestrial environment.", "read_run; sample; taxonomy"
   "datahub", "The record has been determined to have been shared with an ENA Data Hub.", "analysis; read_run; sample; secondary_study"
   "xref", "The record has been referenced in an external to the EMBL-EBI repository. Currently tags have been generated for WoRMS, UniEUK, PubMed, Europe PMC and ArrayExpress.",	"Depends on how the user submitted"
   "covid19", "The record has been determined to be COVID-19 related based on taxonomy or belonging to COVID-19 specific umbrella studies, or one of their child studies.",	"analysis; read_run; sample; sequence; study"



^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Table of All Object High and Low Level Tags
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

These are at several types of objects especially sample and taxonomy.  Please see the object types in the previous (high level tag)
table, to see what they apply to.

.. list-table:: Object High and Low Level Tags
   :widths: 15 10 30 10 10
   :header-rows: 1

   * - tag presentation
     - high level tag
     - low level tag
     - description
     - comment
   * - pathogen
     - pathogen
     - 
     - Object is some type of pathogen
     - There will likely be other low level tags to provide context.
   * - pathogen:priority
     - pathogen
     - priority
     - A pathogen that has been identified by WHO to pose a serious threat to humans.
     - 
   * - pathogen:bacterium
     - pathogen
     - bacterium
     - Object is of a bacterium organism.
     - At time of documentation the bacterium is not specifically pathogenic.
   * - pathogen:fungus
     - pathogen
     - fungus
     - Object is of a fungus orgnism.
     - At time of documentation the fungus is not specifically pathogenic.
   * - pathogen:helminth
     - pathogen
     - helminth
     - 
     - At time of documentation the helminth is not specifically pathogenic.
   * - pathogen:protozoan
     - pathogen
     - protozoan
     - Object is of a protozon organism.
     - At time of documentation the protozoan is not specifically pathogenic.
   * - pathogen:virus
     - pathogen
     - virus
     - Object is of a virus organism.
     - At time of documentation the virus is not specifically pathogenic.
   * - coastal_brackish
     - coastal_brackish
     - 
     - Some evidence that the object is “coastal or brackish” environment associated.
     - There will likely be other low level tags to provide context.
   * - coastal_brackish:high_confidence
     - coastal_brackish
     - high_confidence
     - Strong evidence that the object is “coastal or brackish” environment associated.
     - 
   * - coastal_brackish:medium_confidence
     - coastal_brackish
     - medium_confidence
     - Moderate  evidence that the object is “coastal or brackish” environment associated.
     - 
   * - coastal_brackish:low_confidence
     - coastal_brackish
     - low_confidence
     - Weak evidence that the object is “coastal or brackish” environment associated.
     -
   * - freshwater
     - freshwater
     - 
     - Some evidence that it is “freshwater” environment assosciated
     - There will likely be other low level tags to provide context.
   * - freshwater:high_confidence
     - freshwater
     - high_confidence
     - Strong evidence that the object is freshwater environment associated.
     - 
   * - freshwater:medium_confidence
     - freshwater
     - medium_confidence
     - Moderate  evidence that the object is freshwater environment associated.
     - 
   * - freshwater:low_confidence
     - freshwater
     - low_confidence
     - Weak  evidence that the object is freshwater environment associated.
     - 
   * - marine
     - marine
     - 
     - Some evidence that it is “marine” environment assosciated
     - There will likely be other low level tags to provide context.
   * - marine:high_confidence
     - marine
     - high_confidence
     - Strong evidence that the object is marine environment associated.
     - 
   * - marine:medium_confidence
     - marine
     - medium_confidence
     - Moderate  evidence that the object is marine environment associated.
     - 
   * - marine:low_confidence
     - marine
     - low_confidence
     - Weak  evidence that the object is marine environment associated.
     - 
   * -  terrestrial
     - terrestrial
     - 
     - Some evidence that it is terrestrial(land) environment associated.
     - There will likely be other low level tags to provide context.
   * - terrestrial:high_confidence
     - terrestrial
     - high_confidence
     - Strong evidence that the object is terrestrial(land) environment associated.
     - 
   * - terrestrial:medium_confidence
     - terrestrial
     - medium_confidence
     - Moderate  evidence that the object is terrestrial(land) environment associated.
     -
   * - terrestrial:low_confidence
     - terrestrial
     - low_confidence
     - Weak evidence that the object is terrestrial(land) environment associated.
     - 
   * - xref:arrayexpress
     - xref
     - arrayexpress
     - Object associated with an `ArrayExpress <https://www.ebi.ac.uk/biostudies/arrayexpress>`_ record
     - A xref is available that links to ArrayExpress
   * - xref:europepmc
     - xref
     - europepmc
     - Object associated with a `Europe PMC <https://europepmc.org>`_ record
     - A xref is available that links to Europe PMC
   * - xref:pubmed
     - xref
     - pubmed
     - Object associated with a `PubMed <https://pubmed.ncbi.nlm.nih.gov>`_ record
     - A xref is available that links to PubMed
   * - xref:worms
     - xref
     - worms
     - Object associated with a `WoRMS <https://www.marinespecies.org/>`_ record
     - 
   * - xref:unieuk
     - xref
     - unieuk
     - Object associated with a `UniEuk (Universal taxonomic framework and integrated reference gene databases for Eukaryotic biology, ecology, and evolution ) <https://unieuk.net>`_ record
     - A xref is available that links to UniEuk
   * - covid19
     - 
     - covid19
     - Object associated with covid19
     - 
   * - covid19Host
     - 
     - covid19Host
     - Object associated with a covid19 Host
     - 

-------------------------
How are the Tags Created?
-------------------------

The tags are typically assigned by automated processes analysing the user supplied metadata around an object.

This is an evolving and continuously improving process, where the algorithms and the rule-sets used for classification can be updated as new insights are obtained and thus results in the assigned tags being regularly refreshed. The flexibility of this system allows for new classifications to be easily created allowing the definition of new, high-level contextual groupings for ENA data making the process of discovery more intuitive for certain user communities.

^^^^^^^^
pathogen
^^^^^^^^
The pathogen tags are identified based on NCBI taxonomy IDs. The different types of pathogens have a maintained list of taxonomy IDs, all records associated with the taxonomy ID or a taxonomy ID in that lineage get the pathogen tag.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
coastal_brackish, freshwater, marine, terrestrial
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The identification of coastal_brackish, freshwater, marine and terrestrial sample records are systematically assessed by a combination of geo-coordinates and/or taxonomic evidence. Taxonomic information is taken from `WoRMS <https://www.marinespecies.org/>`_, and 4 shapefiles are used for the coordinates:

* coastal_brackish: Longhurst shapefile downloaded from https://www.marineregions.org/
* freshwater: WWF’s Global 200 g200_fw_category shapefile: https://www.worldwildlife.org/publications/global-200
* marine: OpenStreetmap’s water polygons shapefile: https://osmdata.openstreetmap.de/data/water-polygons.html
* terrestrial: OpenStreetmap’s land polygons shapefile: https://osmdata.openstreetmap.de/data/land-polygons.html

We further qualify such identification by a level of confidence which is dictated by a combination of the evidence available on the record to support said assertion.

^^^^
xref
^^^^
xref (Cross Reference) tags are based on external data resources that have provided mappings between their records and ENA records. A tag for a specific external resource can be enabled on request. Currently xref:worms tags are available on taxons; xref:arrayexpress, xref:europepmc, xref:pubmed on studies; xref:unieuk on sequences.

^^^^^^^
datahub
^^^^^^^
The datahub tag is assigned based on whether the record has been shared with an ENA Data Hub.

^^^^^^^
covid19
^^^^^^^
The record is related to COVID-19 data, as indicated by it being included under the COVID-19 specific umbrella studies PRJEB39908, PRJEB40349, PRJEB40770, or one of their child studies.

-------------
Miscellaneous
-------------

The tags are all less than 21 Unicode characters in length.

N.B. The tags described in this page are not to be confused with Locus Tags.
