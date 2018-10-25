========================================
Module 1: Interactive Submission Options
========================================

Introduction
============

| This guide will introduce you to submitting data interactively through your browser.
| If you would prefer to submit programmatically or via our command line interface, please refer to the `contents page <http://ena-docs.readthedocs.io/en/latest/>`_.

Production and Test Services
============================

There are two interactive Webin submission services. One for test submissions
and another for production submissions:

- Test service URL: https://wwwdev.ebi.ac.uk/ena/submit/sra
- Production service URL: https://www.ebi.ac.uk/ena/submit/sra

The test service is recreated from the full content of the production service every day at
03.00 GMT/BST. Therefore, any submissions made to the test service will be removed
by the following day.

It is advisable to first test your submissions using the Webin test service before
using the production service.

Registration
============

If you have not submitted to Webin before please `register a submission account <reg_01.html>`_.

Submission Workflow
===================

When submitting new data to us, the following workflow is recommended:

1. Register a Study
2. Register Samples
3. Upload Read Files
4. Submit Read Files

When you come to make a new submission, you will have the options described below.
Follow the links for specific guidance on each submission activity.

.. image:: images/mod_01_p01.png

1. Access the above image by logging into your Webin submission account and going to the 'New Submission' tab.
2. Use the `Register study (project)`_ option to register new studies.
3. Use the `Register samples`_ option to register new samples.
4. Use the `Submit sequence reads and experiments`_ option to submit sequence reads with associated experimental information.
   Ensure you have `uploaded your read files`_ first.
5. Use the `Submit genome assemblies`_ option to submit assembled genomes.
6. Use the `Submit other assembled and annotated sequences <https://www.ebi.ac.uk/ena/submit/sequence-submission>`_ option to submit coding genes, rRNA sequences and other
   annotated sequences.
7. Use the `Taxonomy Check/Request`_ option to check that your samples have recognised taxonomic classifications
   or to register new ones. You must provide a taxonomic classification for each submitted sample.

.. _Register study (project): mod_02.html
.. _Register samples: mod_03.html
.. _Submit sequence reads and experiments: mod_04.html
.. _uploaded your read files: upload_01.html
.. _Submit genome assemblies: mod_06.html
.. _Taxonomy Check/Request: tax.html

Metadata model
=================

The full metadata model is described in `Metadata Model <meta_01.html>`_.
You may find understanding how database objects relate to one another helpful.
