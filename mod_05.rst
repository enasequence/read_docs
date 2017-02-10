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

Some parts of the study object can be edited. You can change the release date or release the whole study. You can also edit titles and descriptions, as well as add publications which will become clickable links when the study goes live in the ENA browser.

.. image:: images/mod_05_p03.png

1. Login to `Webin <https://www.ebi.ac.uk/ena/submit/sra/#home>`_ and find the studies tab.
2. If you have a long list of studies you can search for one by name or accession. This functionality exists in the other tabs too.
3. If your study is confidential you can change the release date by clicking on the pencil icon. A calendar will open so that you can navigate to required date. To release the study simply select the current date/present day. Releasing a study will cause all the data associated to that study to be released as well. Upon releasing a study various stages are set in motion:

	- Moving read files and sequence files from our confidential archive to the public servers
	- Indexing and rendering the study and its affiliated objects so that they can be linked-to and visualised in the ENA browser
	- Mirroring to INSDC databases, who will then follow similar procedures so the data is searchable and viewable in their web portals.

	These stages are usually complete in a couple of days but please allow several days for busy times or for times when technical problems are causing the queue of jobs to build up.

4. For edits besides changing the release date, click the edit button next to the study that you need to edit. This will expand the study into an editable webform.

.. image:: images/mod_05_p04.png

5. There are various text boxes that you can edit if you need to. The short name for the study will be visible in search outputs and overview pages whereas the descriptive title and abstract will be viewable when the study has its own webpage (when the hold date has expired)
6. You can add a publication by clicking the 'Add' button (a fresh row will appear) and inserting the pubmed id. This will result in a hyperlink on the main study page allowing the publication to be linked from the study (when it is public).
7. Study 'attributes' are optional. They act as key words and can help expose the study to more specific searches. In some cases we will standardise some attributes and index them. These may be related to specific projects known to ENA and will help filtering and searching. Each key word needs a 'tag' which is the name of the field, and an actual value (called 'FieldType'). Some submitters add their DOI as a keyword when they do not have a pubmed id. So the tag is something like 'DOI' and the value is the DOI value.
8. Remember to save changes when you are finished!
