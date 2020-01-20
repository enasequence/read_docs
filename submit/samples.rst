=======================
How to Register Samples
=======================

Introduction
============

In order to submit sequencing or analysis data, it is important to first register your
biological samples with ENA. Each sample in ENA represents biomaterial that a sequencing
library was produced from.

.. image:: images/metadata_model_sample.png
   :align: center

A different sample should be registered for each sample used in the real-life sequencing
project. These samples give context to your data so it is important to ensure the metadata
associated with them is as extensive and accurate as possible.

Checklists
----------

To ensure that each sample is registered with at least a minimum amount of metadata, ENA
provides "Sample Checklists" which are used during registration to tailor these samples to fit
minimum standards for different sample types.

These "Checklists" were developed in collaboration with different research communities to ensure
that there is enough information provided for each type of sample that is deposited in ENA to comply
with the `FAIR <https://doi.org/10.1038/sdata.2016.18>`_ data principles (making sure your associated data is Findable, Accessible, Interoperable
and Reusable).

As a result, when registering a sample, it is important to choose the most relevant sample
checklist available to you and provide at least the minimum metadata.

.. note::
   If your sample metadata does not provide enough context for your data to be easily interpreted,
   you could be requested to update your samples, so it is important to take some time to choose
   the correct checklist and metadata when you first register your samples.

If you can not find a suitable checklist for your sample data type - please first contact
our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ for advice. Please only use the **ENA default sample** checklist if you have
been advised that there are no other suitable options.

Taxonomy
--------

Please also make sure you are familiar with the `ENA's taxonomy services <../faq/taxonomy.html>`_
and use the correct taxonomy to describe your samples.

In particular, consider the `environmental
taxonomy <../faq/taxonomy.html#environmental-taxonomic-classifications>`_ options available to you when
working with environmental samples.

Accessions
==========

Once the samples are registered, Webin will report two accession numbers for each sample.
The first starts with SAMEA and is called the BioSample accession. The samples will also be
assigned an alternative accession number that starts with ERS. This accession number is called
the ENA sample accession.

Always make a note of any accessions you receive as these are the unique identifiers for each
of your submissions to ENA.

Submission Options
==================

Samples can be submitted one of two ways, using the Webin Interactive web interface
or programmatically.  For an overview of these, please
see the `General Guide on Submitting to ENA <general-guide.html>`_.

.. toctree::
   :maxdepth: 1

   samples/interactive
   samples/programmatic
