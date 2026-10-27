=======================================
Improved Experiment Metadata at ENA Now
=======================================


.. contents:: Contents
   :depth: 4

1. Introduction
===============

Sequencing technologies have continued to advance allowing biological scientists are
applying the technology to many different use cases. These vary from determining the
sequence of a whole genome to identifying organisms from fragments of
environmental DNA (eDNA). Having the key metadata that describes these sequencing experiments increases the reusability
and even interoperability of the data, making your data even more valuable to the scientific data ecosystem.

Through the work of the `GA4GH Experiment Metadata team <https://github.com/ga4gh/experiments-metadata>`_, there is now
consensus of what core metadata should be ubiquitous. This core was mainly the metadata that was already required by INSDC,
, but also included several FAIR important additions.
We have also been drafting the extensions that are needed for some use cases. This is the basis of what is being shown
below in the example use cases.

INSDC members such as ENA want to adopt the emerging standard and complementary work has started in several
of the archives. There is much legacy infrastructure and only limited developer time, so in the meant time
we can already
submit to the archives

2. Adding Extra Experiment Metadata
===================================

All the experiment metadata currently needs to conform to the SRA.experiment.xsd (

https://github.com/enasequence/webin-xml/blob/master/src/main/resources/uk/ac/ebi/ena/sra/schema/SRA.experiment.xsd)

.. code:: sh

   curl -s 'https://raw.githubusercontent.com/enasequence/webin-xml/refs/heads/master/src/main/resources/uk/ac/ebi/ena/sra/schema/SRA.experiment.xsd'

The XSD has the very useful **<EXPERIMENT_ATTRIBUTES>** feature that allows one to add your
own metadata

( https://ena-docs.readthedocs.io/en/latest/submit/reads.html and
https://ena-docs.readthedocs.io/en/latest/submit/reads/interactive.html
) Some users have already have done similar
https://www.ebi.ac.uk/ena/browser/view/ERX2151578

E.G.

.. code:: xml

   <EXPERIMENT_ATTRIBUTE>
       <TAG>target_gene</TAG>
       <VALUE>COI</VALUE>
   </EXPERIMENT_ATTRIBUTE>
   <EXPERIMENT_ATTRIBUTE>
       <TAG>target_subfragment</TAG>
       <VALUE>Folmer region</VALUE>
   </EXPERIMENT_ATTRIBUTE>

The intention is to provide documentation:

-  Provide the GA4GH core data that has to be added (most of that
      already is)

-  Provide as **per use case:**

   -  Focus on the mandatory terms and definitions

   -  Then a list of the optional terms and definitions

   -  A filled out example submission XML

   -  (this is a stop gap at ENA, whilst 1) we finally agree on 2) I/we
         need to get standardised terms via GSC MIxS too 3) get ENA
         development resources aligned)


That will mean that experiments are better annotated going forwards.
Although not optimally standardised in the short term.

----

3. Use Case Examples
====================



3.1 Metabarcoding
-----------------

.. code:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <EXPERIMENT_SET>
       <EXPERIMENT alias='example_metabarcoding_coi' center_name='YOUR_CENTER'>
           <TITLE>Example COI metabarcoding experiment</TITLE>
           <STUDY_REF accession='ERP012803'>
               <IDENTIFIERS>
                   <PRIMARY_ID>ERP012803</PRIMARY_ID>
                   <SECONDARY_ID>PRJEB11419</SECONDARY_ID>
               </IDENTIFIERS>
           </STUDY_REF>
           <DESIGN>
               <DESIGN_DESCRIPTION>
                   Two-step PCR metabarcoding of the mitochondrial cytochrome c oxidase subunit I
                   (COI) locus from an environmental DNA sample.
               </DESIGN_DESCRIPTION>
               <SAMPLE_DESCRIPTOR accession='ERS915523'>
                   <IDENTIFIERS>
                       <PRIMARY_ID>ERS915523</PRIMARY_ID>
                       <EXTERNAL_ID namespace='BioSample'>SAMEA3608374</EXTERNAL_ID>
                   </IDENTIFIERS>
               </SAMPLE_DESCRIPTOR>
               <LIBRARY_DESCRIPTOR>
                   <LIBRARY_NAME>COI metabarcoding library</LIBRARY_NAME>
                   <LIBRARY_STRATEGY>AMPLICON</LIBRARY_STRATEGY>
                   <LIBRARY_SOURCE>METAGENOMIC</LIBRARY_SOURCE>
                   <LIBRARY_SELECTION>PCR</LIBRARY_SELECTION>
                   <LIBRARY_LAYOUT>
                       <PAIRED NOMINAL_LENGTH='450' NOMINAL_SDEV='30'/>
                   </LIBRARY_LAYOUT>
                   <LIBRARY_CONSTRUCTION_PROTOCOL>
                       DNA was extracted using the QIAamp DNA Blood Mini Kit. The COI locus was
                       amplified using a two-step PCR with mlCOIintF and jgHCO2198 primers,
                       indexed, purified, pooled, and sequenced.
                   </LIBRARY_CONSTRUCTION_PROTOCOL>
               </LIBRARY_DESCRIPTOR>
           </DESIGN>
           <PLATFORM>
               <ILLUMINA>
                   <INSTRUMENT_MODEL>Illumina MiSeq</INSTRUMENT_MODEL>
               </ILLUMINA>
           </PLATFORM>
           <EXPERIMENT_ATTRIBUTES>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>target_enrichment_method</TAG>
                   <VALUE>PCR amplification</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>target_enrichment_protocol</TAG>
                   <VALUE>two-step PCR</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>target_gene</TAG>
                   <VALUE>COI</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>target_subfragment</TAG>
                   <VALUE>Folmer region</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>targetTaxonomicAssay</TAG>
                   <VALUE>Metazoa</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>targetTaxonomicScope</TAG>
                   <VALUE>teleost fishes</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>pcr_primer_forward</TAG>
                   <VALUE>GGWACWGGWTGAACWGTWTAYCCYCC</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>pcr_primer_reverse</TAG>
                   <VALUE>TAIACYTCIGGRTGICCRAARAAYCA</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>pcr_primer_name_forward</TAG>
                   <VALUE>mlCOIintF</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>pcr_primer_name_reverse</TAG>
                   <VALUE>jgHCO2198</VALUE>
               </EXPERIMENT_ATTRIBUTE>
           </EXPERIMENT_ATTRIBUTES>
       </EXPERIMENT>
   </EXPERIMENT_SET>

----

3.2 Exome Sequencing
--------------------

.. code:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <EXPERIMENT_SET>
       <EXPERIMENT alias='example_human_exome' center_name='YOUR_CENTER'>
           <TITLE>Example human whole-exome sequencing experiment</TITLE>
           <STUDY_REF accession='ERP012803'>
               <IDENTIFIERS>
                   <PRIMARY_ID>ERP012803</PRIMARY_ID>
                   <SECONDARY_ID>PRJEB11419</SECONDARY_ID>
               </IDENTIFIERS>
           </STUDY_REF>
           <DESIGN>
               <DESIGN_DESCRIPTION>Paired-end sequencing of a hybrid-capture whole-exome library prepared from human genomic DNA.</DESIGN_DESCRIPTION>
               <SAMPLE_DESCRIPTOR refname='YOUR_SAMPLE_ALIAS'/>
               <LIBRARY_DESCRIPTOR>
                   <LIBRARY_NAME>Human exome library</LIBRARY_NAME>
                   <LIBRARY_STRATEGY>WXS</LIBRARY_STRATEGY>
                   <LIBRARY_SOURCE>GENOMIC</LIBRARY_SOURCE>
                   <LIBRARY_SELECTION>Hybrid Selection</LIBRARY_SELECTION>
                   <LIBRARY_LAYOUT>
                       <PAIRED NOMINAL_LENGTH='350' NOMINAL_SDEV='50'/>
                   </LIBRARY_LAYOUT>
                   <LIBRARY_CONSTRUCTION_PROTOCOL>
                       Genomic DNA was fragmented, end repaired, adapter ligated, PCR amplified,
                       and enriched with the Agilent SureSelect Human All Exon V8 capture kit
                       before paired-end sequencing.
                   </LIBRARY_CONSTRUCTION_PROTOCOL>
               </LIBRARY_DESCRIPTOR>
           </DESIGN>
           <PLATFORM>
               <ILLUMINA>
                   <INSTRUMENT_MODEL>Illumina NovaSeq 6000</INSTRUMENT_MODEL>
               </ILLUMINA>
           </PLATFORM>
           <EXPERIMENT_ATTRIBUTES>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>target_enrichment_method</TAG>
                   <VALUE>hybrid capture</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>target_enrichment_protocol</TAG>
                   <VALUE>Agilent SureSelect target-enrichment protocol</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>library_selection_details</TAG>
                   <VALUE>Agilent SureSelect Human All Exon V8</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>library_capture_details</TAG>
                   <VALUE>SureSelect Human All Exon V8 probes; overnight hybridisation</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>insert_size</TAG>
                   <VALUE>350</VALUE>
                   <UNITS>bp</UNITS>
               </EXPERIMENT_ATTRIBUTE>
           </EXPERIMENT_ATTRIBUTES>
       </EXPERIMENT>
   </EXPERIMENT_SET>

----

3.3 Single Cell RNASeq
----------------------

.. code:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <EXPERIMENT_SET>
       <EXPERIMENT alias='example_single_cell_rnaseq' center_name='YOUR_CENTER'>
           <TITLE>Example 10x Genomics single-cell RNA-seq experiment</TITLE>
           <STUDY_REF refname='YOUR_STUDY_ALIAS'/>
           <DESIGN>
               <DESIGN_DESCRIPTION>
                   Gene-expression profiling of single cells using a droplet-based 3-prime tagged
                   single-cell RNA-seq assay.
               </DESIGN_DESCRIPTION>
               <SAMPLE_DESCRIPTOR refname='YOUR_SAMPLE_ALIAS'/>
               <LIBRARY_DESCRIPTOR>
                   <LIBRARY_NAME>10x Genomics single-cell gene expression library</LIBRARY_NAME>
                   <LIBRARY_STRATEGY>RNA-Seq</LIBRARY_STRATEGY>
                   <LIBRARY_SOURCE>TRANSCRIPTOMIC</LIBRARY_SOURCE>
                   <LIBRARY_SELECTION>cDNA</LIBRARY_SELECTION>
                   <LIBRARY_LAYOUT>
                       <PAIRED NOMINAL_LENGTH='300' NOMINAL_SDEV='50'/>
                   </LIBRARY_LAYOUT>
                   <LIBRARY_CONSTRUCTION_PROTOCOL>
                       Viable single cells were partitioned with barcoded gel beads using the 10x
                       Genomics Chromium Single Cell 3 prime Gene Expression workflow. Barcoded
                       cDNA was amplified and converted to an Illumina sequencing library.
                   </LIBRARY_CONSTRUCTION_PROTOCOL>
               </LIBRARY_DESCRIPTOR>
           </DESIGN>
           <PLATFORM>
               <ILLUMINA>
                   <INSTRUMENT_MODEL>Illumina NovaSeq 6000</INSTRUMENT_MODEL>
               </ILLUMINA>
           </PLATFORM>
           <EXPERIMENT_ATTRIBUTES>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>suspension_type</TAG>
                   <VALUE>whole cells</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>cell_enrichment</TAG>
                   <VALUE>CL:0000540+</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>cell_number_loaded</TAG>
                   <VALUE>10000</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>cell_viability_percentage</TAG>
                   <VALUE>90</VALUE>
                   <UNITS>percent</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>library_preparation_batch</TAG>
                   <VALUE>batch_01</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>sequenced_fragment</TAG>
                   <VALUE>3 prime tag</VALUE>
               </EXPERIMENT_ATTRIBUTE>
           </EXPERIMENT_ATTRIBUTES>
       </EXPERIMENT>
   </EXPERIMENT_SET>

----

3.4 Long read
-------------

3.4.1 PacBio Examples
~~~~~~~~~~~~~~~~~~~~~

.. code:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <EXPERIMENT_SET>
       <EXPERIMENT alias='example_pacbio_hifi_wgs' center_name='YOUR_CENTER'>
           <TITLE>Example PacBio HiFi whole-genome sequencing experiment</TITLE>
           <STUDY_REF accession='ERP012803'>
               <IDENTIFIERS>
                   <PRIMARY_ID>ERP012803</PRIMARY_ID>
                   <SECONDARY_ID>PRJEB11419</SECONDARY_ID>
               </IDENTIFIERS>
           </STUDY_REF>
           <DESIGN>
               <DESIGN_DESCRIPTION>
                   Single-molecule long-read whole-genome sequencing of high-molecular-weight
                   genomic DNA using PacBio HiFi chemistry.
               </DESIGN_DESCRIPTION>
               <SAMPLE_DESCRIPTOR refname='YOUR_SAMPLE_ALIAS'/>
               <LIBRARY_DESCRIPTOR>
                   <LIBRARY_NAME>PacBio HiFi whole-genome library</LIBRARY_NAME>
                   <LIBRARY_STRATEGY>WGS</LIBRARY_STRATEGY>
                   <LIBRARY_SOURCE>GENOMIC</LIBRARY_SOURCE>
                   <LIBRARY_SELECTION>size fractionation</LIBRARY_SELECTION>
                   <LIBRARY_LAYOUT>
                       <SINGLE/>
                   </LIBRARY_LAYOUT>
                   <LIBRARY_CONSTRUCTION_PROTOCOL>
                        High-molecular-weight genomic DNA was extracted using an HMW-preserving
                       protocol, size selected, converted to a SMRTbell library, and sequenced in
                       HiFi mode.
                   </LIBRARY_CONSTRUCTION_PROTOCOL>
               </LIBRARY_DESCRIPTOR>
           </DESIGN>
           <PLATFORM>
               <PACBIO_SMRT>
                   <INSTRUMENT_MODEL>PacBio Sequel IIe</INSTRUMENT_MODEL>
               </PACBIO_SMRT>
           </PLATFORM>
           <EXPERIMENT_ATTRIBUTES>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>size selection method</TAG>
                   <VALUE>BluePippin size selection</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>HMW preservation extraction optimised</TAG>
                   <VALUE>true</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Sequencing chemistry version</TAG>
                   <VALUE>Sequel II Binding Kit 2.2</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>SMRT cell type</TAG>
                   <VALUE>SMRT Cell 8M</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Run mode</TAG>
                   <VALUE>HiFi</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>passes for HiFi consensus</TAG>
                   <VALUE>15</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Read length N50 / L50</TAG>
                   <VALUE>18000</VALUE>
                   <UNITS>bp</UNITS>
               </EXPERIMENT_ATTRIBUTE>
           </EXPERIMENT_ATTRIBUTES>
       </EXPERIMENT>
   </EXPERIMENT_SET>

3.4.2 Nanopore Example
~~~~~~~~~~~~~~~~~~~~~~

.. code:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <EXPERIMENT_SET>
       <EXPERIMENT alias='EXAMPLE_EXP_ONT_001' center_name='EXAMPLE_SEQUENCING_CENTRE'>
           <TITLE>Oxford Nanopore PromethION whole-genome sequencing of EXAMPLE_SAMPLE_001</TITLE>
           <STUDY_REF accession='ERP012803'>
               <IDENTIFIERS>
                   <PRIMARY_ID>ERP012803</PRIMARY_ID>
                   <SECONDARY_ID>PRJEB11419</SECONDARY_ID>
               </IDENTIFIERS>
           </STUDY_REF>
           <DESIGN>
               <DESIGN_DESCRIPTION>
                   Whole-genome sequencing of high-molecular-weight genomic DNA using Oxford
                   Nanopore Technologies long-read sequencing. DNA extraction was optimised to
                   preserve high-molecular-weight fragments. A BluePippin size-selection step was
                   used before ligation-library preparation and sequencing on a PromethION
                   instrument.
               </DESIGN_DESCRIPTION>
               <SAMPLE_DESCRIPTOR refname='EXAMPLE_SAMPLE_001'/>
               <LIBRARY_DESCRIPTOR>
                   <LIBRARY_NAME>EXAMPLE_LIBRARY_001</LIBRARY_NAME>
                   <LIBRARY_STRATEGY>WGS</LIBRARY_STRATEGY>
                   <LIBRARY_SOURCE>GENOMIC</LIBRARY_SOURCE>
                   <LIBRARY_SELECTION>size fractionation</LIBRARY_SELECTION>
                   <LIBRARY_LAYOUT>
                       <SINGLE/>
                   </LIBRARY_LAYOUT>
                   <LIBRARY_CONSTRUCTION_PROTOCOL>
                        High-molecular-weight genomic DNA was prepared with the Oxford Nanopore
                       ligation sequencing workflow using kit SQK-LSK114. DNA fragments were
                       size-selected using a BluePippin instrument. Sequencing was performed using
                       an R10.4.1 flow cell. Basecalling was performed with Dorado using the
                       specified basecalling model.
                   </LIBRARY_CONSTRUCTION_PROTOCOL>
               </LIBRARY_DESCRIPTOR>
           </DESIGN>
           <PLATFORM>
               <OXFORD_NANOPORE>
                   <INSTRUMENT_MODEL>PromethION</INSTRUMENT_MODEL>
               </OXFORD_NANOPORE>
           </PLATFORM>
           <EXPERIMENT_ATTRIBUTES>
               <!-- Core/checklist descriptors -->
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>experiment type</TAG>
                   <VALUE>DNA sequencing assay</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>assay type</TAG>
                   <VALUE>whole genome sequencing assay</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>molecule type</TAG>
                   <VALUE>genomic DNA</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>sequencing protocol</TAG>
                   <VALUE> https://doi.org/EXAMPLE_PROTOCOL_OR_VERSIONED_SOP</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <!-- DNA and size-selection metadata -->
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>HMW preservation extraction optimised</TAG>
                   <VALUE>true</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>size selection method</TAG>
                   <VALUE>BluePippin size selection</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>max fragment length</TAG>
                   <VALUE>100000</VALUE>
                   <UNITS>bp</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>smearing patterns</TAG>
                   <VALUE>High-molecular-weight DNA smear; limited low-molecular-weight degradation</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>fragments above 50 kb</TAG>
                   <VALUE>25</VALUE>
                   <UNITS>percent</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>pore or polymerase inhibitors</TAG>
                   <VALUE>none known</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <!-- ONT chemistry, flow-cell, and run configuration -->
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>sequencing kit</TAG>
                   <VALUE>SQK-LSK114</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>sequencing chemistry version</TAG>
                   <VALUE>R10.4.1</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>cell type</TAG>
                   <VALUE>PromethION flow cell</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>cell lot number</TAG>
                   <VALUE>EXAMPLE_FLOW_CELL_LOT</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>flow cell version</TAG>
                   <VALUE>R10.4.1</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>loading concentration indicators</TAG>
                   <VALUE> EXAMPLE_LOADING_CONCENTRATION_AND_LOADING_NOTES</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>run mode</TAG>
                   <VALUE>standard sequencing</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>total run time</TAG>
                   <VALUE>72</VALUE>
                   <UNITS>hours</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>run time and voltage parameters</TAG>
                   <VALUE>72-hour run; voltage settings controlled by MinKNOW</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>pore occupancy</TAG>
                   <VALUE>EXAMPLE_PORE_OCCUPANCY_SUMMARY</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <!-- Signal and basecalling metadata -->
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>samples per base</TAG>
                   <VALUE>EXAMPLE_SAMPLES_PER_BASE</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>drift or scaling metrics</TAG>
                   <VALUE>EXAMPLE_DRIFT_AND_SCALING_SUMMARY</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>basecaller</TAG>
                   <VALUE>Dorado</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>basecaller version</TAG>
                   <VALUE>EXAMPLE_DORADO_VERSION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>basecalling model</TAG>
                   <VALUE>dna_r10.4.1_e8.2_400bps_sup</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>basecalling parameters</TAG>
                   <VALUE>Super-accurate model; modified-base calling not performed</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Q-score model used</TAG>
                   <VALUE>EXAMPLE_QSCORE_MODEL</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <!-- Read-level QC -->
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>aligned N50</TAG>
                   <VALUE>EXAMPLE_ALIGNED_N50</VALUE>
                   <UNITS>bp</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>read length N50</TAG>
                   <VALUE>24500</VALUE>
                   <UNITS>bp</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>read length L50</TAG>
                   <VALUE>EXAMPLE_READ_LENGTH_L50</VALUE>
                   <UNITS>reads</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>maximum read length</TAG>
                   <VALUE>EXAMPLE_MAXIMUM_READ_LENGTH</VALUE>
                   <UNITS>bp</UNITS>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>distribution of read lengths</TAG>
                   <VALUE> EXAMPLE_PATH_OR_SUMMARY_OF_READ_LENGTH_DISTRIBUTION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>read length distribution per channel</TAG>
                   <VALUE> EXAMPLE_PATH_OR_SUMMARY_OF_PER_CHANNEL_READ_LENGTH_DISTRIBUTION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>quality decay across read length</TAG>
                   <VALUE>EXAMPLE_QUALITY_DECAY_SUMMARY</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>adapter or overhang statistics</TAG>
                   <VALUE> EXAMPLE_ADAPTER_AND_OVERHANG_QC_SUMMARY</VALUE>
               </EXPERIMENT_ATTRIBUTE>
           </EXPERIMENT_ATTRIBUTES>
       </EXPERIMENT>
   </EXPERIMENT_SET>

----

3.5 Pathogen Example
--------------------



.. code:: xml

   <?xml version="1.0" encoding="UTF-8"?>
   <!--
   Template derived from the public SRX12632691 record.
   Project: PRJNA751627; BioSample: SAMN22183487.
   Replace the experiment alias and every value marked REPLACE_WITH before
   submitting. Values explicitly marked "Not reported in source record" are
   not claims about SRX12632691 and should be replaced with the true value or
   omitted if unavailable.
   -->
   <EXPERIMENT_SET>
       <EXPERIMENT alias='YOUR_EXPERIMENT_ALIAS' center_name='YOUR_CENTER'>
           <TITLE>Pathogen-detection Oxford Nanopore whole-genome sequencing</TITLE>
           <STUDY_REF accession='PRJNA751627'/>
           <DESIGN>
               <DESIGN_DESCRIPTION>
                   Pathogen detection by Oxford Nanopore sequencing. Expand with the
                   library-preparation and sequencing protocol used for this experiment.
               </DESIGN_DESCRIPTION>
               <SAMPLE_DESCRIPTOR accession='SAMN22183487'/>
               <LIBRARY_DESCRIPTOR>
                   <LIBRARY_NAME>REPLACE_WITH_LIBRARY_ID</LIBRARY_NAME>
                   <LIBRARY_STRATEGY>WGS</LIBRARY_STRATEGY>
                   <LIBRARY_SOURCE>METAGENOMIC</LIBRARY_SOURCE>
                   <LIBRARY_SELECTION>RANDOM PCR</LIBRARY_SELECTION>
                   <LIBRARY_LAYOUT>
                       <SINGLE/>
                   </LIBRARY_LAYOUT>
                   <LIBRARY_CONSTRUCTION_PROTOCOL>REPLACE_WITH_LIBRARY_CONSTRUCTION_PROTOCOL</LIBRARY_CONSTRUCTION_PROTOCOL>
               </LIBRARY_DESCRIPTOR>
           </DESIGN>
           <PLATFORM>
               <OXFORD_NANOPORE>
                   <INSTRUMENT_MODEL>MinION</INSTRUMENT_MODEL>
               </OXFORD_NANOPORE>
           </PLATFORM>
           <EXPERIMENT_ATTRIBUTES>
               <!-- Core checklist fields, represented here as searchable attributes. -->
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>experiment_type</TAG>
                   <VALUE>whole genome sequencing</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>molecule_type</TAG>
                   <VALUE>metagenomic DNA</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>assay_type</TAG>
                   <VALUE>whole genome sequencing assay</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>library_layout</TAG>
                   <VALUE>single-end</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>instrument</TAG>
                   <VALUE>Oxford Nanopore MinION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <!-- Long Reads (v2) checklist fields: fill with observed values. -->
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>size selection method</TAG>
                   <VALUE>REPLACE_WITH_METHOD_OR_none</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>HMW preservation extraction optimised</TAG>
                   <VALUE>REPLACE_WITH_true_OR_false</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Sequencing kit</TAG>
                   <VALUE>REPLACE_WITH_KIT_NAME_AND_VERSION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Sequencing chemistry version</TAG>
                   <VALUE>REPLACE_WITH_CHEMISTRY_VERSION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Cell type</TAG>
                   <VALUE>REPLACE_WITH_FLOW_CELL_TYPE</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Cell lot number</TAG>
                   <VALUE>REPLACE_WITH_FLOW_CELL_LOT_OR_IDENTIFIER</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Flow cell version</TAG>
                   <VALUE>REPLACE_WITH_EG_R9.4.1_OR_R10.4.1</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Basecaller</TAG>
                   <VALUE>REPLACE_WITH_BASECALLER_NAME</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Basecaller version</TAG>
                   <VALUE>REPLACE_WITH_VERSION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Basecalling model</TAG>
                   <VALUE>REPLACE_WITH_MODEL_NAME</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Raw squiggle files present</TAG>
                   <VALUE>REPLACE_WITH_true_OR_false</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Read length N50 / L50</TAG>
                   <VALUE>REPLACE_WITH_N50_BP_AND_OPTIONAL_L50</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Maximum read length</TAG>
                   <VALUE>REPLACE_WITH_BP</VALUE>
               </EXPERIMENT_ATTRIBUTE>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>Total run time</TAG>
                   <VALUE>REPLACE_WITH_DURATION</VALUE>
               </EXPERIMENT_ATTRIBUTE>
           </EXPERIMENT_ATTRIBUTES>
       </EXPERIMENT>
   </EXPERIMENT_SET>

----
