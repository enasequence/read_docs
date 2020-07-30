==========================================================
How to Search for Cross References in ENA Programmatically
==========================================================

The `ENA Xref service <https://www.ebi.ac.uk/ena/browser/xref>`_ holds cross-references to a number of external data
resources linked to ENA records.

The update and frequency of each source is dependent on their own release cycle and/or internal processes,
with ENA supporting updates as frequently as once a week.

These cross-references can be explored programmatically using the
`Xref API <https://www.ebi.ac.uk/ena/xref/rest/>`_ which is documented with a Swagger interface.

This guide is not extensive and is designed to introduce you to some example uses for the Xref API which can be used
as a platform for you to explore the API and service further.

Most of these examples use the 'tsv' format result but this can be swapped for 'json' if that is preferable.

Display List of All Cross Reference Sources
===========================================

To get a good overview of what is included in the cross-reference service. You can first access the full list of
cross-reference 'Sources' registered with ENA. These sources are the external data resources which are linked to
ENA records. You can use the following endpoints to do this:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/xref/rest/tsv/source
   https://www.ebi.ac.uk/ena/xref/rest/json/source


**First 10 resulting cross-reference Sources as a TSV:**

.. code-block:: bash

   Source	Description
   ArrayExpress	ArrayExpress experiment
   BCCM/LMBP	BCCM/LMBP Plasmid Collection
   BlobToolKit	BlobToolKit: Toolkit for genome assembly QC
   CABRI	CABRI
   CCAP	Culture Collection of Algae and Protozoa
   Citation	Citation
   COMPARE-RefGenome	Reference Genome as provided by COMPARE
   dictyBase	Dictyostelid genomics
   Ensembl	Genome (EnsEMBL)
   Ensembl-Gn	EnsEMBL Genes

   continued....


**First 2 resulting cross-reference Sources in JSON:**

.. code-block:: bash

   [ {
     "Description" : "ArrayExpress experiment",
     "HomePage" : "https://www.ebi.ac.uk/arrayexpress/",
     "LastUpdated" : "2020-01-11 05:01:04.066495",
     "Source" : "ArrayExpress"
   }, {
     "Description" : "BCCM/LMBP Plasmid Collection",
     "HomePage" : "http://www.genecorner.ugent.be/",
     "LastUpdated" : "2017-06-03 18:19:30.764629",
     "Source" : "BCCM/LMBP"
   }, {

   continued....


In the above example, the TSV provides more direct readability but the JSON format provides additional
information on the date the cross-references for that Source were most recently updated. It can be worth exploring
both the 'tsv' and 'json' endpoints available before deciding what is most useful for your particular use-case.

In addition to providing an overview of the cross-reference service, this endpoint is useful for determining the Source
name for any sources you may want to explore further.

Look up Cross References for a Source
=====================================

Once you have determined what Source you would like to search for, you can perform a search against this Source. For
example, to fetch records that have a cross-reference registered with MGnify (EMBL-EBI's metagenomic data analysis
service), you could look up the following:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/xref/rest/tsv/search?source=MGnify&limit=100


This results in a tsv of all records that have a cross-reference with MGnify. The cross-reference service provides
the url to the cross-reference source (in this case MGnify's website) as well as the record in ENA.

This example is limited to 100 records. By using the 'limit' and 'offset' options, you can retrieve the data in batches.
By default the limit is set to 100,000 records. You can set the limit to 0 to fetch all the records.

Narrow Down a Search By Target Record Type
------------------------------------------

You can narrow down cross-reference searches further to only return records of a certain Type. For example, you may want to
search specifically for sample records which are linked to the MGnify service.

Firstly, you may want to determine what Targets are available and how they are named. To list the full list of
Target options and Target names, you can use the following endpoint:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/xref/rest/tsv/target


**Result:**

.. code-block:: bash

   Target	Description
   analysis	Nucleotide sequence analyses
   assembly	Genome assemblies
   coding	Assembled and annotated protein-coding sequences
   experiment	Read domain experiments
   noncoding	Assembled and annotated non-coding sequences
   run	Read domain runs
   sample	Samples
   sequence	Assembled and annotated nucleotide sequences
   study	Studies
   taxon	NCBI Taxonomy
   trace	Capillary traces in Trace Archive
   wgsmaster	WGS and TSA masters


Here we can see that Samples are determined by the target 'sample'. Now, you can narrow down your previous search:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/xref/rest/tsv/search?source=MGnify&target=sample&limit=100


Look up Cross References for a Record
=====================================

As opposed to looking for cross-references by the registered service, you may want to look up all cross-references
for a particular ENA Record. To do this, you can also perform a cross-reference search using an INSDC accession:

.. code-block:: bash

   https://www.ebi.ac.uk/ena/xref/rest/tsv/search?accession=AY772730


**Result:**

.. code-block:: bash

   Source	Source primary accession	Source secondary accession	Source url	Target	Target primary accession	Target secondary accession	Target url
   COMPARE-RefGenome	NLV/GII/Neustrelitz260/2000/DE			sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC1393082	16517856	http://europepmc.org/abstract/PMC/PMC1393082	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC1594604	16891526	http://europepmc.org/abstract/PMC/PMC1594604	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC2828081	17953089	http://europepmc.org/abstract/PMC/PMC2828081	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC2897520	20484606	http://europepmc.org/abstract/PMC/PMC2897520	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC2919043	20554772	http://europepmc.org/abstract/PMC/PMC2919043	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC3096948	21524296	http://europepmc.org/abstract/PMC/PMC3096948	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC3110387	21686127	http://europepmc.org/abstract/PMC/PMC3110387	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC3187498	21849454	http://europepmc.org/abstract/PMC/PMC3187498	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC3367634	16485473	http://europepmc.org/abstract/PMC/PMC3367634	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC3493335	22943503	http://europepmc.org/abstract/PMC/PMC3493335	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC3695492	23630317	http://europepmc.org/abstract/PMC/PMC3695492	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC4298492	24989606	http://europepmc.org/abstract/PMC/PMC4298492	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC5388089	28181902	http://europepmc.org/abstract/PMC/PMC5388089	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC5746213	29284004	http://europepmc.org/abstract/PMC/PMC5746213	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC5874246	29593246	http://europepmc.org/abstract/PMC/PMC5874246	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC5911914	25946552	http://europepmc.org/abstract/PMC/PMC5911914	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC6160709	29992776	http://europepmc.org/abstract/PMC/PMC6160709	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC6511519	30531093	http://europepmc.org/abstract/PMC/PMC6511519	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC7011714	31483239	http://europepmc.org/abstract/PMC/PMC7011714	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC7160966	32322405	http://europepmc.org/abstract/PMC/PMC7160966	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730
   EuropePMC	PMC7165577	16629981	http://europepmc.org/abstract/PMC/PMC7165577	sequence	AY772730		https://www.ebi.ac.uk/ena/browser/view/AY772730


Expanding metadata
------------------

In some cases, the cross-reference registered may have additional metadata. For example, cross-references registered
with the source COMPARE-RefGenome.

To view this, add "expanded=true":

.. code-block:: bash

   https://www.ebi.ac.uk/ena/xref/rest/tsv/search?source=COMPARE-RefGenome&accession=AY772730&expanded=true


**Result:**

.. code-block:: bash

   Source	Source primary accession	Source secondary accession	Source url	Target	Target primary accession	Target secondary accession	Target url	Family	Genus	species	1st below- species level	2nd below- species level	3rd below-species level	Aggregated taxonomic name	genome
   COMPARE-RefGenome	NLV/GII/Neustrelitz260/2000/DE			sequence	AY772730		https://www.ebi.ac.uk/ena/data/view/AY772730	Caliciviridae	norovirus	GII	P15, 16			NoV/GII.P16/GII.16	complete

