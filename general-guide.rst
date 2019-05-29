==================================
General Guide on Submitting to ENA
==================================

Before submitting to ENA it is important to familiarise yourself with 
the different options available for data submission. This general guide 
will get you started in understanding how data can be submitted to ENA 
and how to keep track of the progress of your submission.

For general advice on the three submission services available please see
pages on interactive, Webin-CLI and programmatic submissions. For 
information on how to track the progress of your submission, see pages 
on the Webin Submissions Portal and Reports Service.

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
| Read Data              |      Y      |       Y      |     Y     |
+------------------------+-------------+--------------+-----------+
| Genome Assembly        |      N      |       N      |     Y     |
+------------------------+-------------+--------------+-----------+
| Transcriptome Assembly |      N      |       N      |     Y     |
+------------------------+-------------+--------------+-----------+
| Template Sequence      |      Y      |       Y      |     Y     |
+------------------------+-------------+--------------+-----------+
| Other Analyses         |      N      |       Y      |     N     |
+------------------------+-------------+--------------+-----------+

Once you are happy with the methods available to you and which metadata 
objects you will need to submit for your research project, please follow the 
more detailed guides for these objects.


Getting started
===============

.. toctree::
   :maxdepth: 1

   general-guide/registration
   general-guide/metadata


Submission services
===================

- `**Interactive Submissions** <general-guide/interactive.html>`_ are completed by filling out web forms in your
  browser. This is often the most accessible submission route.
- `**Programmatic Submissions** <general-guide/programmatic.html>`_ are completed by preparing your submissions as
  XML documents and sending them to ENA using a program such as cURL
- `**Command Line Submissions** <general-guide/webin-cli.html>`_ use our bespoke Webin-CLI program. This
  validates your submissions entirely before you complete them, allowing you
  maximum control of the process
  

Additional Services
===================

.. toctree::
   :maxdepth: 1

   general-guide/submissions-portal
   general-guide/reports-service
