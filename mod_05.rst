Module 5: Updates (Samples and Projects)
****************************************

The interactive web based GUI (Webin) has some support for editing existing objects. This module is concerned with sample and project objects. Access existing objects from the following tabs (after logging into `Webin <https://www.ebi.ac.uk/ena/submit/sra/#home>`_)

.. image:: images/mod_05_p01.png

Sample Edit
===========

A sample group is an internal concept (do not quote sample group ids in any publications) which groups together samples for one purpose: so that you can edit them in bulk. The only way to ensure a collection of samples is in the same group is by submitting them at the same time (during the same submission event). If you need to edit samples in bulk but they are not in the same sample group you can use the REST API (more details to come).

First choose a sample from the sample tab or a sample group from the sample group tab. Click the 'edit' button for that sample/group. You will come to a screen like this:

.. image:: images/mod_05_p02.png

1. The left panel is used to select the sample that you would like to edit. Even if you selected a single sample from the sample tab the whole group will still be displayed.
2. This is another way to select the sample that you would like to edit: you can go through the list one by one.
3. It is not possible to add or remove samples from a group, or to change the associated checklist, but you can add/remove fields from the previously selected checklist
4. The right hand panel expands whichever sample you have selected in step 1. You can change the content of the fields using this panel.
5. These little boxes are clickable. Click on this box to copy the content of the field to all the other samples in the sample group (for fields that are common to all samples).
6. When you have completed your edits click save.
7. Warning! Although you can download a spreadsheet you cannot yet upload it again so you cannot use this option to edit samples yet. It can be useful to obtain a spreadsheet similar to the one that you used to submit the samples in the first place. Editing by tsv spreadsheet should be possible in the future.

Study Edit
==========

