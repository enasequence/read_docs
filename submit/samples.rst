=======================
How to Register Samples
=======================

Introduction
============

Before submitting most types of data to ENA, it is necessary to register samples.
Each sample represents a unit of biomaterial, typically associated with a single collection event,
which a sequencing library was produced from.

.. image:: images/metadata_model_sample.png
   :align: center

A different database sample should be registered for each real-life sample used in the sequencing project.
These samples give context to your data so it is important to ensure the metadata associated with them is as extensive
and accurate as possible.
In general, you should register one sample for each biological replicate, while technical replicates which used the
same real-world sample should be represented using a single ENA sample object.
Where multiple experiments were performed on the same sample, this should still only result in one database sample, as
the experimental details will be logged separately.


Checklists
----------

To ensure that each sample is registered with at least a minimum amount of metadata, ENA provides "Sample Checklists".
These provide a set of minimal attributes which you should provide for a given type of sample.

These checklists are developed in collaboration with different research communities to ensure that they are relevant
and realistic for their context.
Explore the full range of sample checklists `here <https://www.ebi.ac.uk/ena/browser/checklists>`_.
Note that each checklist provides a set of mandatory values which must always be provided, as well as recommended values
which should be provided wherever possible, and optional values which are suggested values not relevant to every case.
When registering a sample, it is important to choose the most relevant sample checklist available and provide the most
metadata possible.

.. note::
   If your sample metadata does not provide enough context for your data to be easily interpreted, you may be asked to
   update your samples.
   It is important to take time to choose the correct checklist and metadata when you first register your samples.

If you can not find a suitable checklist for your sample data type - please first contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ for advice.
Please only use the **ENA default sample** checklist if you have been advised that there are no other suitable options.

If you cannot provide a value for a mandatory field within a checklist, please use one of the
`INDSC accepted terms <samples/missing-values.html>`_ for missing value reporting.


Taxonomy
--------

The most fundamental attribute to any sample is its taxonomic classification.
This must be a species-rank taxon from the NCBI Taxonomy database.
Please also make sure you are familiar with the `ENA's taxonomy services <../faq/taxonomy.html>`_
and use the correct taxonomy to describe your samples.

In particular, consider the `environmental taxonomy <../faq/taxonomy.html#environmental-taxonomic-classifications>`_
options available to you when working with environmental samples.

If no appropriate taxon exists in the taxonomy database you can request the addition of one by creating a
`taxonomy request <../faq/taxonomy_requests.html>`_.


Accessions
----------

Once your samples are registered you will receive two accession numbers for each sample.
The first starts with SAMEA and is called the BioSample accession.
The samples will also be assigned an alternative accession number that starts with ERS.
This accession number is called the ENA sample accession.

Always make a note of any accessions you receive as these are the unique identifiers for each
of your submissions to ENA.
You can always review your sample submissions within the interactive submission interface.


Submission Options
==================

Samples can be submitted one of two ways, using the Webin Portal interface or the programmatic interface.
For an overview of these, please see the `General Guide on Submitting to ENA <general-guide.html>`_.
Find specific advice on registering studies using your preferred method below:

.. toctree::
   :maxdepth: 1

   samples/interactive
   samples/programmatic
