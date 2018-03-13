External Tools and Resources
****************************

This section includes tools and services that can compliment or assist submissions to ENA or can be used downstream of the ENA.

EMBL Sequence Files
===================

EMBL sequence files are formatted sequence files that contain a nucleotide sequence, annotation, publishing information and resource links. During some submission streams a FASTA file or a spreadsheet file is received and we automatically process them into EMBL files so that we can archive them and mirror them to INSDC collaborators. However in other cases you can create the EMBL files and submit them directly. This can be the case for `Genome Assembly Submissions <mod_06.html>`_ and `Submit an Annotated Sequence <prog_04.html>`_.

Artemis_
   Functional annotation can be submitted using EMBL sequence files that conform to the INSDC feature table format. We recommend that functional annotation is prepared using Artemis. Further information about features and qualifiers is available `here <https://www.ebi.ac.uk/ena/WebFeat/>`_.

EMBLmyGFF3_
   If you have your annotated sequences in GFF3 you can try EMBLmyGFF3 to convert it into EMBL sequence files.

.. _Artemis: http://www.sanger.ac.uk/science/tools/artemis

.. _EMBLmyGFF3: https://github.com/NBISweden/EMBLmyGFF3

Validation
==========

`ENA validator <https://www.ebi.ac.uk/ena/software/flat-file-validator>`_
   This tool is used to validate EMBL sequence files. Validating your files before submission will secure a faster processing time and delivery of accessions.

`NCBI AGP validator <https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Validation/>`_
   AGP files are used for assembling a contig set into scaffolds and chromosomes before submitting a `genome assembly <mod_06.html>`_


Search and Download
===================

enaBrowserTools_
   A set of scripts that interface with the ENA web services to download data from ENA easily, without any knowledge of scripting required. These tools extend the `ENA search and browse guidelines <https://www.ebi.ac.uk/ena/browse>`_.

`Webin data streamer <https://www.ebi.ac.uk/ena/software/webin-data-streamer>`_
   A UDP-based streaming data transmission protocol. This tool is used for downloading files in the read domain. You can search and download in bulk by study, sample, experiment and run ids.

.. _enaBrowserTools: https://github.com/enasequence/enaBrowserTools

NGS Sequence Files
==================

CRAM_
   Reference-based compression of sequence data with a data format that is directly available for computational use. You can convert your read files into CRAM files to help reduce local storage space demand. The CRAM file is submittable as a standard ENA run.

.. _CRAM: https://www.ebi.ac.uk/ena/software/cram-toolkit

