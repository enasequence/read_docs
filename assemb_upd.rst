=================================
Module 8: Genome Assembly Updates
=================================


Study updates
============== 
Studies are fully editable. If you wish to make changes in your study, log in your ENA Webin account and edit the study accordingly. More details about editing a study can be found `here <mod_05.html>`_.

Sample updates
==============
Samples are fully editable. If you wish to make changes in your sample, log in your ENA Webin account and edit the sample accordingly. More details about editing a sample can be found `here <mod_05.html>`_. Please note that the changes done to the sample won't be populated to the genome assembly database flat files. Therefore, you must email us (datasubs@ebi.ac.uk) detailing all the changes done in order for us to update the database EMBL flat files.

Assembly updates (add/modify/remove sequences and/or annotation)
================================================================

To update a genome assembly using the interactive Webin service, please make a `new submission <mod_06.html>`_ with the following indications:

1. You must use the same study (PRJEBXXXX) used in the original assembly to be updated.
2. You must use the same sample (ERSXXXXXX) used in the original assembly to be updated.
3. You must use a different assembly name in the update submission.
4. You must use the same `entry name <https://www.ebi.ac.uk/ena/submit/genome-assembly-file-formats>`_ used in the original assembly. We strongly recommend to download the relevant flat files from the database if they are public (www.ebi.ac.uk/ena/data/view/accession_number) or you can request them from us (datasubs@ebi.ac.uk) if they have private status.

By following the above, the pipeline will recognise your submission as an update of the original assembly.



**IMPORTANT NOTES FOR THE FILE PREPARATION IN GENOME ASSEMBLY UPDATES**

-> if you are **adding/removing/changing contigs/scaffolds/chromosomes sequences** to the current assembly, you must submit ALL the sequences involved in the assembly, not just the new scaffolds/contigs/chromosomes. You must submit all the layers, regardless of what assembly layer is being updated. For contigs/scaffolds updates, the pipeline will give new accession numbers with the same prefix but a second build. Example:

Original assembly: SENA0100000001-SENA0100234567

Update: SENA0200000001-SENA0200000789

-> if you are **adding chromosome(s) to the current assembly that contains only chromosomes**, you must submit only the chromosome sequence(s) to be added. This applies also when adding plasmids.

Acession numbers will be given to the new sequence(s) but will be all under the same assembly ID (GCA_XXXXXXXX)

-> if you are **adding/changing annotation to contigs/scaffolds/chromosomes**, please submit the flat file(s) with the same sequence and the new annotation all together. Accession numbers won't be changed in this case.
For the file preparation in this case, we strongly recommend:
a) download the relevant flat file from the database if they are public or you can request them from us if they have private status
b) add the annotation to the involved files, keeping all the file headers intact, and use this file for the update. 

Once again, take in account that if the assembly is made of contigs/scaffolds AND chromosomes, you must submit the full new set of contigs/scaffolds AND the chromosomes, regardless of what assembly level is being updated.
