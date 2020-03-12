================================
How to Submit Targeted Sequences
================================

Introduction
============

The information on this page pertains to the submission of targeted sequences,
typically short assembled and annotated sequences representing interesting
features or gene regions. This is unrelated to the submission of full
chromosome or genome assemblies, which is described in our `Assembly Submission
Pages <assembly.html>`_.

.. image:: images/metadata_model_sequences.png
   :align: center

All submissions of this type are subitted as 'analysis' objects, but the
accessions of these analyses are not exposed. Instead, specific sequence
accessions are assigned later, and these are what should be used to reference
the sequences.

Sequence submission requires that a study be registered first. Please do this
before attempting any of the guides shown below:

- `Register a Study <study.html>`_

.. note::
   This submission route is for sets of stand-alone targeted assembled and
   annotated sequences only. If you intend to submit an annotated **assembly**
   such as a genome, please follow the `assembly submission guidelines
   <assembly.html>`_ and submit your assembly in EMBL flat file format.
   
Accessions
==========

As all sequences in ENA are submitted as 'analyses', for each sequence set
submission, Webin will report a unique accession number that starts with ERZ.
This accession number is for internal processing only and will not be visible
in the browser. Furthermore, if your submission includes multiple sequences,
the ERZ accession will not be unique to any one of them. Instead, you will
receive additional post-processing accession numbers for your sequences via
email, each of which will be unique to one of your sequences.

Always make a note of any accessions you receive as these are the unique
identifiers for each of your submissions to ENA.

Submission Options
==================

Many types of sequence can be submitted using a checklist. These define a set
of metadata whicih should be provided for a given type of sequence and
streamline the submission process for these sequence types. Checklist
submission allows you to avoid having to create the flatfile record manually.

Therefore, please check the list of available checklists to determine whether
one of them meets the needs of your submission:

- `List of Annotation Checklists <sequence/annotation-checklists.html>`_


If There Is A Suitable Checklist Available
------------------------------------------

You can use the Webin Interactive service to submit your checklist sequences
through web forms. You also have the option of preparing a spreadsheet and
submitting it through our Webin-CLI tool.

.. toctree::
    :maxdepth: 1

    sequence/interactive
    sequence/webin-cli-spreadsheet


If No Suitable Checklist Exists
-------------------------------

You will need to prepare your sequence in the EMBL Flat File Format and
submit it using Webin-CLI as described in the below link. Webin-CLI will
validate the file for you before accepting its submission, and will advise you
of any formatting errors.

.. toctree::
    :maxdepth: 1

    sequence/webin-cli-flatfile
