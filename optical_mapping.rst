===========================
Module 10: Optical Mapping Submissions
===========================

ENA now accepts optical mapping data. For now, we only support data from Bionano platform.
If you have data of this kind, you must submit progamatically an ANALYSIS OBJECT.


a) Register a project (either in interactive `interactive <http://ena-docs.readthedocs.io/en/latest/mod_02.html>`_ or `programatic http://ena-docs.readthedocs.io/en/latest/prog_01.html>`_ Webin.
b) Register a sample (either in interactive `interactive <http://ena-docs.readthedocs.io/en/latest/mod_03.html>`_ or `programatic http://ena-docs.readthedocs.io/en/latest/prog_05.html>`_ Webin.
c) Submit programatically an ANALYSIS OBJECT (see details`here <https://www.ebi.ac.uk/ena/submit/programmatic-submission>`_) with the following details:
-Analysis_type: GENOME_MAP
-File_format: BIONANO_NATIVE
-Analysis_type_file: BioNano_native
-Files:
file_suffix_list: .bnx,.cmap,.xmap,.smap,.coord 
Files can be compressed (.gz) but it is not mandatory
