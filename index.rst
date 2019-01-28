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
<meta_01.html>`_.

+---------------------------------+-------------+--------------+-----------+
|                                 | Interactive | Programmatic | Webin-CLI |
+---------------------------------+-------------+--------------+-----------+
| Study                           | ✅           | ✅           | ❌        |
+---------------------------------+-------------+--------------+-----------+
| Sample                          | ✅           | ✅           | ❌        |
+---------------------------------+-------------+--------------+-----------+
| Read data                       | ✅           | ✅           | ✅        |
+-----------------+---------------+-------------+--------------+-----------+
| Assembly        | Genome        | ❌           | ❌           | ✅        |
|                 +---------------+-------------+--------------+-----------+
|                 | Transcriptome | ❌           | ❌           | ✅        |
|                 +---------------+-------------+--------------+-----------+
|                 | Template      |             |              |           |
+-----------------+---------------+-------------+--------------+-----------+
| Other Analyses  |               | ❌           | ✅           | ❌        |
+---------------------------------+-------------+--------------+-----------+


+--------------------------+-------------+--------------+-----------+
|                          | Interactive | Programmatic | Webin-CLI |
+--------------------------+-------------+--------------+-----------+
| Study                    |      ✅      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+
| Sample                   |      ✅      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+
| Read Data                |      ✅      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+
| Assembly | Genome        |      ❌      |       ❌     |     ✅    |
+          +---------------+-------------+--------------+-----------+
|          | Transcriptome |      ❌      |       ❌     |     ✅    |
+          +---------------+-------------+--------------+-----------+
|          | Template      |      ❌      |       ❌     |     ✅    |
+----------+---------------+-------------+--------------+-----------+
| Other Analyses           |      ❌      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+


+--------------------------+-------------+--------------+-----------+
|                          | Interactive | Programmatic | Webin-CLI |
+--------------------------+-------------+--------------+-----------+
| Study                    |      ✅      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+
| Sample                   |      ✅      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+
| Read Data                |      ✅      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+
| Assembly | Genome        |      ❌      |       ❌     |     ✅    |
|          +---------------+-------------+--------------+-----------+
|          | Transcriptome |      ❌      |       ❌     |     ✅    |
|          +---------------+-------------+--------------+-----------+
|          | Template      |      ❌      |       ❌     |     ✅    |
+----------+---------------+-------------+--------------+-----------+
| Other Analyses           |      ❌      |       ✅     |     ❌    |
+--------------------------+-------------+--------------+-----------+


+--------------------------+-------------+--------------+-----------+
|                          | Interactive | Programmatic | Webin-CLI |
+--------------------------+-------------+--------------+-----------+
| Study                    |      Y      |       Y      |     N     |
+--------------------------+-------------+--------------+-----------+
| Sample                   |      Y      |       Y      |     N     |
+--------------------------+-------------+--------------+-----------+
| Read Data                |      Y      |       Y      |     N     |
+--------------------------+-------------+--------------+-----------+
| Assembly | Genome        |      N      |       N      |     Y     |
|          +---------------+-------------+--------------+-----------+
|          | Transcriptome |      N      |       N      |     Y     |
|          +---------------+-------------+--------------+-----------+
|          | Template      |      N      |       N      |     Y     |
+----------+---------------+-------------+--------------+-----------+
| Other Analyses           |      N      |       Y      |     N     |
+--------------------------+-------------+--------------+-----------+


.. toctree::
   :maxdepth: 2

   reg
   interactive
   programmatic
   cli
   portal
   report
   meta
   formats
   upload
   tools
   faq_toc

.. Extra
.. *****

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`
