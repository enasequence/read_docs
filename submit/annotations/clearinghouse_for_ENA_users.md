# Clearinghouse for ENA Users

<!-- TOC -->
* [Clearinghouse for ENA Users](#clearinghouse-for-ena-users)
  * [Purpose of this document](#purpose-of-this-document)
  * [Introduction](#introduction)
    * [Further Reading](#further-reading)
    * [The Relevancy to ENA](#the-relevancy-to-ena)
  * [Example use cases](#example-use-cases)
  * [Making use of the Extra Annotation in Clearinghouse](#making-use-of-the-extra-annotation-in-clearinghouse)
  * [Programmatic Querying of Clearinghouse](#programmatic-querying-of-clearinghouse)
  * [How is using the Clearinghouse Different from Updating Records in ENA/Biosamples?](#how-is-using-the-clearinghouse-different-from-updating-records-in-enabiosamples-)
  * [The Link between Biosamples & ENA](#the-link-between-biosamples--ena)
  * [Appendix:](#appendix)
    * [1. A template bash script for submission](#1-a-template-bash-script-for-submission)
<!-- TOC -->

## Purpose of this document
This document's purpose is to provide a little guidance to submitting curations to the ELIXIR Clearinghouse, to make it easier for people to submit data to it. 
It is a supplement to the API document (here: https://docs.google.com/document/d/1y1a4xQwCddntDkmY3qq1XvxtMUZAtW0h3RhEMo3Gtho/edit#heading=h.1ksv4uv), which contains more technical information regarding usage of the Clearinghouse API, so please ensure you read both before starting. The API document is the source of truth and will be more frequently updated than this one.

## Introduction
The ELIXIR Clearinghouse enables extension, correction and improvement of publicly available annotations on sample and sequence records available in ELIXIR data resources - namely Biosamples and the European Nucleotide Archive (ENA), as well as the wider International Nucleotide Sequence Database Collaboration (INSDC) databases. The overall aim is to make metadata more FAIR and improve its quality.

Curations submitted to Clearinghouse will present alongside the record, without the original archived metadata being changed. This allows the scientific community to enhance existing metadata records, for example to add information gleaned from paper supplements, or propose improved attributes that previously did not conform to standards/ontologies, without modifying the original record (often) submitted by a different user.

### Background
The Clearinghouse was developed as part of an ELIXIR project to:
- strengthen collaborations between ELIXIR resources
- improve the quality and impact of metadata, and
- build more sustainable data resources
It was initially developed to support records in the marine domain, but has since expanded to cover multiple project types, see below.
For more information see https://elixir-europe.org/internal-projects/commissioned-services/establishment-data-clearinghouse

The SWAGGER API to the Clearinghouse :  https://www.ebi.ac.uk/ena/clearinghouse/api/swagger-ui/index.html

### The Relevancy to ENA
The Clearinghouse is deliberately set up to allow submission of new/updated metadata related to records originating from different archives. ENA staff have been amongst the most enthusiastic users and metadata annotators, and have supported other external groups to submit these metadata curations. Wider enthusiasm is also increasing.



 
## Example use cases
| Project                             | Clearinghouse usage                                                                                                                                                                                                                                                    | ENA members involved  | External groups involved              |
|-------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|---------------------------------------|
| BY-COVID (beyond-COVID)                            | <ul><li>27,566,814 SARS-CoV-2 curations pushed through by UiT <li>appropriate curations presenting alongside records in ENA Browser </ul>                                                                                                           | Zahra Waheed, Nadim Rahman          | The Arctic University of Norway (UiT) |
| <p style="color:blue">BlueCloud</p> | <ul><li>Extra metadata around geographical determination (using GPS and taxonomy) and from GPS  <li>e.g.  EEZ and high sea<li>0.5 million records curated</ul>                                                                                                       | Peter Woollard, Stéphane Pesant, Lili Meszaros | WoRMS                                 |
| BiCIKL                              | <ul><li>Expanding on metadata available mostly for sequences  <li>Updating taxonomic identifications of sequence data, deriving from the Unite pipelines</li>  <li>Potential for further updates (e.g. specimen voucher info) coming from other groups (e.g. Museums)</ul> | Joana Pauperio                | PlutoF                                |
| MGnify                              | <li>Expanding on metadata from literature Assignment of biomes via machine learning? TBC                                                                                                                                                                                      | Josephine Burgin                |                                       |
| DToL (Darwin Tree of Life Project)                                   | <li>None yet - considering using Clearinghouse to add quality scores to assemblies                                                                                                                                                                                                 | Josephine Burgin, Joana Pauperio          | Sanger                                |


<br>

## Making use of the Extra Annotation in Clearinghouse

If annotation is on ENA record objects like the sample identifier, the annotation automatically becomes visible in the ENA browser.

Figure: screenshots of Clearinghouse annotations in ENA browser a) The EEZ-name derived from the latitude and longitude b) Pathogen annotation? (TBD by Zahra Waheed )
![The EEZ-name derived from the latitude and longitude](./Image_Biosample_3rdPartyCuration.png)

## Programmatic Querying of Clearinghouse

The SWAGGER API to the Clearinghouse allows one to do many types of query programmatically, and particularly see the documentation PDF. 
E.G. you could query using a Biosamples ID (this is what ENA uses for samples too) to see what extra annotation exists.
E.G. querying for all records that have a particular geographic annotation. 

No account is needed for read access of the Clearinghouse API.
Obviously if you are querying ENA objects then it may be useful to first query ENA programmatic API. Tip: the ENA advanced search is often useful in creating the queries needed for the ENA API. 
Programmatic Submission to Clearinghouse

Think carefully about what you want to do and why. Also decide which ENA record object do you wish to annotate, to date much of the extra annotations have been to the bio-sample id.

See the SWAGGER API documentation for the technical details.

Essentially:
* Register for  either an AAP or LifeScience ID, if you don’t already have one. Suggest that you get credentials for both test and production
* Generate a bearer token 
* For some test records generate JSON conforming to the Clearinghouse JSON format 
* Test submitting to these to the test instance of the Clearinghouse 
* Examine retrieving those from the test instance of the Clearinghouse 
* Generate JSON annotations conforming to the Clearinghouse JSON format for all the records:
* Submit these to the production instance of the Clearinghouse 
* Log and examine the logs for an error and resubmit if necessary. (tip: in my submission scripts,  the small percentage of failures were timeouts, so I did a try/exception, wait and retry automatically in the submission scripts.)
* Examine retrieving a selection of those from the production instance of the Clearinghouse

## How is using the Clearinghouse Different from Updating Records in ENA or Biosamples?

It is important to differentiate between the curations submitted via the ELIXIR Clearinghouse and ENA-based metadata updates. 

<li>An ENA/Biosamples record update modifies the original public record, while a curation submitted to the Clearinghouse presents alongside the original record instead

<li>Only the original submitter of an ENA/Biosample record can update this directly, while curations for a particular record can be submitted to the Clearinghouse by *any user* (as long as sufficient evidence is provided for how that curation was generated)

<li>An ENA/Biosamples record update requires Webin authentication, while curation submission/modification requires either AAP or LifeScience ID authentication instead
 
<li>As ENA/Biosamples record updates modify the original record, the modifications will appear in EBI-based data portals (such as the Pathogens Portal, Early Cause, COVID-19 Data Portal) and be exchanged with other INSDC nodes. Curations submitted via Clearinghouse only present in the ENA browser and do not feed into other INSDC sites nor data portals.


## The Link between Biosamples & ENA
BioSamples stores and supplies descriptions and metadata about biological samples used in research and development by academia and industry. 

When new samples are submitted to ENA, the samples will be automatically registered with BioSamples and a BioSamples ID generated for each sample. The BioSamples will store the core subset of the sample related metadata. Extra sample related metadata will be stored elsewhere in ENA. When you query ENA you will be able to search across the core and many of the other metadata fields.

A key reason for BioSamples and not ENA being the primary store of sequence related samples is that increasing other types of ‘omics or imaging are also performed on the same sample. One can thus be able to unambiguously access different types of experimental readout on the same samples. 





## Appendix:
### 1. [A template bash script for submission](clearinghouse_submission_template.sh)

