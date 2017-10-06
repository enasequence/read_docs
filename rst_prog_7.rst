Module 7: Submitting Experiment and Run objects
***********************************************

.. http://www.ebi.ac.uk/ena/data/view/SRX314869

.. _1: mod_01.html
.. _4: mod_04.html

A word about pointers
=====================

The interactive `Webin <https://www.ebi.ac.uk/ena/submit/sra/#home>`_ submission system has an option for creating run and experiment objects ("submit reads and experiments": module 1_ and module 4_). This interactive GUI provides a single spreadsheet template for both run and experiment objects: 1 row = 1 run, which points to 1 experiment object. This is the first time we are submitting objects in the programmatic modules that have pointers to other objects (because so far, an ENA study object does not have a pointer and neither does an ENA sample object).

.. image:: images/prog_07_p01.png

Both the run and experiment objects have pointers. The run object has one pointer, to the experiment that it is using and the experiment object has two pointers, one to the source sample object it is using, and one to the study object that it belongs to. By this means, even though the study and sample objects do not have pointers, they are connected via a common experiment object. For this reason, when you create sample objects in the ENA they are not actually affiliated with any study until they are connected to an experiment object (or analysis object), which in turn does not usually come about until a run object is needed and there is a read file(s) to submit. It is acceptable to register your source samples with the ENA ahead of submitting raw data but do not assume they belong to a study if you have not added raw data, an assembled genome, or an analysis object!

Just as a sample object in the ENA can be likened to representing the source physical material that is being sequenced, then an experiment object represents the library solution that is created from the source sample and set up to run on a sequencing technology platform. Thus the experiment object contains details about sequencing platform and library protocols. A run object wraps raw read files so it can be likened to representing a lane on an NGS machine, or if the original lane is pooled then a run object represents the demultiplexed file for one source sample.

Many to one object to object relationships
==========================================

In real life you can create many libraries from a single source sample. The experiment points to the sample rather than the other way around so that multiple experiments can be added to one sample (not necessarily at the same time) without increasing the size of sample object or ever needing to update it (because the sample object does not need to store a list of experiments). The same is true for the relationship between run and experiment objects. You can run a single library (experiment) on multiple lanes (runs) (for instance, to obtain deeper coverage or to create technical replicates) so the run object points to the experiment object. The object that points/carries the pointer information is the object that can exist in multiples. Using the `Webin <https://www.ebi.ac.uk/ena/submit/sra/#home>`_ GUI, it is not possible to submit many runs on a single experiment because a single spreadsheet table is used for creating the run **and** the experiment objects which means that there must always be a one to one relationship. This is acceptable and it makes the process simpler but it can sometimes be harder to represent your sequencing experiment accurately. Using the REST API to create run objects and experiment objects as separate XML files allows a higher degree of flexibility to represent your sequencing study as you designed it and this can also aid its interpretation by third party users of your data. Using the REST API you can also point new objects to objects that exist in deifferent accounts. For example for collaborations where sequencing, sample collecting and data analysis are divided between groups, the study can be built progressively accross individual accounts.

.. image:: images/prog_07_p02.png

From the image above note how the metadata object model allows:

1. multiple runs to one experiment
2. multiple experiments to one study (by this rule, multiple runs and samples also occur per study)
3. multiple experiments to one sample (by this rule, one sample can exist in multiple studies)
4. objects submitted under different accounts can still be connected so that collaborators can contribute different parts of a project without a centralised submission effort.

Some things to note
===================

The main guide for submitting objects using the REST API is `here <prog_01.html>`_ in module 1. Module 1 describes submitting a study object but the same principle can be applied to `submitting sample objects <prog_05.html>`_ and now, submitting experiment and run objects.

Order of submission
-------------------





