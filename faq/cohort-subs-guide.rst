Submit Linked Cohort Data
=========================

This guide includes information about how to submit linked cohort datasets for displaying in the EBIs Pathogens Portal.

Introduction
````````````
Infectious disease plays out as an intricate set of molecular interactions between the systems of both pathogen and infected host.
In cases of vector-borne disease, such as malaria, or diseases with intermediate hosts, such as tapeworm, interactions with further
species are involved. Studying these interconnected biologies, such as to understand infection mechanisms and patient response,
develop clinical and public health interventions and predict outcomes of the circulation of new pathogen variants, requires the use
of combined data sets which span the two or more organisms involved in the infection.

Regardless of which technical platform is used for their generation, biological data can be organised around the concept of sample.
A biological sample, such as a blood sample from a patient, can be represented as a digital record with an identifier. When the
sample is subjected to different assays, such as genomic sequencing or serology analysis, each of the resultant data sets can
reference the identifier of the sample from which they were derived. In many workflows, samples are divided, such as when a
wastewater sample is size-filtered to yield a bacterial subsample and a viral subsample. Records for each of these new samples
can be created and given their own identifiers, and reference can be made back to the sample from which they were derived by using
its top-level sample identifier.

.. image:: images/linked_samples.png
   :width: 600
   :alt: diagram showing BioSample relationships and data types
   :align: center

Steps
`````
The steps detailed here provide an overview of how to create a dataset record including multiple linked data types, to appear in the
`Pathogens Portal Cohort Browser <https://www.pathogensportal.org/cohorts>`_.
Before starting a submission, we strongly advise you to contact us at cohort-dataflow@ebi.ac.uk if you are planning to submit a
linked cohort dataset, including some details about your study, and we can provide support with the following steps.

1. Create the top-level sample
''''''''''''''''''''''''''''''

Top-level samples representing each case or patient can be created in the `BioSamples Archive <https://www.ebi.ac.uk/biosamples/>`_.
This is represented by sample H1 in the diagram above. For a human sample, these can contain minimal, non-identifying metadata about
the patient (e.g. gender, organism, disease). See an example `here <https://www.ebi.ac.uk/biosamples/samples/SAMEA12928716>`_.

Top-level Sample records can be created in BioSamples using the `BioSamples uploader tool <https://www.ebi.ac.uk/biosamples/docs/cookbook/upload_files>`_.

2. Create the child samples in EBI data resources
'''''''''''''''''''''''''''''''''''''''''''''''''

Please note you can use different samples for different data types and for different time points. Please also be advised
that EGA and ENA are the only archives which integrate the BioSample records into their metadata models. For data deposited
at other archives, additional BioSample records may need to be created (in BioSamples) to represent those data.

- For pathogen nucleotide records (raw reads or assembly data), please refer to the ENA `Sample Registration Guide <../submit/samples.html>`_.
- For sensitive human nucleotide records and human clinical epidemiological data which requires controlled access, please
  contact the `EGA (European Genome Phenome Archive) <https://ega-archive.org/>`_ to start a submission.
- For expression data, please use `ArrayExpress/Biostudies <https://www.ebi.ac.uk/biostudies/arrayexpress>`_
- For other types of biological data, or if you are not sure which archive to use, please use the `EBI submissions wizard <https://www.ebi.ac.uk/submission/>`_
  which can direct you to a resource to deposit your data.

3. Link together the samples using BioSamples
''''''''''''''''''''''''''''''''''''''''''''''

Link your samples created from other EBI resources to the top-level sample using the ‘derived from’ curation on
BioSamples. The derived from relationship is used as follows:

**Source sample** - *derived from* - **Target sample**

**Child sample accession** - *derived from* - **Parent sample accession**

e.g. for the `EMC study <https://www.ebi.ac.uk/about/news/updates-from-data-resources/pathogens-portal-linked-dataset/>`_:

**[T/B-Cell/Antibody profile/ENA viral sample accession]** - *derived from* - **[Top level patient sample accession]**

A JSON file curation object (see example below) containing the relationship attribute with the source and target sample
should be created and submitted via curl to BioSamples (see instructions `here <https://www.ebi.ac.uk/biosamples/docs/references/api/submit#_submit_curation_object>`_)
Please contact ena-path-collabs@ebi.ac.uk (or BioSamples) for technical support with sample linking using BioSamples.


.. code-block:: JSON

   {
     "curation" : {
      "relationshipsPre" : [ ],
       "relationshipsPost" : [ {
         "source" : "SAMFAKE123456",
         "type" : "DERIVED_FROM",
         "target" : "SAMFAKE7654321"
       } ],
       "hash" : "09a5a9cddbea9f5bb6302b86b922c408abc92b8b10c78f0662ac7e41fd44e91f"
     },
    "domain" : null,
    "webinSubmissionAccountId" : "WEBIN-12345",
     "created" : "2023-07-17T12:19:33.056356Z",
     "hash" : "d1f611ec2c8caf3d9f58fa40227ea60ebb5fc00eda06338fb81db7d987a6fa63"
   }

..



4. Submit the cohort metadata
'''''''''''''''''''''''''''''

While the BioSamples database is key to capturing the linking of data types on participant level, the
`Cohort Browser <https://www.pathogensportal.org/cohorts>`_ presents a range of study-level information about each cohort.
This metadata is an integral part of the Pathogens Portal, enhancing the findability of a cohort dataset, and this serves
as the primary entry point into cohort data. The linked data types included in the cohort will be indicated under the
'Type of data' column within the cohort browser.

s an integral part of the Pathogens Portal, and serves as the primary entry point into cohort data.

For your cohort to display within a cohort browser, please contact us to check which metadata will be needed for your dataset.
As a guide, the following information will be needed to describe the cohort:

- Cohort acronym/link to webpage
- Cohort title
- Cohort/study description
- Institution
- Number of participants
- Territory/country
- Enrollment period

Please find the form `here <https://docs.google.com/spreadsheets/d/1LuyPhv1J5t2FU7JE2XjW9n__PjGTxeBoA38PXpN8sG8/edit#gid=0>`_
for a more complete version of the suggested metadata. Please get in touch with us at x if you would like to add your cohort
metadata to the Pathogens Portal Cohort Browser.