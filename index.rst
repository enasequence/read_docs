.. ENA Docs documentation master file, created by
   sphinx-quickstart on Tue Jan 31 17:20:42 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

ENA: Guidelines and Tutorials
*****************************

Welcome to the submission tutorial pages for the European Nucleotide Archive.
Please take a moment to view this introduction and consider the options
available to you, then use the links below to find instructions specific to
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


.. toctree::
   :maxdepth: 2

   general-guide
   study
   samples
   reads
   sequence
   assembly
   analyses
   update
   fileprep
   faq
   tools

.. Extra
.. *****

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`
