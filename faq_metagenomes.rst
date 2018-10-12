==============================
Submitting Metagenomic Studies
==============================


Introduction
============

| Metagenomic studies can be among the most complex within ENA, due to the multiple layers of analyses which may be involved. This guide will give you an overview of how to structure your metadata, which will be essential to making  your work understood. You should refer to other pages on this site for guidance on the actual process of submitting. If you have questions, please direct them to datasubs@ebi.ac.uk


Prerequisites
-------------

Before attempting to submit your data, do the following:

- Familiarise yourself with the `Metadata Model <meta_01.html>`_
- `Register a Submission Account <reg.html>`_
- Make yourself aware of the different submission routes:

  + `Interactive submission <interactive.html>`_ using your browser is appropriate for submitting Studies and Samples
  + `REST submission <programmatic.html>`_ using cURL to submit XML files is appropriate for submitting Studies and Samples
  + `Webin-CLI <cli.html>`_ is a bespoke ENA submission interface appropriate for submitting your reads and assemblies


Sample Registration
===================

| Samples describe the source material for a sequencing experiment.
  They are metadata objects which give essential context to your data.
| Samples must always conform to a checklist.
  View the full selection of these at the `Sample Checklist`_ page and choose the most specific one which is appropriate.

.. _Sample Checklist: https://www.ebi.ac.uk/ena/submit/checklists


| When submitting samples for metagenomic data, take care with the taxon ID: read data, primary metagenomes, and binned metagenomes (defined below) should reference an environmental sample.
  See the available environmental taxa in the `NCBI Taxonomy Browser`_.

.. _NCBI Taxonomy Browser: https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Undef&id=408169&lvl=1&keep=1&srchmode=1&unlock

| If you are submitting MAG or SAG data, these assemblies should reference samples for the species they came from.
  This sample must in turn reference one of your environmental samples, so that database users can see how the assembly was produced.
| You are therefore required to do three additional things at the sample submission stage when registering samples for MAGs and SAGs:

1. Include one of the following in the sample description, making sure to correct the accession:

    | "This sample represents a MAG, binned/clustered from the metagenomic sample ERSXXXXX"
    | "This sample represents a MAG, binned/clustered from the metagenomic run ERRXXXXX"

2. Include a custom attribute named "sample derived from" with the value being the ERS accession of the environmental sample

3. Include a custom attribute named "isolation_source", with the value being the material the parent sample was isolated from, e.g. "soil" or "gut"

4. Propagate other sample attributes from the parent sample to the MAG sample as appropriate, e.g. "sampling_station", "event_label", etc.


Sequence Read Submission
========================

| Sequence reads should be submitted in the normal way, referencing an environmental sample as described above.
| If you are not familiar with how to do this, see the `Webin-CLI submission guide <cli.html>`_.


Assembly Data Submission
========================

| A metagenomic study may include multiple levels of assembled sequence.
| The accepted types are as follows:

- Primary Metagenome: a set of assembled contigs without attempt to separate taxa
- Binned Metagenome: a set of contigs drawn from a primary metagenome, grouped into a single-taxon set
- Metagenome Assembled Genome (MAG): a single-taxon assembly drawn from a binned metagenome, asserted to closely represent an actual individual genome
- Environmental Single Cell Amplified Genome (SAG): a genome assembly from environmental sampled single-cell DNA

| Any assemblies you submit should fall into one of these categories
