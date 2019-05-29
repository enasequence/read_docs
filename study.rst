Registering a Study
===================

Every data submission to ENA requires registration of a study object.

This study is used to group other objects together, so is the as a first step 
towards submitting your data to ENA.

.. image:: images/webin_data_model_study.png
   :scale: 45
   :align: center

Once a study is registered, Webin will report two accession numbers for the study. 
The first starts with PRJEB and is called the BioProject accession. This is typically 
used in journal publications. The study will also be assigned an alternative 
accession number that starts with ERP. This accession number is called the 
SRA (Sequence Read Archive) study accession.

The study and its associated data will not become public until the study release 
date has expired (*). You can change this date at will should you need to release 
the data or delay its publication further. However, you will no longer have 
this option once the data are public.

Have a look at an `example <http://www.ebi.ac.uk/ena/data/view/PRJEB1234>`_ 
of a study in the ENA browser.

Studies can be submitted one of two ways, using the Webin Interactive web interface 
or programmatically.

.. toctree::
   :maxdepth: 1

   study/interactive
   study/programmatic
