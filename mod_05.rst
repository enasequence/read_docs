=========================================================
Module 5: Updating Samples, Studies, Experiments and Runs
=========================================================

The interactive submission interface supports some editing of your submitted objects.
Access these existing objects by clicking the relevant tab after logging in to `Webin <https://www.ebi.ac.uk/ena/submit/sra/#home>`_.

Note that under no circumstances can an object's own accession or alias attribute be edited.

When editing the XML version of an object, you should in general leave the element tags unchanged.
These are the capitalised words enclosed in '<>'.
For example, in the below XML snippet you should leave the words 'ELEMENT' unchanged and edit the 'value'.

::

    <ELEMENT>value</ELEMENT>

- 1: `Study Edits`_
- 2: `Sample Edits`_
- 3: `Experiment And Run Edits`_


Study Edits
===========

Some parts of the study object can be edited.
These include the release date, title, description and publication references.

.. image:: images/mod_05_p03.png

1. Login to `Webin <https://www.ebi.ac.uk/ena/submit/sra/#home>`_ and find the studies tab.
2. Find the study in the list, or search for it by its accession.
3. If your study is confidential you can change the release date by clicking on the pencil icon and navigating to the required date in the calendar.
   To release the study simply select the current date/present day and set the following processes in motion:

	- Moving relevant sequence data files to a public archive.
	- Indexing and rendering the study and its objects so that they can be linked-to and visualised in the ENA browser.
	- Mirroring to INSDC databases, who will then make the data available through their services.

   Please allow up to 48 hours for newly released data to appear in the public database.
   Read more about this in our `Data Release Policies FAQ <release.html>`_

4. For edits besides changing the release date, click the 'Edit' button.

.. image:: images/mod_05_p04.png

5. The short name for the study will be visible in search outputs and overview pages whereas the descriptive title and abstract will be presented in the study's public page.
6. You can add the PMID of any papers related to your data.
   There will then be a link to the paper from your study's public page.
7. Study attributes are optional tag-value pairs you can specify to add extra information or to make your study more searchable.
   For example, you could add a 'DOI' tag with your paper's DOI as the value.
8. Save your changes when you are satisfied with your updates, or click 'Cancel' to abandon them.


Sample Edits
============

To edit a sample, find it in the list (note the search box) and click the 'Edit' button next to it.

.. image:: images/mod_05_p02.png

Your sample will be shown as an XML document which you can edit directly.
Make changes as required and click the 'Save' button; your changes will not be saved if they invalidate the file.
General XML errors and specific errors defined by us are prevented in this way.
Note that not all fields can be edited: the sample alias and accession are immutable, and you will not be allowed to remove an attribute which is required by the specified checklist.

.. image:: images/mod_05_p02_b.png

This method is useful for one-off edits but it is not feasible for editing many samples at once. For this you can use the `programmatic method <prog_07.html>`_.


Experiment And Run Edits
========================

Experiments and runs are both listed in the 'Runs' tab, where matched pairs of experiments and runs share a row in the table.
Note that their are separate 'Edit' buttons for the two object types:

.. image:: images/mod_05_p05.png

Be sure to use the correct edit button for the object you wish to edit.
When you click the edit button, you will be shown the relevant object in XML format.
Locate the element you wish to change and make the required changes, then click 'Save'.
You will not be able to save changes which invalidate the file.


Common Experiment Updates
-------------------------

The experiment object provides important metadata about how your data was produced.
Common updates might include:

- Changing the library descriptor where a mistake has been made
  + e.g. the library source could be listed as 'GENOMIC' when in fact it is 'METAGENOMIC'
- Changing the <SAMPLE_DESCRIPTOR> where the experiment is pointing at the wrong sample
- Changing the <STUDY_REF> where the experiment is pointing a the wrong study
- Adding new <EXPERIMENT_ATTRIBUTE> elements to provide additional information about your experiment

All of the above can be achieved by editing the XML displayed when you click the 'Edit' button.


Common Run Updates
------------------

The most common run edit would be an MD5 update.
You may need to do this if:

- An incorrect MD5 value has been registered for a file
- An invalid file has been replaced with a valid one, which has a different MD5 value

Find the <FILE> element's 'checksum' attribute and correct the 32-digit value.

It is not possible to replace the uploaded file in this way; entering a new filename will not be accepted.
If the submitted file has passed validation and been archived, it cannot be replaced.
If the submitted file has failed validation, it must be replaced with an identically-named, corrected file.
