Module 5: Updates (Samples and Projects)
****************************************

The interactive web based GUI (Webin) has some support for editing existing objects. This module is concerned with sample and project objects. Access existing objects from the following tabs (after logging into `Webin <https://www.ebi.ac.uk/ena/submit/sra/#home>`_)

.. image:: images/mod_05_p01.png

Sample Edit
===========

Unfortunately it is not yet possible to edit existing samples using a webform or by uploading the same type of spreadsheet file that you used for the original submission of your samples. You may remember bulk editing options that were available previously but these were discontinued because they were not stable. Additional editing functionality should be developed in the not too distant future.

For now you can use the edit button alongside any sample that you want to make edits too.

.. image:: images/mod_05_p02.png

You will see an XML rendition of the sample. This is how the ENA stores its sample objects and you can edit this document directly. Not all edits will be permitted. When you click 'save' the sample will be validated and if all is well you will see a message stating **"All modifications saved"**. Otherwise an error will be reported and you can fix this and try the modification again. The sample alias (an attribute found in the `<SAMPLE>` tag) can not be changed because this was initially set up as the unique id for the sample. However you can change the title, description, and most of the sample attributes.

.. image:: images/mod_05_p02_b.png

This method for editing existing samples is useful for one-off edits but it is not feasible for editing many samples in bulk. For this you can use the programmatic method which is outlined `here <prog_06.html>`_. 


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
