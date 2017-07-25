# Taxonomic classifications for your samples

**under construction**

## The Tax database

Every ENA sample object should have a taxonomic classification. The INSDC maintains a database of all unique taxonomy classifications known to us and you should apply one from this database when you create your samples. Each classification has a unique id and this is expanded to show the scientific name and common name of the organism when the sample is viewed.

The [interactive submission service](https://www.ebi.ac.uk/ena/submit/sra/#home) has a look up table which you can use before you download the spreadsheet template so that you already know what taxonomy identifications to apply when you are creating your samples offline.

![webin_tax_look_up](images/tips_p01.png)

Submitters using REST API will apply the taxonomic information to the sample object using the sample_name block

```xml
    <SAMPLE_NAME>
      <TAXON_ID>450267</TAXON_ID>
      <SCIENTIFIC_NAME>Chlamyphorus truncatus</SCIENTIFIC_NAME>
      <COMMON_NAME>Pink fairy armadillo</COMMON_NAME>
    </SAMPLE_NAME>
```


## REST access to the tax database

Submitters using the REST API to programmatically submit samples in XML format can use the taxonomy database look up to find what tax id they need to apply to their sample using these REST endpoints:

1. If you know the scientific name of the organism you can find the taxonomy id with this endpoint `www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/scientific-name/`. Simply append the scientific name to the URL. You can use a browser or use cURL at the command line (the "see URL" program available on Linux and Mac). 

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

2. You can do the same with the common name. Use endpoint `http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/any-name/` and append the name

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

3. If you do not know the scientific name or the common name but you have an idea, you can use this *suggest* endpoint `http://www.ebi.ac.uk/ena/data/taxonomy/v1/taxon/suggest-for-submission/`

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

## Environmental taxonomic classifications

<div style="height:300px;width:500px;border:1px solid;overflow:auto;">
Generic

     metagenome

     synthetic metagenome

     ecological metagenomes

     organismal metagenomes


Specific

ecological metagenomes sub nodes 

    activated carbon metagenome
    activated sludge metagenome
    aerosol metagenome
    air metagenome
    alkali sediment metagenome
    anaerobic digester metagenome
    anchialine metagenome
    ant fungus garden metagenome
    aquatic metagenome
    aquifer metagenome
    ballast water metagenome
    beach sand metagenome
    bioanode metagenome
    biocathode metagenome
    biofilm metagenome
    biofilter metagenome
    biofloc metagenome
    biogas fermenter metagenome
    bioreactor metagenome
    bioreactor sludge metagenome
    biosolids metagenome
    cave metagenome
    clinical metagenome
    cloud metagenome
    coal metagenome
    cold seep metagenome
    compost metagenome
    concrete metagenome
    coral reef metagenome
    cow dung metagenome
    crude oil metagenome
    decomposition metagenome
    dietary supplements metagenome
    dust metagenome
    electrolysis cell metagenome
    estuary metagenome
    fermentation metagenome
    fertilizer metagenome
    floral nectar metagenome
    flotsam metagenome
    food contamination metagenome
    food fermentation metagenome
    food metagenome
    food production metagenome
    freshwater metagenome
    freshwater sediment metagenome
    fuel tank metagenome
    gas well metagenome
    glacier lake metagenome
    glacier metagenome
    groundwater metagenome
    halite metagenome
    herbal medicine metagenome
    honey metagenome
    hospital metagenome
    hot springs metagenome
    HVAC metagenome
    hydrocarbon metagenome
    hydrothermal vent metagenome
    hypersaline lake metagenome
    hyphosphere metagenome
    hypolithon metagenome
    ice metagenome
    indoor metagenome
    industrial waste metagenome
    interstitial water metagenome
    lagoon metagenome
    lake water metagenome
    landfill metagenome
    leaf litter metagenome
    lichen crust metagenome
    lobster shelll metagenome
    mangrove metagenome
    manure metagenome
    marine metagenome
    marine plankton metagenome
    marine sediment metagenome
    metal metagenome
    microbial fuel cell metagenome
    microbial mat metagenome
    milk metagenome
    mine drainage metagenome
    mine tailings metagenome
    mixed culture metagenome
    money metagenome
    moonmilk metagenome
    mud volcano metagenome
    museum specimen metagenome
    musk metagenome
    neuston metagenome
    oasis metagenome
    oil field metagenome
    oil metagenome
    oil production facility metagenome
    oil sands metagenome
    outdoor metagenome
    paper pulp metagenome
    parchment metagenome
    peat metagenome
    periphyton metagenome
    permafrost metagenome
    phytotelma metagenome
    pitcher plant inquiline metagenome
    plastisphere metagenome
    pond metagenome
    poultry litter metagenome
    power plant metagenome
    probiotic metagenome
    retting metagenome
    rhizoplane metagenome
    rhizosphere metagenome
    rice paddy metagenome
    riverine metagenome
    rock metagenome
    rock porewater metagenome
    root associated fungus metagenome
    saline spring metagenome
    salt lake metagenome
    salt marsh metagenome
    salt mine metagenome
    saltern metagenome
    sand metagenome
    seawater metagenome
    sediment metagenome
    shale gas metegenome
    silage metagenome
    sludge metagenome
    snow metagenome
    snowblower vent metagenome
    soda lake metagenome
    soil crust metagenome
    soil metagenome
    solid waste metagenome
    steel metagenome
    stromatolite metagenome
    subsurface metagenome
    surface metagenome
    tar pit metagenome
    termitarium metagenome
    termite fungus garden metagenome
    terrestrial metagenome
    tidal flat metagenome
    tin mine metagenome
    tobacco metagenome
    tomb wall metagenome
    urban metagenome
    wastewater metagenome
    wetland metagenome
    whale fall metagenome
    wine metagenome
    wood decay metagenome

organismal metagenomes sub nodes

    algae metagenome
    annelid metagenome
    ant metagenome
    aquatic viral metagenome
    bat metagenome
    bear gut metagenome
    beetle metagenome
    bird metagenome
    blood metagenome
    bovine gut metagenome
    bovine metagenome
    cetacean metagenome
    chicken gut metagenome
    ciliate metagenome
    coral metagenome
    crab metagenome
    crustacean metagenome
    ctenophore metagenome
    dinoflagellate metagenome
    ear metagenome
    echinoderm metagenome
    endophyte metagenome
    epibiont metagenome
    eye metagenome
    feces metagenome
    feline metagenome
    fish gut metagenome
    fish metagenome
    flower metagenome
    fossil metagenome
    frog metagenome
    fungus metagenome
    gill metagenome
    gonad metagenome
    grain metagenome
    grasshopper gut metagenome
    gut metagenome
    honeybee metagenome
    human bile metagenome
    human blood metagenome
    human brain metagenome
    human eye metagenome
    human gut metagenome
    human gut metagenome gcode 4
    human lung metagenome
    human metagenome
    human milk metagenome
    human nasopharyngeal metagenome
    human oral metagenome
    human reproductive system metagenome
    human saliva metagenome
    human semen metagenome
    human skeleton metagenome
    human skin metagenome
    human tracheal metagenome
    human vaginal metagenome
    hydrozoan metagenome
    insect gut metagenome
    insect metagenome
    invertebrate gut metagenome
    invertebrate metagenome
    jellyfish metagenome
    koala metagenome
    leaf metagenome
    lichen metagenome
    liver metagenome
    lung metagenome
    marsupial metagenome
    mite metagenome
    mollusc metagenome
    mosquito metagenome
    moss metagenome
    mouse gut metagenome
    mouse metagenome
    mouse skin metagenome
    nematode metagenome
    oral metagenome
    oral-nasopharyngeal metagenome
    ovine metagenome
    oyster metagenome
    parasite metagenome
    phage metagenome
    phyllosphere metagenome
    pig gut metagenome
    pig metagenome
    placenta metagenome
    plant metagenome
    pollen metagenome
    primate metagenome
    psyllid metagenome
    rat gut metagenome
    rat metagenome
    reproductive system metagenome
    respiratory tract metagenome
    rodent metagenome
    root metagenome
    scorpion gut metagenome
    sea anemone metagenome
    sea squirt metagenome
    sea urchin metagenome
    seagrass metagenome
    seed metagenome
    sheep gut metagenome
    sheep metagenome
    shoot metagenome
    shrimp gut metagenome
    skin metagenome
    snake metagenome
    spider metagenome
    sponge metagenome
    stomach metagenome
    symbiont metagenome
    termite gut metagenome
    termite metagenome
    tick metagenome
    upper respiratory tract metagenome
    urine metagenome
    urogenital metagenome
    vaginal metagenome
    viral metagenome
    wallaby gut metagenome
    wasp metagenome
    zebrafish metagenome

</div>
