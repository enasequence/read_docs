==================================
General Guide on Submitting to ENA
==================================

Welcome to the general guide for the European Nucleotide Archive submission.
Please take a moment to view this introduction and consider the options
available to you before you begin your submission.

ENA allows submissions via three routes, each of which is appropriate for a
different set of submission types. You may be required to use more than one in
the process of submitting your data:

- **Interactive Submissions** are completed by either filling out web forms directly 
  in your browser or alternatively downloading spreadsheets that can be completed 
  off-line and uploaded to ENA. This is often the most accessible submission route.
- **Command Line Submissions** use our bespoke Webin-CLI program. This
  validates your submissions entirely before you complete them, allowing you
  maximum control of the process.
- **Programmatic Submissions** are completed by preparing your submissions as
  XML documents and either sending them to ENA using a program such as cURL or using 
  the `Webin Submissions Portal <general-guide/submissions-portal.html>`_.

The table below outlines what can be submitted through each submission route.
It is also recommended that you familiarise yourself with our `metadata model
<general-guide/metadata.html>`_.


+------------------------+-------------+--------------+-----------+
|                        | Interactive | Webin-CLI | Programmatic |
+------------------------+-------------+-----------+--------------+
| Study                  |      Y      |     N     |       Y      |
+------------------------+-------------+-----------+--------------+
| Sample                 |      Y      |     N     |       Y      |
+------------------------+-------------+-----------+--------------+
| Read data              |      Y      |     Y     |       Y      |
+------------------------+-------------+-----------+--------------+
| Genome Assembly        |      N      |     Y     |       N      |
+------------------------+-------------+-----------+--------------+
| Transcriptome Assembly |      N      |     Y     |       N      |
+------------------------+-------------+-----------+--------------+
| Template Sequence      |      Y      |     Y     |       Y      |
+------------------------+-------------+-----------+--------------+
| Other Analyses         |      N      |     N     |       Y      |
+------------------------+-------------+-----------+--------------+

Before submitting to ENA it is important to familiarise yourself with
the different options available for data submission. This general guide
will get you started in understanding how data can be submitted to ENA
and how to keep track of the progress of your submission.


Getting started
===============

.. toctree::
   :maxdepth: 1

   general-guide/registration
   general-guide/metadata
   general-guide/accessions


Submission services
===================

.. toctree::
   :maxdepth: 1

   general-guide/interactive
   general-guide/programmatic
   general-guide/webin-cli


Additional Services
===================

.. toctree::
   :maxdepth: 1

   general-guide/submissions-portal
   general-guide/reports-service
