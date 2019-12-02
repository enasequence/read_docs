============================
How to Submit Other Analyses
============================

Introduction
============

Any secondary analyses you wish to submit to ENA that are not `Assemblies <assembly.html>`_ 
or `Annotated Sequences <sequence.html>`_ need to be submitted programmatically.

.. image:: images/metadata_model_analysis.png
   :align: center

All submissions to ENA must be part of an ENA Study. This gives context to the data being 
submitted and controls the release date of the associated data.

Other submission objects may also need submitting before you can submit your secondary analyses 
depending on the analysis type. E.g. read alignments require a raw read submission as well as 
a Study.

The analysis XML format is defined by `SRA.analysis.xsd <ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.analysis.xsd>`_
XML Schema.

Please note some analysis types require certain object relations so please read the individual submission guides 
for more detail on what needs submitting for each analysis type and please register all 
required objects before beginning your analysis submission.

How to register/submit other datasets to ENA:

- `Register a study <study.html>`_ 
- `Register samples <sample.html>`_
- `Submit raw reads <reads.html>`_


Submission Options
==================

All analyses require programmatic submission.

For an overview of how to submit programmatically, please 
see the documentation on `Programmatic Submissions <general-guide/programmatic.html>`_.

.. toctree::
   :maxdepth: 1

   analyses/sequence-variation
   analyses/read-alignments
   analyses/sequence-annotation
   analyses/pacbio-methylation
   analyses/bionano-maps
   analyses/taxonomic-reference-set
