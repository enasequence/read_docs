Genome Assembly Submissions
===========================

Genome assemblies including metagenomes can be submitted to the European Nucleotide Archive (ENA) through the interactive Webin service. Note that this service supports submission of large number of assemblies.
Genome assemblies submissions include plasmids, organelles, complete virus genomes, viral segments/replicons, bacteriophages, prokaryotic or eukaryotic genomes in any assembly layer (contigs/scaffolds/chromosomes). 


The following picture illustrates the stages of the genome assembly submission process:



-----------------------------------------------------------------------------------------------------------


.. image:: images/Assembly_steps.png
-----------------------------------------------------------------------------------------------------------

**Register the Study.**
You must provide a description of your sequencing study. For this, please follow `here <http://ena-docs.readthedocs.io/en/latest/>`_ the indications of the corresponding module using either the interactive Webin or the programmatic Webin submission service. The study and the sample are independent objects in the ENA metamodel and are only coupled once data (sequences) are submitted.

**Register the Sample.**
You must describe the physical sequenced sample providing the associated metadata (organism, strain, collection date, etc). This is done by using the appropiate sample checklist. To register sample(s), please follow `here <http://ena-docs.readthedocs.io/en/latest/>`_ the indications of the corresponding module using either the interactive Webin or the programmatic Webin submission service. The study and the sample are independent objects in the ENA metamodel and are only coupled once data (sequences) are submitted.

**Prepare the files.**
You must prepare the files in the correct format in order for them to be processed by the genome assembly pipeline. This `page <http://www.ebi.ac.uk/ena/submit/genome-assembly-file-formats/>`_ details the genome assembly file formats to be used. This is a critical step for your submission to be completed automatically. 

**Upload files.**
Files must be uploaded to your Webin account ftp site. Please see details `here <http://www.ebi.ac.uk/ena/submit/uploading-data-files>`_ about how to upload the files. If you have issues with this step, please contact your IT department. We do not provide IT support unless there are issues at our end.

**Define the Assembly.**
During the submission process in the interactive Webin tool, you will define the genome assembly to be submitted (contigs/scaffolds/chromosomes) by answering a short multiple choice questionary (4 questions). Based in your answers, the interface will automatically indicate the files to be uploaded. Please answer the form carefully and upload the right files. This is a critical step for your submission to be completed automatically.

**Submit the Assembly.**
Once you submit your assembly, you will receive a confirmation page and a confirmation email providing a unique identifier for each submitted assembly (ERZXXXXXX). This identifier should be used to contact us for any further query related to the submission. The ERZXXXXXX must not be used in the sequence citation paper. Accession numbers to be used for publication purposes are described `here <http://www.ebi.ac.uk/ena/about/citing-ena-data>`_.

-----------------------------------------------------------------------------------------------------------

**SUBMITING A GENOME ASSEMBLY USING THE INTERACTIVE WEBIN SERVICE**


Once you have registered your ENA Webin account, you can follow the below instructions to submit a genome assembly. We strongly suggest to visit the interactive Webin service before preparing the files to become familiar with the submission tool and to have a comprehensive idea of the type of files required for the submission.

New submitters are required to register a `Webin submission account <http://www.ebi.ac.uk/ena/submit/register-submission-account>`_. Once you have an ENA Webin account, please log in `here <http://www.ebi.ac.uk/ena/about/citing-ena-data>`_.

Part 1
______

.. image:: images/AS_part1.png

1. Once you have logged into your ENA Webin account, start the genome submission by selecting the New Submission tab and clicking the 'Submit genome assemblies' option. 
2. To continue with the next step, click 'Next'.

Part 2 
______

.. image:: images/AS_part2.png


1. Select the study that you will be adding the genome assembly to. If the study that you want to submit to does not exist yet you can create one now (red asterisk). However, it is best to split your submission up and create the study as part of an earlier session (see module 1).
2. Click next to move to the next stage. The next stage is the sample registration stage. In most cases the samples will have already been registered (it is best to submit the samples in a separate submission so that the work is more divided). If the sample has aleady been registered, find the ‘skip’ option to skip this step. If the samples do not exist, do not use the skip option, you can create some samples during this step (see module 1 and module 3).

Part 3
______

.. image:: images/AS_part3.png

1. Please answer carefully the 3 given questions to determine which files are required for your assembly submission. The default submission (all answers NO) allows the submission of contigs/scaffolds in fasta format. 

QUESTION 1: *Are the sequences assembled into chromosomes or replicons? YES/NO*
The chromosomes do not need to be fully sequenced, there can be gaps. If you have assembled plasmids, organelles, bacteriophage genomes or viral segments, please submit them as 'chromosomes' by answering YES to this question. 

QUESTION 2: *Does the assembly contain scaffolds or chromsomes described useing an AGP file? YES/NO*
If you have an AGP file mapping either scaffolds from contigs or chromosomes from scaffold, you should submitted as such and we will build the corresponding sequences(s).

QUESTION 3: *Are the sequences fucntionally annotated? YES/NO*
You need to provide information about the existance of functional annotation. This will determine if a Fasta file or a EMBL flat file should be submitted.

2. If your assembly contains assembled chromosomes, there will be an additinal question to determine if you plan to submit unlocalised sequences. Unlocalised sequences are contigs or scaffolds that are associated with a specific chromosome but their order and orientation is unknown. For the format of the unlocalised list file, please see `here <http://www.ebi.ac.uk/ena/submit/genome-assembly-file-formats/>`_. 

3. You must provide here the accession number (ERSXXXXXX) of the sample to be associated with this assembly. You can also provide the unique name (or alias) of the sample.

4. You must fill up the assembly information.

5. Following your answers in section 1., this section of the right panel will indicate the files to be submitted. The default submission (all answers NO) allows the submission of contigs/scaffolds in fasta format. 

You must provide here the file names (files must be already uploaded) and also the MD5 checksume for each file. All files must be gz compressed. If there are not, please upload them again. Note that you will be able to submit only one file of each type:

One Fasta or EMBL flat file with sequence(s)
One AGP file
One chromosome list file
One unlocalised list file

Therefore, if you wish to submit both scaffolds and chromosomes without AGP file, please submit all the sequences in the same file (either Fasta or EMBL flat file depending if there is functional annotation or not); you will be requested to submit as well a chromosome list file that will identify the chromosome sequences. Likewise, if you wish to submit contig sequences plus an AGP file to build scaffolds and an AGP file to build chromosomes, you must merge both AGP and submit them as one AGP file only.

6. You can also provide the above information in a spreadsheet file. You can download/upload the template here.

7. Once all the above information is provided, please proceed to the next step.

Part 4
______

.. image:: images/AS_part4.png

In this page you will be able to add more assemblies with similar information.

1. Select here how many assemblies you wish to submit (from 1 to 199) and click '+Add'.
The list of assemblies will be displayed. You can navegate throught the list either by selecting them in the list or using the buttons in the right panel (see red asterisk).

2. Please provide the information for each assembly by editing accordingly. Note that each assembly must have a unique sample so you must change at least the sample accession number and the files names and checksum for each assembly. Once you fill up the information in a given field, a green buttin wil indicate that is completed (not necessary validated).

3. You can also download the provided information in a spreadsheet file template here.

4. Once all the information is carefully provided and all fields are indicated with green buttons, you will be able to submit the assembly/assemblies by clicking the "Submit" button. The system will validate the assemby information provided at this stage and display an error message if there are issues to be corrected. 

Part 5
______

.. image:: images/AS_part5.png

When your assembly submission has been succesfully received at ENA, you will see this confirmation page. An email will be also sent to all account holders confirming the genome assembly submission to ENA. 

This submission confirmation means that the sequences, functional annotation if applicable, sample information, assembly information, etc will be processed all together in order to conform the final genome assembly to be displayed in the database according to your release date. If no errors are detected, you will receive an automatic email wth the sequence accession numbers. 
