# Taxonomic Classifications for Your Samples

## The Tax Database

Every ENA sample object should have a taxonomic classification. The INSDC maintains a database of all unique taxonomic classifications known to us and you should apply one from this database when you create your samples. Each classification has a unique id and this is expanded to show the scientific name and common name of the organism when the sample is viewed.

The [interactive submission service](https://www.ebi.ac.uk/ena/submit/sra/#home) has a look up table which you can use before you download the spreadsheet template so that you already know what taxonomy identifications to apply when you are creating your samples offline (step 8 in <a href="mod_01.html">module 1</a>). There is also a look up <a href="https://www.ebi.ac.uk/ena/data/warehouse/search?portal=taxon">here</a>, in the taxon domain of the ENA advanced search.

![webin_tax_look_up](images/tips_p01.png)

Submitters using REST API will apply the taxonomic information to the sample object using the sample_name block

```xml
    <SAMPLE_NAME>
      <TAXON_ID>450267</TAXON_ID>
      <SCIENTIFIC_NAME>Chlamyphorus truncatus</SCIENTIFIC_NAME>
      <COMMON_NAME>Pink fairy armadillo</COMMON_NAME>
    </SAMPLE_NAME>
```


## REST Access to the Tax Database

Submitters using the REST API to programmatically submit samples in XML format can use the taxonomy database look up to find what tax ID they need to apply to their sample using these REST endpoints:

If you know the scientific name of the organism you can find the taxonomy ID with this endpoint `www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/scientific-name/`. Simply append the scientific name to the URL. You can use a browser or use cURL at the command line (the "see URL" program available on Linux and Mac). Note the use of `%20` to represent a space character. This is URL encoding and you may find the commands do not work unless you replace space characters with `%20`

```bash
> curl "http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/scientific-name/Leptonycteris%20nivalis"
[
  {
    "taxId": "59456",
    "scientificName": "Leptonycteris nivalis",
    "commonName": "Mexican long-nosed bat",
    "formalName": "true",
    "rank": "species",
    "division": "MAM",
    "lineage": "Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Mammalia; Eutheria; Laurasiatheria; Chiroptera; Microchiroptera; Phyllostomidae; Glossophaginae; Leptonycteris; ",
    "geneticCode": "1",
    "mitochondrialGeneticCode": "2",
    "submittable": "true"
  }
]
```

You can do the same with the common name. Use endpoint `http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/any-name/` and append the name

```bash
> curl "http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/any-name/golden%20arrow%20poison%20frog"
[
  {
    "taxId": "377316",
    "scientificName": "Atelopus zeteki",
    "commonName": "golden arrow poison frog",
    "formalName": "true",
    "rank": "species",
    "division": "VRT",
    "lineage": "Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Hyloidea; Bufonidae; Atelopus; ",
    "geneticCode": "1",
    "mitochondrialGeneticCode": "2",
    "submittable": "true"
  }
]
```

If you do not know the scientific name or the common name but you have an idea, you can use this *suggest* endpoint `http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/suggest-for-submission/`

```bash
> curl "http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/suggest-for-submission/curry"
[
  {
    "taxId": "159030",
    "scientificName": "Murraya koenigii",
    "displayName": "curry leaf"
  },
  {
    "taxId": "261786",
    "scientificName": "Helichrysum italicum",
    "displayName": "curry plant"
  }
]
```

In each case above a JSON document is outputted and you will be looking for the *taxId* field. Outputting JSON format will help you to automate the call if appropriate.

## Environmental Taxonomic Classifications

### Environmental Biome-Level Taxonomy 

Every sample object in ENA must have a taxonomic classification assigned to it. Environmental samples can not be described with a single organism identifier because they represent an environment with an unknown variety and number of organisms.

For this purpose there are entries in the Tax Database that apply exclusively to environmental samples. Taxa of this type can be immediately identified as they contain the term "metagenome" as part of the scientific name. These are searchable within the Tax Database using the same methods described above.

```bash
curl "www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/suggest-for-submission/marsupial%20meta"
[
  {
    "taxId": "1477400",
    "scientificName": "marsupial metagenome",
    "displayName": "marsupial metagenome"
  }
```

To view all environmental taxonomy available please visit [ENA tax portal](https://www.ebi.ac.uk/ena/data/view/Taxon:408169). Click on the *Tax tree* tab and click the '+' icons to expand the categories:

![metagenome](images/tax_p01.png)

 The metagenomic term that is used to describe the biome is also the scientific name of the chosen taxon and can be used to find the tax ID in the same methods described above. For example, you can find the tax ID for *termite fungus garden metagenome* here:
 `http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/scientific-name/termite fungus garden metagenome`.
 
 Please note that new metagenome taxonomic records are rarely added, particularly those that add granularity. Please use the closest available choice, even if this is a less granular option. Only request a new term if you are sure you are unable to use anything in the lists available.

### Environmental Organism-Level Taxonomy

If you are submitting sequences or assemblies that have been identified taxonomically from homology alone, with no culturing or isolation of the organism beforehand, then we also consider these as environmental samples. These samples should be registered with uncultured taxonomy to make it clear they were derived from an environmental source.

A typical use-case of this would be the submission of a single fully assembled genome from a mixed DNA sample (i.e., from a metagenomic source).  There are exceptions where this taxonomy should not be used: for example, organisms which can be reliably recovered from their diseased host (e.g., endosymbionts, phyoplasmas) and organisms from samples which are readily identifiable by other means (e.g., cyanobacteria); organisms such as these are not considered uncultured/environmental in the way described here. If you are unsure whether your sample should be registered as environmental, contact datasubs@ebi.ac.uk for assistance.

Environmental organism-level taxa are usually prefixed with the term uncultured and are not allowed to have a species epithet. Some examples of basic organism names that can be used include:

    uncultured bacterium  (taxid:77133)
    uncultured archaeon  (taxid:115547)
    uncultured cyanobacterium  (taxid:1211)
    uncultured prokaryote  (taxid:198431)
    uncultured fungus  (taxid:175245)
    uncultured eukaryote  (taxid:100272)

Where possible, you should register your samples with the most granular identification possible, up to Genus level. For example, for prokaryotes, the format is:

uncultured \<Rank\> sp.

    e.g. uncultured Bacillus sp.
    e.g. uncultured Thermococcus sp.

 For Fungi, the ‘sp.’ is dropped:

uncultured \<Rank\>

    e.g., uncultured Glomus
    e.g., uncultured Saccharomycetes

When registering samples that use uncultured taxonomy, a general environmental record should also be registered to describe the biome that was originally sequenced. This biome-level environmental sample should also be referenced within the organism-level sample using the "sample derived from" attribute.
