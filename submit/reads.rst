=======================
How to Submit Raw Reads
=======================

Introduction
============

If you are not yet familiar with the metadata model, please see `here <general-guide/metadata.html>`_ for some more
information. To submit raw read sequencing data to ENA you must also provide some metadata to describe the biological
material which was sequenced. This helps make your data re-useable and searchable.

.. image:: images/metadata_model_reads.png
   :align: center

Within ENA, raw reads are represented as ‘run’ and ‘experiment’ submission objects.

- **Experiment**: The experiment submission holds metadata that describe the methods used to sequence the sample,
  including library and instrument details.

- **Run**: A run is part of an experiment and refers to data files containing sequence reads. The run submission holds
  information about the raw read files generated in a run of sequencing as well as their location on an FTP server.

A raw read submission references ENA Sample and Study objects, and you must submit these before you can submit
your read data. Please see:
   
- `Register a study <study.html>`_
- `Register a sample <samples.html>`_

Accessions Report
=================

Once the raw reads are registered, Webin will report two unique accession numbers for each read submission.
The first starts with ERR and is called the Run accession.
The other starts with ERX and is called the Experiment accession.

Always make a note of any accessions you receive as these are the unique identifiers for each of your submissions to
ENA.
You can always review your read submissions within the :doc:`interactive submission interface <./general-guide/submissions-portal.html>`.


Submission Options
==================

Reads can be submitted in any of three ways.

.. toctree::
   :maxdepth: 1

   reads/interactive
   reads/webin-cli
   reads/programmatic

For an overview of these, please see the `General Guide on Submitting to ENA <general-guide.html>`_.

.. tip::

  `Webin-CLI <https://ena-docs.readthedocs.io/en/latest/submit/reads/webin-cli.html>`_ is recommended for read
  submissions because it provides the best pre-submission validation, however note that in the read context it is only
  usable for data in FASTQ, BAM, or CRAM formats
