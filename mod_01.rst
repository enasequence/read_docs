Module 1: Interactive Submission Options
****************************************

Introduction
============

| This guide will introduce you to submitting data interactively through your browser.
| Please refer to the `contents page <index.rst>`_ for guidance on submitting programmatically or via command line

Production and test services
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

Submitting
==========

When you come to make a new submission, you will have the following options:

.. image:: images/mod_01_p01.png

1. Access the above image by logging into your Webin submission account and going to the **New Submission** tab.
2. Use the **Register study (project)** option to register new studies. `Module 2`_ describes this step in more detail.
3. Use the **Register samples** option to register new samples. `Module 3`_ describes this step in more detail.
4. Use the **Submit sequence reads and experiments** option to submit sequence reads with associated experimental information.
   `Module 4`_ describes this step in more detail.
5. Use the **Submit genome assemblies** option to submit assembled genomes. `Module 6`_ describes this step in more detail.
6. Use the **Submit other assembled and annotated sequences** option to submit coding genes, rRNA sequences and other
   annotated sequences. More information about this step is available `here <https://www.ebi.ac.uk/ena/submit/sequence-submission>`_.
7. Use the **Taxonomy Check/Request** option to check that your samples have recognized taxonomic classifications
   or to register new ones. You must provide a taxonomic classification for each submitted sample.
   For more information about taxonomy see our FAQ_.

.. _Module 2: mod_02.html
.. _Module 3: mod_03.html
.. _Module 4: mod_04.html
.. _Module 6: mod_06.html
.. _FAQ: tax.html

Metadata model
=================

The full metadata model is described in `Metadata Model <meta_01.html>`_.
