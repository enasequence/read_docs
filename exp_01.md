# Specific Standards: RNA-Seq experiments and runs

<!-- ERX012205 -->

Metadata is vital to ensure discoverability and reuse of archival data by downstream resources. The DCA, Gene Expression and Ensembl teams have defined minimal metadata fields of information, and rules defining the use of these fields, relating to RNA-Seq samples (e.g. species, tissue), experiments (e.g. sequencing platform, method, strandedness, etc.) and alignment process (e.g. alignment method, cut-offs, mapping quality scores, pair mapping statistics, etc.). 

### RNA-Seq Experiment attributes to include in your experiment objects

For RNA-seq experiment objects the following fields are required. They do not need to be added as attributes because these fields already exist in the experiment schema in the `<DESIGN>` block

+ design description and/or library construction protocol.  
+ paired end or single
+ assay type: library strategy, source and selection

For example:

```xml
<DESIGN>
    <DESIGN_DESCRIPTION>Simultaneous RNA-seq of bone marrow derived dendritic cells from Mus
        Musculus C57BL/6 cocultured with Candida albicans strain SC5314 over a 2 hour infection time
        course</DESIGN_DESCRIPTION>
    <SAMPLE_DESCRIPTOR refname="60min_Rep1"/>  
    <LIBRARY_DESCRIPTOR>
        <LIBRARY_NAME>60min_Rep1</LIBRARY_NAME>
        <LIBRARY_STRATEGY>RNA-Seq</LIBRARY_STRATEGY>
        <LIBRARY_SOURCE>TRANSCRIPTOMIC</LIBRARY_SOURCE>
        <LIBRARY_SELECTION>size fractionation</LIBRARY_SELECTION>
        <LIBRARY_LAYOUT>
            <SINGLE/>
        </LIBRARY_LAYOUT>
        <LIBRARY_CONSTRUCTION_PROTOCOL>Candida albicans was grown in 1% yeast extract, 2% peptone,
            and 2% glucose and collected in the logarithmic growth. Dendritic cells were derived
            from C57BL/6 femur bone marrow in DMEM supplemented with 10% FCS, and 15 % GM-CSF.
            Dendritic cell and Candida albicans coculture at a target ratio of 1:1 Samples were
            incubated at 37C 5% CO2, 95% humidity between 0 and 120 min. We isolated total RNA from
            samples using the SV total RNA isolation system (Promega). Cells were scraped in the
            provided lysis buffer followed by homogenization with 0.5 mm acid washed glass beads.
            Extraction was performed following manufactures
            protocols.</LIBRARY_CONSTRUCTION_PROTOCOL>
    </LIBRARY_DESCRIPTOR>
</DESIGN>
```

For controlled vocabulary of restricted fields see the official <a href="ftp://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.experiment.xsd">schema</a>.

+ sequencing technology (instrument, platform). Found in the `<PLATFORM>` block.

For example:

```xml
<PLATFORM>
    <ILLUMINA>
        <INSTRUMENT_MODEL>Illumina Genome Analyzer IIx</INSTRUMENT_MODEL>
    </ILLUMINA>
</PLATFORM>
```

The following fields do not exist in the original schema so you should add them as experiment attributes instead.

+ stranded or not
+ if the Pac Bio IsoSeq machine is used, method of collapsing reads
  * can be 3’ capping or 3’ and 5’ capping 

```xml
<EXPERIMENT_ATTRIBUTES>
    <EXPERIMENT_ATTRIBUTE>
        <TAG>stranded</TAG>
        <VALUE>[true|false]</VALUE>
    </EXPERIMENT_ATTRIBUTE>
    <EXPERIMENT_ATTRIBUTE>
        <TAG>IsoSeq: method of collapsing reads</TAG>
        <VALUE>[3’ capping | 3’ and 5’ capping]</VALUE>
    </EXPERIMENT_ATTRIBUTE>
</EXPERIMENT_ATTRIBUTES>
```

+ read length 

For some platforms like Illumina, the read length is not variable and it is built in to the mechanics and chemistry of the platform. If available the read length is added as part the `<SPOT_LENGTH>` tag. 

```xml
<SPOT_LENGTH>36</SPOT_LENGTH>
```

This tag is in the `<SPOT_DESCRIPTOR>` block. If you have added this yourself you can include the spot length to it but in most cases submitted files are stripped of all technical elements and a basic spot descriptor is added automatically. In this case the spot length is applied automatically after the submission when the corresponding read file is parsed and had its statistics calculated. For platforms producing variable length reads then no spot length is applied. 

+ RNA fraction

```xml
<EXPERIMENT_ATTRIBUTES>
    <EXPERIMENT_ATTRIBUTE>
        <TAG>RNA Fraction</TAG>
        <VALUE>total chromatin</VALUE>
    </EXPERIMENT_ATTRIBUTE>
</EXPERIMENT_ATTRIBUTES>
```

Declaring the RNA fractions can also be useful for interpreting results. This field can be applied as tag-value attribute.



### RNA-Seq Run attributes to include in your run objects

For RNA-seq runs it is worth having these fields present:

+ number of reads in file
+ sequencing date
+ sequencing location latitude/longitude

The number of reads in each read file is automatically calculated from your submitted files and added to the live version of the run object in the ENA. The ENA can not parse all file types so you can still add these fields as attributes in case the ENA can not reflect the original submitted file precisely how you would expect it to.

For example:

```xml
<RUN_ATTRIBUTES>
    <RUN_ATTRIBUTE>
        <TAG>read count</TAG>
        <VALUE>500000</VALUE>
    </RUN_ATTRIBUTE> 
</RUN_ATTRIBUTES>
```

An attribute for sequencing date already exists in the schema for the run object. The attribute is called **run_date** and it is part of the main `<RUN>` tag. It uses xs:dateTime format. Also use **run_centre** attribute. If the sequencing was outsourced and is different from the **center_name** used in the study and sample objects then this should be clear but if it was not outsourced and the run centre is identical to the study centre it is still worth making that clear.

For example:

```xml
<RUN alias="60min_Rep1" run_center="EBI"  run_date="2002-05-30T09:00:00">
```

Finally, the exact coordinates of the sequencing centre can reveal a lot more than a sequencing centre acronym so this is recommended too. Apply it as a run attribute:

```xml
<RUN_ATTRIBUTE>
   <TAG>sequencing location latitude/longitude</TAG>
   <VALUE>52.08,0.19</VALUE>
</RUN_ATTRIBUTE> 
```
