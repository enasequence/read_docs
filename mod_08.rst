=======================================================
Module 8: Interactive Submission of Annotated Sequences
=======================================================

| Submitting a new annotated sequence entry can be done interactively through Webin.
  Be sure to `register a study <mod_02.html>`_ before you begin if you have not already done so.
| Interactive submission of annotated sequences requires you to fill out a checklist of information about your sequence.
  Please view the available `Annotation Checklists <https://www.ebi.ac.uk/ena/submit/annotation-checklists>`_ and pick out a suitable one in advance.
  If there is not an appropriate checklist, you will need to `submit a flatfile programmatically via REST <http://ena-docs.readthedocs.io/en/latest/prog_09.html>`_.

In overview, the workflow is as follows:

1. Select and customise a checklist to model your sequence
2. Describe details shared by all sequences to be submitted
3. Describe each sequence individually
4. Submit your sequences for validation


Step 1: Select and Customise a Checklist
========================================

| To begin, `log in to your Webin account <https://www.ebi.ac.uk/ena/submit/sra/#home>`_, navigate to the 'New Submission' tab and select 'Submit other assembled and annotated sequences'.
| On the next screen, select the study you wish to submit to (or use the 'Create a new study' link).

You can start building your submission by selecting a checklist.
If you have prepared your submission as a spreadsheet, use the 'Submit Completed Spreadsheet' button now.
Information on how to prepare a submission spreadsheet will be provided later in this guide.

.. image:: images/mod_08_p01.png

Browse the list of available checklists.
A description is available for each one.

.. image:: images/mod_08_p02.png

| You can select extra fields to add to your spreadsheet at this point.
  These extra fields make your entry more informative and help future users understand your data.
| You can use the 'Download Template Spreadsheet' button to get the checklist as a TSV file.
  This can be filled out offline and submitted from the page shown in Step 1.
  Completing your submission this way allows you to save your work and easily make changes if something is incorrect.

.. image:: images/mod_08_p03.png


Step 2: Fill Out Shared Details
===============================

In this next screen, you should fill out details which are shared by all of your sequences.
This information will be used to populate the form for each sequence you add to this submission.
None of these fields are mandatory at this stage, and you will be able to edit their content on an individual basis later.

.. image:: images/mod_08_p04.png


Step 3: Fill Out Individual Details
===================================

In this final step, you should fill out the details for each sequence individually.
Depending on how you completed the previous step, some fields will be filled already.

.. image:: images/mod_08_p05.png

Use the '+Add' button to increase the amount of sequences, using the adjacent field to specify how many sequences to add.
In the box below, you can move between different sequences using the checks on the left.
On the right, a green tick indicates a sequence with all mandatory fields completed, while a red exclamation mark indicates errors to be resolved.
The red 'X' can be used to remove an entry completely.

Next to each field, you can mouse over the blue 'i' to learn more about what should be entered.


Step 4: Submit Your Sequences
=============================

When you have entered all the information you wish to and all of the sequences show green ticks indicating that they are correctly filled out, click 'Submit' to have your submission validated.
If your sequences fail validation, you will be informed of this here.
Otherwise, if your submission is successful, you will be shown a confirmation page and given accession numbers.
