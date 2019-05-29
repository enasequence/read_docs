==================================
General Guide on Submitting to ENA
==================================

Welcome to the general guide for the European Nucleotide Archive submission.
Please take a moment to view this introduction and consider the options
available to you, then use the links to the left to find instructions specific to
your needs.

ENA allows submissions via three routes, each of which is appropriate for a
different set of submission types. You may be required to use more than one in
the process of submitting your data:

- **Interactive Submissions** are completed by filling out web forms in your
  browser. This is often the most accessible submission route.
- **Programmatic Submissions** are completed by preparing your submissions as
  XML documents and sending them to ENA using a program such as cURL
- **Command Line Submissions** use our bespoke Webin-CLI program. This
  validates your submissions entirely before you complete them, allowing you
  maximum control of the process

The table below outlines what can be submitted through each submission route.
It is also recommended that you familiarise yourself with our `metadata model
<general-guide/metadata.html>`_.


+------------------------+-------------+--------------+-----------+
|                        | Interactive | Programmatic | Webin-CLI |
+------------------------+-------------+--------------+-----------+
| Study                  |      Y      |       Y      |     N     |
+------------------------+-------------+--------------+-----------+
| Sample                 |      Y      |       Y      |     N     |
+------------------------+-------------+--------------+-----------+
| Read dataa              |      Y      |       Y      |     Y     |
+------------------------+-------------+--------------+-----------+
| Genome Assembly        |      N      |       N      |     Y     |
+------------------------+-------------+--------------+-----------+
| Transcriptome Assembly |      N      |       N      |     Y     |
+------------------------+-------------+--------------+-----------+
| Template Sequence      |      Y      |       Y      |     Y     |
+------------------------+-------------+--------------+-----------+
| Other Analyses         |      N      |       Y      |     N     |
+------------------------+-------------+--------------+-----------+

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
