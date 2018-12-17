# Rules for Submitting Metagenomic Sample

Metagenomic studies involve assembling sequencing data sampled from an entire biomeall the way down to the individual species that were living in thatenvironment. As a result, there are some rules to regulate the way these samples are submitted to make the level of the assembly and original source of data as clear as possible.

The image below shows the different levels of metagenomic studies.

![Metagenome assembly levels](images/metagenomes.png)

## Primary metagenome assembly

Primary assemblies involve assembling your raw sequenced reads into contigs without any attempt to sort the data into taxonomic groups. As a result, there is no knowledge of taxonomy and no seperation of the contig set.

This is why a primary assembly should be associated with the **environmental** sample. If you have previously submitted your raw data, it should point to this same sample so the origin of the data is easy to follow.

## Binned metagenome assembly

Binned assemblies involve seperating this assembled contig set into seperate taxonomically related groups.
This means that, by associating your data with the same **environmental** sample, you will lose the  taxonomic information that describes these bins.

This is why a binned assembly should be associated with a new **binned** sample. This requires some extra rules so the data can be correctly associated with the original environmental source (either the raw data runs or the **environmental** sample they were assembled from).

When registering a binned sample, you should do the following:

1. Include one of the following in the sample description, making sure to correct the accession:

    *"This sample represents a metagenomic bin from the metagenomic sample ERSXXXXX"*

    OR

    *"This sample represents a metagenomic bin from the metagenomic run ERRXXXXX"*

2. Include a custom attribute named "sample derived from" with the value being either the ERS accession of the environmental sample or the ERR of the environmental reads. This is important to fill out correctly as it links the data together.

3. Include a custom attribute named "isolation_source" with the value being the material the parent sample was isolated from, e.g. "soil" or "gut", to make the souce of the data more searchable.

4. Include a custom attribute named "metagenome_source" with the value being the environmental taxonomy of the parent environmental sample. This makes the sample easy to recognise as originating as part of a metagenomic assembly.

4. Copy other sample attributes from the parent sample to the binned sample as appropriate, e.g. "sampling_station", "event_label", etc. This adds additional context to your environmentally sourced data.

5. Register your sample with as specific taxonomy as possible.

These attributes ensure that there is enough context to your **binned** sample that it can be linked with the rest of your data and anyone browsing your study can follow the workflow of the assembly.

## MAG or SAG assembly

MAG or SAG assemblies involve assembling species specific groups of contigs to form a metagenome assembled genome of that species, originally derived from an environmental source. As the species is known and all the MAGs or SAGs will be assembled seperately, they should each have a species specific sample to represent the taxonomy of the assembled contigs.

This is why a MAG or SAG should be associated with a **species** sample. This also requires some extra rules so that the data can be correctly linked with the original environmental source (either the raw data runs or the **environmental** sample).

When registering a MAG sample, please use the provided MIMAGs checklist, this will guide you through which attributes are mandatory to register a MAG.
You will notice "sample derived from", "isolation source" and "metagenome source" attributes which explain the context of the data. Please see binned assemblies above for an explanation of these.

You should also reference the **environmental** sample in the description as one of the following:

*"This sample represents a MAG from the metagenomic sample ERSXXXXX"*

OR 

*"This sample represents a MAG from the metagenomic run ERRXXXXX"*


You will also notice three mandatory fields that reflect quality of a MAG.

1. **Assembly Quality**

2. **Completeness Score** - ratio of observed single-copy marker genes to total single-copy marker genes 
in chosen marker gene set.

3. **Contamination Score** - ratio of observed single-copy marker genes in ≥2 copies to total single-copy 
marker genes in chosen marker gene set.

It is essential you complete these fields accurately so that the overall quality of the MAG is searchable using the criteria outlined by the Genomic Standards Consortium (GSC) in the 2018 publication [here](https://www.nature.com/articles/nbt.3893#t1 ).

If you wish to search for MAGs by quality, these standards are outlined below:


**Finished (SAG/MAG)**

Assembly quality : Single contiguous sequence without gaps or ambiguities with a consensus error rate equivalent to Q50 or better.


**High-quality draft (SAG/MAG)**

Assembly quality : Multiple fragments where gaps span repetitive regions. Presence of the 23S, 
16S, and 5S rRNA genes and at least 18 tRNAs.
Completion : >90%
Contamination : <5%


**Medium-quality draft (SAG/MAG)**

Assembly quality : Many fragments with little to no review of assembly other than reporting of 
standard assembly statistics.
Completion : ≥50%
Contamination : <10%


**Low-quality draft (SAG/MAG)**

Assembly quality : Many fragments with little to no review of assembly other than reporting of 
standard assembly statistics.
Completion : <50%
Contamination : <10%


It is useful to bear in mind these quality thresholds when assembling and submitting MAGs. And it should be noted that for a metagenomic assembly to be considered a MAG, you require a contamination score of <10%. If you assembly falls above this, then please submit as a binned assembly.


When registering a SAG sample, please contact datasubs@ebi.ac.uk for assistance.

Please see [here](cli_07.html) for more information on how to submit your metagenome assemblies to ENA.





