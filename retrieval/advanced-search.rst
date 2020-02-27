=================================
How To Perform An Advanced Search
=================================

The `ENA Advanced Search interface <https://www.ebi.ac.uk/ena/browser/advanced-search>`_
interface is a powerful way to search the archive for datasets which meet
criteria of interest to you as a user. The below guide will walk you through
the interface using examples. Use this to familiarise yourself with the
interface before conducting your own searches.


Example Uses
============

Below are three example cases you can follow to better understand the advanced
search interface:

- `Find Neanderthal Read Data`_
- `Find Samples Based On Checklists`_


Find Neanderthal Read Data
--------------------------

Locate all read data submitted for Neanderthals

1. Navigate to the advanced search browser:
   https://www.ebi.ac.uk/ena/browser/advanced-search

2. The interface first asks you to select the datatype you want to search for.
   Use the '?' icon next to the drop-down box to learn more about the options.
   We are searching for read data, so select 'Raw Reads':

.. image:: images/advanced-search-1.png

3. Click 'Next'

4. You now have opportunity to apply filters which will limit the set of reads
   which are provided.

5. Use the blue buttons on the left to select different filter categories, or
   use the 'Type to filter query params' box to search for a specific parameter

6. In the above box, we have selected the 'Taxonomy and related' category, and
   chosen 'NCBI Taxonomy' from the dropdown.

7. All submissions to ENA must use a valid species-level taxon from the NCBI
   taxonomy database. Begin typing and suggestions appear. We have put
   'Neanderthal'. Notice multiple suggestions are given; in this case, they
   are synonyms, as indicated by their matching taxon IDs (63221).

8. We have entered all the parameters we want, so click 'Search' at the bottom
   right. After a moment, you will be presented with a list of run objects.

.. image:: images/advanced-search-2.png

9. Now click 'Next' twice to get to the Fields selection box

10. You can use the 'Available Fields' box to choose any fields you wish to see
    included in the table of results. Not all of these will always be relevant

11. When you are satisfied with the fields you have chosen, click 'Search' to
    see the results of your query


Find Samples Based On Checklists
--------------------------------

ENA sample objects represented physical samples used in sequencing experiments.
Users must conform to a checklist of values when submitting samples.
We can leverage this in searches to find samples belonging to a checklist
which describes materials of interest to us.

Follow the below guide to find samples registered using the checklist named
'GSC MIxS human gut', which describes human gut microbiome samples

1. Navigate to the advanced search browser:
   https://www.ebi.ac.uk/ena/browser/advanced-search

2. The interface first asks you to select the datatype you want to search for.
   Use the '?' icon next to the drop-down box to learn more about the options.
   Select the option simply named 'Samples'

.. image:: images/advanced-search-3.png

3. Click 'Next'

4. Categories of search parameters are found by clicking the blue boxes to the
   left of the page. Select the 'Database record' category now

5. In the beige box, use the dropdown box to select the 'Checklist' option

6. A new dropdown box will appear: use this to select the checklist you are
   interested in - 'GSC MIxS human gut' in this case

7. Notice the accession number of the checklist, 'ERC000015', is added to the
   'Query' box

.. image:: images/advanced-search-4.png

8. Now click 'Next' twice to get to the Fields selection box

9. You can use the 'Available Fields' box to choose any fields you wish to see
   included in the table of results. Not all of these will always be relevant

10. When you are satisfied with the fields you have chosen, click 'Search' to
    see the results of your query


Rulespace
=========

Rulespace is a tool which allows you save your searches, give them names, rerun
them and share them with other people. Learn more about it in the `Rulespace
Guide <advanced-search/rulespace.html>`_.
