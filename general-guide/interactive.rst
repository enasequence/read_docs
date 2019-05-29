======================
Interactive Submission
======================

Introduction
============

| This guide will introduce you to submitting data interactively through your browser.

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

Submission
==========

When you come to make a new submission, you will have the options described below.
Follow the links for specific guidance on each submission activity.
Please note that it is no longer possible to submit genome assemblies this way,
please refer to the `Webin-CLI  <general-guide/webin-cli.html>`_ interface for this.

.. image:: images/mod_01_p01.png

1. Access the above image by logging into your Webin submission account and going to the 'New Submission' tab.
2. Use the `Register study (project)`_ option to register new studies.
3. Use the `Register samples`_ option to register new samples.
4. Use the `Submit sequence reads and experiments`_ option to submit sequence reads with associated experimental information.
   Ensure you have `uploaded your read files`_ first.
5. Interactive submission of genome assemblies is no longer possible.
   This must be done using `Webin-CLI  <general-guide/webin-cli.html>`_
6. Use the `Submit other assembled and annotated sequences`_ option to submit coding genes, rRNA sequences and other
   annotated sequences.
7. Use the `Taxonomy Check/Request`_ option to check that your samples have recognised taxonomic classifications
   or to register new ones. You must provide a taxonomic classification for each submitted sample.

.. _Register study (project): study/interactive.html
.. _Register samples: samples/interactive.html
.. _Submit sequence reads and experiments: reads/interactive.html
.. _uploaded your read files: fileprep/upload.html
.. _Submit other assembled and annotated sequences: sequence/interactive.html
.. _Taxonomy Check/Request: faq/taxonomy.html

Each of these options will lead you to interactive web forms that guide you through the submission of these objects.
Interactive submission is recommended for registration of your Study and Samples and for small scale Read or Sequence submission.