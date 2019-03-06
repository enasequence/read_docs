========================================
Rules for Submitting Metagenomic Samples
========================================

Metagenomic studies involve assembling sequencing data sampled from an entire biome all the way down to the individual species that were living in that environment. As a result, there are some rules to regulate the way these samples are submitted to make the quality of the assembly and original source of data as clear as possible.

The following image illustrates the stages of a metagenome assembly study and what is submittable to each of the metagenone assembly levels in ENA:

.. image:: images/metagenomes.png

Primary metagenome assembly
===========================

Primary assemblies involve assembling your raw sequenced reads into contigs without any attempt to sort the data into taxonomic groups. As a result, there is no knowledge of taxonomy and no separation of the contig set.

This is why a primary assembly should be associated with the **environmental** sample. If you have previously submitted your raw data, it should point to this same sample so the origin of the data is easy to follow.

Binned metagenome assembly
==========================

Binned assemblies involve separating and/or assembling this contig set into single-taxon assemblies. This means that, by associating your data with the same **environmental** sample, you will lose the taxonomic information that describes these bins.

This is why a binned assembly should be associated with a new **binned** sample. This requires some extra rules so the data can be correctly associated with the original environmental source (either the raw data runs or the **environmental** sample they were assembled from) and be searchable by its quality.

When registering a binned sample, you should do the following:

1. Include one of the following in the sample description, making sure to correct the accession:

    *"This sample represents a metagenomic bin from the metagenomic sample ERSXXXXX"*

    OR

    *"This sample represents a metagenomic bin from the metagenomic run ERRXXXXX"*

2. Include the following custom attributes to give context to the quality and metagenome source of your assembly:

+---------------------+-------------------------------------------------------+---------------------------------------------+
| custom attribute    | value                                                 | example                                     |
+---------------------+-------------------------------------------------------+---------------------------------------------+
| sample derived from | either the ERS accession of the environmental sample  | ERS123456                                   |
|                     | or the ERR of the environmental reads                 |                                             |
+---------------------+-------------------------------------------------------+---------------------------------------------+
| isolation_source    | material the parent sample was isolated from          | gut                                         |
+---------------------+-------------------------------------------------------+---------------------------------------------+
| metagenomic source  | the environmental taxonomy of the parent              | human gut metagenome                        |
|                     | environmental sample                                  |                                             |
+---------------------+-------------------------------------------------------+---------------------------------------------+
| assembly quality    | used to describe the quality of the assembly (*)      | Many fragments with little to no review of  |
|                     |                                                       | assembly other than reporting of standard   |
|                     |                                                       | assembly statistic                          |
+---------------------+-------------------------------------------------------+---------------------------------------------+
| completeness score  | the ratio of observed single-copy marker genes        | 82.35%                                      |
|                     | to total single-copy marker genes in chosen marker    |                                             |
|                     | gene set  (*)                                         |                                             |
+---------------------+-------------------------------------------------------+---------------------------------------------+
| contamination score | the ratio of observed single-copy marker genes in ≥2  | 9.25%                                       |
|                     | copies to total single-copy marker genes in chosen    |                                             |
|                     | marker gene set (*)                                   |                                             |
+---------------------+-------------------------------------------------------+---------------------------------------------+
(*) See the **metagenomic assembly quality** section below for how to format these.

3. Copy other sample attributes from the MIMAG sample checklist to the binned sample as appropriate, e.g. "collection_date", "geographic location (country and/or sea)", etc. This adds additional context to your environmentally sourced data.


4. Register your sample with as specific taxonomy as possible.


These attributes ensure that there is enough context to your **binned** sample that it can be linked with the rest of your data and anyone browsing your study can follow the workflow of the assembly.

MAG assembly
============

This submission level is for a single-taxon assembly based on one or more binned metagenomes asserted to be a close representation to an actual individual genome (that could match an already existing isolate or represent a novel isolate).
There should only be one MAG submitted for each species within a biome. This can be determined using a de-replication step or by choosing the highest quality representative genome for each predicted species.

Again, by associating your data with the same **environmental** sample, you will lose the  taxonomic information that describes these assemblies.

This is why a MAG should be associated with a **MAG** sample. This also requires some extra rules so that the data can be correctly linked with its source.

When registering a MAG sample, please use the provided MIMAGs checklist, this will guide you through which attributes are mandatory to register a MAG.
You will notice "sample derived from", "isolation source" and "metagenome source" attributes which explain the context of the data. Please see binned assemblies above for an explanation of these.

You should also reference the **environmental** sample in the description as one of the following:

*"This sample represents a MAG from the metagenomic sample ERSXXXXX"*

OR 

*"This sample represents a MAG from the metagenomic run ERRXXXXX"*

Metagenomic assembly quality
============================

You will notice three attributes that are mandatory for all binned and MAG sample submissions.

1. **Assembly Quality** - this is valid only as one of the following three sentences which best describes an assembly.

    - Single contiguous sequence without gaps or ambiguities with a consensus error rate equivalent to Q50 or better
    - Multiple fragments where gaps span repetitive regions. Presence of the 23S, 16S, and 5S rRNA genes and at least 18 tRNAs
    - Many fragments with little to no review of assembly other than reporting of standard assembly statistics

2. **Completeness Score** - the ratio of observed single-copy marker genes to total single-copy marker genes 
in chosen marker gene set (%).

3. **Contamination Score** - the ratio of observed single-copy marker genes in ≥2 copies to total single-copy 
marker genes in chosen marker gene set (%).

It is essential you complete these fields accurately so that the overall quality of an assembly is searchable using the criteria outlined by the Genomic Standards Consortium (GSC) in the 2018 publication `here <https://www.nature.com/articles/nbt.3893#t1>`_.

If you wish to search for binned metagenomes or MAGs by overall quality, these standards are outlined below.


**Finished Assembly**

Assembly quality : Single contiguous sequence without gaps or ambiguities with a consensus error rate equivalent to Q50 or better.


**High-quality draft**

Assembly quality : Multiple fragments where gaps span repetitive regions. Presence of the 23S, 16S, and 5S rRNA genes and at least 18 tRNAs.

Completion : >90%

Contamination : <5%


**Medium-quality draft**

Assembly quality : Many fragments with little to no review of assembly other than reporting of standard assembly statistics.

Completion : ≥50%

Contamination : <10%


**Low-quality draft**

Assembly quality : Many fragments with little to no review of assembly other than reporting of standard assembly statistics.

Completion : <50%

Contamination : <10%


It is useful to bear in mind these quality thresholds when assembling and submitting metagenomic assemblies.


When intending to submit environmental Single-cell Amplified Genomes or uncultured viral genomes, please contact datasubs@ebi.ac.uk for assistance.

Please see `here <cli_07.html>`_ for more information on how to submit your metagenome assemblies to ENA.
