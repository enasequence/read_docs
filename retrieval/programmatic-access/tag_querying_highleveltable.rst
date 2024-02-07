


+------------------------+------------+----------+
| Header row, column 1   | Header 2   | Header 3 |
+========================+============+==========+
| body row 1, column 1   | column 2   | column 3 |
+------------------------+------------+----------+
| body row 2             | Cells may span        |
+------------------------+-----------------------+

some textual

reference

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

Geographical Tags

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




+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| tag presentation                   | high level tag   | low level tag                   | description                                                                                                                                                                             | comment                                                                |
+====================================+==================+=================================+=========================================================================================================================================================================================+========================================================================+
| coastal_brackish                   | coastal_brackish |                                 | Some evidence that the object is “coastal or brackish” environment associated.                                                                                                        | There will likely be other low level tags to provide context.          |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| coastal_brackish:high_confidence   | coastal_brackish | high_confidence                 | strong evidence that the object is “coastal or brackish” environment associated.                                                                                                      |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| coastal_brackish:medium_confidence | coastal_brackish | medium_confidence               | moderate evidence that the object is “coastal or brackish” environment associated.                                                                                                    |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| coastal_brackish:low_confidence    | coastal_brackish | low_confidence                  | weak evidence that the object is “coastal or brackish” environment associated.                                                                                                        |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| freshwater                         | freshwater       |                                 | Some evidence that it is “freshwater” environment assosciated                                                                                                                         | There will likely be other low level tags to provide context.          |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| freshwater:high_confidence         | freshwater       | high_confidence                 | Strong evidence that the object is freshwater environment associated.                                                                                                                   |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| freshwater:medium_confidence       | freshwater       | medium_confidence               | moderate evidence that the object is freshwater environment associated.                                                                                                                 |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| freshwater:low_confidence          | freshwater       | low_confidence                  | weak evidence that the object is freshwater environment associated.                                                                                                                     |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| marine                             | marine           |                                 | Some evidence that it is “marine” environment assosciated                                                                                                                             | There will likely be other low level tags to provide context.          |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| marine:high_confidence             | marine           | high_confidence                 | Strong evidence that the object is marine environment associated.                                                                                                                       |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| marine:medium_confidence           | marine           | medium_confidence               | moderate evidence that the object is marine environment associated.                                                                                                                     |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| marine:low_confidence              | marine           | low_confidence                  | weak evidence that the object is marine environment associated.                                                                                                                         |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| terrestrial                        | terrestrial      |                                 | Some evidence that it is terrestrial(land) environment associated.                                                                                                                      | There will likely be other low level tags to provide context.          |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| terrestrial:high_confidence        | terrestrial      | high_confidence                 | Strong evidence that the object is terrestrial(land) environment associated.                                                                                                            |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| terrestrial:medium_confidence      | terrestrial      | medium_confidence               | moderate evidence that the object is terrestrial(land) environment associated.                                                                                                          |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| terrestrial:low_confidence         | terrestrial      | low_confidence                  | weak evidence that the object is terrestrial(land) environment associated.                                                                                                              |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+



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


another test

+--------------------+---------------------------------------------------+--------------------------------------------------------+
| high level tag     | description                                       | object type                                            |
+====================+===================================================+========================================================+
| | pathogen         | | The sample has been automatically determined to | | assembly; sample; sequence; study; secondary_study;  |
|                    | | belong to the Pathogens Portal                  | | taxonomy                                             |
+--------------------+---------------------------------------------------+--------------------------------------------------------+
| | coastal_brackish | | The sample has been automatically determined by | | read_run; sample; taxonomy                           |                                                     |
|                    | | evaluation of GPS and other parameters to have  |                                                        |                                                      |
|                    | | some evidence of being collected from either a  |                                                        |                                                      |
|                    | | coastal or brackish environment.                |                                                        |                                                      |
+--------------------+---------------------------------------------------+--------------------------------------------------------+



Pathogen Related Tags

chatgpt

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




+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| tag presentation                   | high level tag   | low level tag                   | description                                                                                                                                                                             | comment                                                                |
+====================================+==================+=================================+=========================================================================================================================================================================================+========================================================================+
| pathogen                           | pathogen         | Object is some type of pathogen | There will likely be other low level tags to provide context.                                                                                                                           |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| pathogen:priority                  | pathogen         | priority                        |                                                                                                                                                                                         |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| pathogen:bacterium                 | pathogen         | bacterium                       | Object is of a bacterium organism.                                                                                                                                                      | At time of documentation the bacterium is not specifically pathogenic. |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| pathogen:fungus                    | pathogen         | fungus                          | Object is of a fungus orgnism.                                                                                                                                                          | At time of documentation the fungus is not specifically pathogenic.    |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| pathogen:helminth                  | pathogen         | helminth                        |                                                                                                                                                                                         | At time of documentation the helminth is not specifically pathogenic.  |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| pathogen:protozoan                 | pathogen         | protozoan                       | Object is of a protozon organism.                                                                                                                                                       | At time of documentation the protozoan is not specifically pathogenic. |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| pathogen:virus                     | pathogen         | virus                           | Object is of a virus organism.                                                                                                                                                          | At time of documentation the virus is not specifically pathogenic.     |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| datahub:faang                      | datahub          | Faang                           | Is a `Functional Annotation of ANimal Genomes project (FAANG) <https://data.faang.org/home>`_ sample and present in that datahub                                                        |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| datahub:metagenome                 | datahub          | metagenome                      | Is a metagenome and present in that datahub                                                                                                                                             |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| covid19                            |                  | covid19                         | Object associated with covid19                                                                                                                                                          |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| covid19Host                        |                  | covid19Host                     | Object associated with a covid19 Host                                                                                                                                                   |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+

Reference Tags
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| tag presentation                   | high level tag   | low level tag                   | description                                                                                                                                                                             | comment                                                                |
+====================================+==================+=================================+=========================================================================================================================================================================================+========================================================================+
| xref:arrayexpress                  | xref             | arrayexpress                    | Object associated with an `ArrayExpress <https://www.ebi.ac.uk/biostudies/arrayexpress>`_ record                                                                                        | A xref is available that links to ArrayExpress                         |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| xref:europepmc                     | xref             | europepmc                       | Object associated with a `European PubmedCentral <https://europepmc.org>`_ record                                                                                                       | A xref is available that links to European PubmedCentral               |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| xref:pubmed                        | xref             | pubmed                          | Object associated with an `NCBI Pubmed <https://pubmed.ncbi.nlm.nih.gov>`_ record                                                                                                       | A xref is available that links to NCBI Pubmed                          |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| xref:worms                         | xref             | worms                           | Object associated with a `WoRMS <https://www.marinespecies.org/>`_ record                                                                                                               |                                                                        |
+------------------------------------+------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------+
| xref:unieuk                        | xref             | unieuk                          | Object associated with a `UNIEUK /(Universal taxonomic framework and integrated reference gene databases for Eukaryotic biology, ecology, and evolution ) <https://unieuk.net>`_ record | A xref is available that links to UNIEUK                               |









tag presentation
high level tag
low level tag
description
comment
pathogen
pathogen
Object is some type of pathogen
There will likely be other low level tags to provide context.
pathogen:priority
pathogen
priority
pathogen:bacterium
pathogen
bacterium
Object is of a bacterium organism.
At time of documentation the bacterium is not specifically pathogenic.
pathogen:fungus
pathogen
fungus
Object is of a fungus orgnism.
At time of documentation the fungus is not specifically pathogenic.
pathogen:helminth
pathogen
helminth
At time of documentation the helminth is not specifically pathogenic.
pathogen:protozoan
pathogen
protozoan
Object is of a protozon organism.
At time of documentation the protozoan is not specifically pathogenic.
pathogen:virus
pathogen
virus
Object is of a virus organism.
At time of documentation the virus is not specifically pathogenic.
coastal_brackish
coastal_brackish
Some evidence that the object is “coastal or brackish” environment associated.
There will likely be other low level tags to provide context.
coastal_brackish:high_confidence
coastal_brackish
high_confidence
strong evidence that the object is “coastal or brackish” environment associated.
coastal_brackish:medium_confidence
coastal_brackish
medium_confidence
moderate evidence that the object is “coastal or brackish” environment associated.
coastal_brackish:low_confidence
coastal_brackish
low_confidence
weak evidence that the object is “coastal or brackish” environment associated.
freshwater
freshwater
Some evidence that it is “freshwater” environment assosciated
There will likely be other low level tags to provide context.
freshwater:high_confidence
freshwater
high_confidence
Strong evidence that the object is freshwater environment associated.
freshwater:medium_confidence
freshwater
medium_confidence
moderate evidence that the object is freshwater environment associated.
freshwater:low_confidence
freshwater
low_confidence
weak evidence that the object is freshwater environment associated.
marine
marine
Some evidence that it is “marine” environment assosciated
There will likely be other low level tags to provide context.
marine:high_confidence
marine
high_confidence
Strong evidence that the object is marine environment associated.
marine:medium_confidence
marine
medium_confidence
moderate evidence that the object is marine environment associated.
marine:low_confidence
marine
low_confidence
weak evidence that the object is marine environment associated.
terrestrial
terrestrial
Some evidence that it is terrestrial(land) environment associated.
There will likely be other low level tags to provide context.
terrestrial:high_confidence
terrestrial
high_confidence
Strong evidence that the object is terrestrial(land) environment associated.
terrestrial:medium_confidence
terrestrial
medium_confidence
moderate evidence that the object is terrestrial(land) environment associated.
terrestrial:low_confidence
terrestrial
low_confidence
weak evidence that the object is terrestrial(land) environment associated.
datahub:faang
datahub
Faang
Is a Functional Annotation of ANimal Genomes project (FAANG) sample and present in that datahub
datahub:metagenome
datahub
metagenome
Is a metagenome and present in that datahub
xref:arrayexpress
xref
arrayexpress
Object associated with an ArrayExpress record
A xref is available that links to ArrayExpress
xref:europepmc
xref
europepmc
Object associated with a European PubmedCentral record
A xref is available that links to European PubmedCentral
xref:pubmed
xref
pubmed
Object associated with an NCBI Pubmed record