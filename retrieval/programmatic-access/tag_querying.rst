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

+-------------------+---------------------------------------------------------+------------------------------------------------------+
| high level tag    | description                                             | object type                                          |
+===================+=========================================================+======================================================+
|| pathogen         || The sample has been automatically determined to        || assembly; sample; sequence; study; secondary_study; |
||                  || belong to the Pathogens Portal                         || taxonomy                                            |
+-------------------+---------------------------------------------------------+------------------------------------------------------+
|| coastal_brackish || The sample has been automatically determined to        || read_run; sample; taxonomy                          |
||                  || evaluation of GPS and other parameters to have         ||                                                     |
||                  || some evidence of being collected from either a         ||                                                     |
||                  || coastal or brackish environment                        ||                                                     |
+-------------------+---------------------------------------------------------+------------------------------------------------------+
|| freshwater       || The sample has been automatically determined to        || read_run; sample; taxonomy                          |
||                  || evaluation of GPS and other parameters to have         ||                                                     |
||                  || some evidence of being collected from a                ||                                                     |
||                  || freshwater environment                                 ||                                                     |
+-------------------+---------------------------------------------------------+------------------------------------------------------+
|| marine           || The sample has been automatically determined to        || read_run; sample; taxonomy                          |
||                  || evaluation of GPS and other parameters to have         ||                                                     |
||                  || some evidence of being collected from a                ||                                                     |
||                  || marine environment                                     ||                                                     |
+-------------------+---------------------------------------------------------+------------------------------------------------------+
|| terrestrial      || The sample has been automatically determined to        || read_run; sample; taxonomy                          |
||                  || evaluation of GPS and other parameters to have         ||                                                     |
||                  || some evidence of being collected from a                ||                                                     |
||                  || terrestrial environment                                ||                                                     |
+-------------------+---------------------------------------------------------+------------------------------------------------------+
|| datahub          || The sample has been referenced to a datahub            || analysis; read_run; sample; secondary_study         | 
||                  || Currently tags have been generated for                 ||                                                     |
||                  || `FAANG <https://data.faang.org/home>` and              ||                                                     |
||                  || `Pathogen <https://www.pathogensportal.org/datahubs.>` ||                                                     |
+-------------------+---------------------------------------------------------+------------------------------------------------------+
|| xrefs            || The sample has been referenced to am external          || Depends on how the user submitted                   |
||                  || to the EMBL-EBI repository. Currently tags have        ||                                                     |
||                  || been generated for WORMS and UniEUK                    ||                                                     |
+-------------------+---------------------------------------------------------+------------------------------------------------------+
|| covid19          || The sample has been automatically determined to        || analysis; read_run; sample; sequence; study         |
||                  || belong to the COVID19 portal                           ||                                                     |
+-------------------+---------------------------------------------------------+------------------------------------------------------+




^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Tables of All Object High and Low Level Tags
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

These are at several types of objects especially sample and taxonomy.  Please see the object types in the previous (high level tag)
table, to see what they apply to.

**Pathogen Related Tags**

+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
| tag presentation    | high level tag | low level tag     | description                                           | comment                                      |
+=====================+================+===================+=======================================================+==============================================+
|| pathogen           || pathogen      || Object is some   || There will likely be other low level tags to provide ||                                             |
||                    ||               || type of pathogen || context.                                             ||                                             |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
| pathogen:priority   | pathogen       | priority          |                                                       |                                              |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
|| pathogen:bacterium || pathogen      || bacterium        || Object is of a bacterium organism.                   || At the time of documentation, the bacterium |
||                    ||               ||                  ||                                                      || is not specifically pathogenic.             |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
|| pathogen:fungus    || pathogen      || fungus           || Object is of a fungus organism.                      || At the time of documentation, the fungus    |
||                    ||               ||                  ||                                                      || is not specifically pathogenic.             |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
|| pathogen:helminth  || pathogen      || helminth         || Object is of a helminth organism.                    || At the time of documentation, the helminth  |
||                    ||               ||                  ||                                                      || is not specifically pathogenic.             |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
|| pathogen:protozoan || pathogen      || protozoan        || Object is of a protozoan organism.                   || At the time of documentation, the protozoan |
||                    ||               ||                  ||                                                      ||                                             |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
|| pathogen:virus     || pathogen      || virus            || Object is of a virus organism.                       || At the time of documentation, the virus     |
||                    ||               ||                  ||                                                      || is not specifically pathogenic.             |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
|| datahub:faang      || datahub       || Faang            || Is a Functional Annotation of Animal Genomes project |                                              |
||                    ||               ||                  || `(FAANG) <https://data.faang.org/home>`_ sample      |                                              |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
| datahub:metagenome  | datahub        | metagenome        | Is a metagenome and present in that datahub           |                                              |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
| covid19             |                | covid19           | Object associated with COVID-19                       |                                              |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+
| covid19Host         |                | covid19Host       | Object associated with a COVID-19 Host                |                                              |
+---------------------+----------------+-------------------+-------------------------------------------------------+----------------------------------------------+

**Geographical Tags**

+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| tag presentation       | high level tag   | low level tag     | description                             | comment                                 |
+========================+==================+===================+=========================================+=========================================+
| coastal_brackish       | coastal_brackish |                   || Evidence that the object is “coastal   || There will likely be other low level   |
|                        |                  |                   || or brackish” environment associated.   || tags to provide context.               |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| coastal_brackish:high  | coastal_brackish | high_confidence   || Strong evidence that the object is     |                                         |
| _confidence            |                  |                   || “coastal or brackish” environment      |                                         |
|                        |                  |                   || associated.                            |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| coastal_brackish:medium| coastal_brackish | medium_confidence || Moderate evidence that the object is   |                                         |
| _confidence            |                  |                   || “coastal or brackish” environment      |                                         |
|                        |                  |                   || associated.                            |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| coastal_brackish:low_c | coastal_brackish | low_confidence    || Weak evidence that the object is       |                                         |
| onfidence              |                  |                   || “coastal or brackish” environment      |                                         |
|                        |                  |                   || associated.                            |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| freshwater             | freshwater       |                   || Evidence that it is “freshwater”       || There will likely be other low level   |
|                        |                  |                   || environment associated                 || tags to provide context.               |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| freshwater:high_confid | freshwater       | high_confidence   || Strong evidence that the object is     |                                         |
| ence                   |                  |                   || freshwater environment associated.     |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| freshwater:medium_conf | freshwater       | medium_confidence || Moderate evidence that the object is   |                                         |
| idence                 |                  |                   || freshwater environment associated.     |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| freshwater:low_confide | freshwater       | low_confidence    || Weak evidence that the object is       |                                         |
| nce                    |                  |                   || freshwater environment associated.     |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| marine                 | marine           |                   || Evidence that it is “marine”           || There will likely be other low level   |
|                        |                  |                   || environment associated.                || tags to provide context.               |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| marine:high_confidence | marine           | high_confidence   || Strong evidence that the object is     |                                         |
|                        |                  |                   || marine environment associated.         |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| marine:medium_confiden | marine           | medium_confidence || Moderate evidence that the object is   |                                         |
| ce                     |                  |                   || marine environment associated.         |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| marine:low_confidence  | marine           | low_confidence    || Weak evidence that the object is       |                                         |
|                        |                  |                   || marine environment associated.         |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| terrestrial            | terrestrial      |                   || Evidence that it is terrestrial(land)  || There will likely be other low level   |
|                        |                  |                   || environment associated.                || tags to provide context.               |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| terrestrial:high_confi | terrestrial      | high_confidence   || Strong evidence that the object is     |                                         |
| dence                  |                  |                   || terrestrial(land) environment          |                                         |
|                        |                  |                   || associated.                            |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| terrestrial:medium_con | terrestrial      | medium_confidence || Moderate evidence that the object is   |                                         |
| fidence                |                  |                   || terrestrial(land) environment          |                                         |
|                        |                  |                   || associated.                            |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+
| terrestrial:low_confid | terrestrial      | low_confidence    || Weak evidence that the object is       |                                         |
| ence                   |                  |                   || terrestrial(land) environment          |                                         |
|                        |                  |                   || associated.                            |                                         |
+------------------------+------------------+-------------------+-----------------------------------------+-----------------------------------------+


**Cross Reference Tags**

+------------------------+------------------+-------------------+--------------------------------------------------------+-----------------------------------+
| tag presentation       | high level tag   | low level tag     | description                                            | comment                           |
+========================+==================+===================+========================================================+===================================+
| xref:arrayexpress      | xref             | arrayexpress      || Object associated with an ArrayExpress                || A xref is available that links   |
|                        |                  |                   || `AE <https://www.ebi.ac.uk/biostudies/arrayexpress>`_ || to ArrayExpress                  |
|                        |                  |                   || record                                                |                                   |
+------------------------+------------------+-------------------+--------------------------------------------------------+-----------------------------------+
| xref:europepmc         | xref             | europepmc         || Object associated with a European PubmedCentral       || A xref is available that links   |
|                        |                  |                   || `EPMC <https://europepmc.org>`_ record                || to European PubmedCentral        |
+------------------------+------------------+-------------------+--------------------------------------------------------+-----------------------------------+
| xref:pubmed            | xref             | pubmed            || Object associated with an `NCBI Pubmed                || A xref is available that links   |
|                        |                  |                   || <https://pubmed.ncbi.nlm.nih.gov>`_ record            || to NCBI Pubmed                   |
+------------------------+------------------+-------------------+--------------------------------------------------------+-----------------------------------+
| xref:worms             | xref             | worms             || Object associated with a                              |                                   |
|                        |                  |                   || `WoRMS <https://www.marinespecies.org/>`_ record      |                                   |
+------------------------+------------------+-------------------+--------------------------------------------------------+-----------------------------------+
| xref:unieuk            | xref             | unieuk            || Object associated with a                              || A xref is available that links   |
|                        |                  |                   || Universal taxonomic framework and integrated          || to UNIEUK                        |
|                        |                  |                   || reference gene databases for Eukaryotic biology,      |                                   |
|                        |                  |                   || ecology, and evolution                                |                                   |
|                        |                  |                   || `(UNIEUK ) <https://unieuk.net>`_ record              |                                   |
+------------------------+------------------+-------------------+--------------------------------------------------------+-----------------------------------+



-------------------------
How are the Tags Created?
-------------------------

The tags are typically assigned by automatic processes analysing the user supplied metadata around an object. 

For example, the identification of “marine” sample records is systematically assessed by a combination of geo-coordinates and taxonomic evidence. We can further qualify such identification by a level of confidence which is dictated by a combination of the evidence available on the record to support said assertion. 

This is an evolving and continuously improving process, where the algorithms and the rule-sets used for classification can be updated as new insights are obtained and thus results in the assigned tags being regularly refreshed. The flexibility of this system allows for new classifications to be easily created allowing the definition of new, high-level contextual groupings for ENA data making the process of discovery more intuitive for certain user communities.


-------------
Miscellaneous
-------------

The tags are all less than 21 Unicode characters in length.

N.B. The tags described in this page are not to be confused with Locus Tags.
