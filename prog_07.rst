# Module 7: Submit sequence reads
*********************************

The Experiment and Run Objects
==============================

Sequence read data is submitted using experiment and run XMLs.

Just like a sample object represents the source material that is sequenced, 
an experiment object represents the library solution that is created from the sample 
and set up to run on a sequencing instrument. Thus the experiment object contains 
details about sequencing platform and library protocols. 

A run object is used to submit read data files to the archive and can be thought to 
represent a lane on an sequencing machine, or in case of pooled samples, represent the 
demultiplexed reads for one sample.

The experiment XML format is defined by `SRA.experiment.xsd <ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.experiment.xsd>`_
XML Schema, and the run XML format is defined by `SRA.run.xsd <ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.run.xsd>`_
XML Schema.


The XML schemas define the structure of the XMLs and provide controlled vocabularies for many elements. 
For example `LIBRARY_STRATEGY` and `PLATFORM` element values are restricted by enumerations defined in
the schemas.

.. image:: images/webin_data_model_read.png
  
Relationships between objects
==============================

Both the run and experiment are associated with other objects.
 
It is common to create many libraries for a single source sample. An experiment points to a sample 
to allow us to record this relationship between experiments and samples.

It is also common to have multiple lanes for a single experiment. A run points to an experiment 
to allow us to record this relationship between the objects.

This model allows:

1. one or more runs in one experiment
2. one or more experiments in one study (by this rule, multiple runs and samples may also occur in one study)
3. one or more experiments for one sample (by this rule, one sample can exist in multiple studies)

A run points to the experiment it is part of using the `<EXPERIMENT_REF>` element.

An experiment points to the study it is part of using the `<STUDY_REF>` element.
Additionally, an experiment is linked to the sample object representing the sequenced source material 
through the `<SAMPLE_DESCRIPTOR>` element. This means that the study and sample objects are connected 
to each other via the experiment object. 

A run can point to an experiment by using either an accession:

```
<EXPERIMENT_REF accession="ERX123456"/>`
```

or a name within the submitter's account:
 
```
<EXPERIMENT_REF refname="exp_mantis_religiosa"/>`
```

Above, the `refname` refers to the submitter provided name (alias) of the experiment. 

If the experiment is being created in the same submission as the run then the `accession` attribute can't be used 
as an experiment accession has not been assigned yet. Had the experiment been submitted
previously then the `accession` attribute could have been used. When referring to experiments in other
submission accounts the `accession` attribute must be used as names can be ambiguous between
submitters.

Same principles with `refname` and `accession` attributes apply to all references between objects
including experiment references to studies and samples.  

Metadata standards
==================

The ENA is involved with minimum information standards for various project collaborations and sequencing 
fields. Even if you are not a member of one of these you can still use them as a guideline for increasing 
the quality of annotation of your experiment (and run) objects towards more interpretable and reproducible
publications.

.. toctree::
   :maxdepth: 3

   exp_01

Supported data formats
======================

Please refer to `Supported read data formats <format_01.html>`_.

Upload data files
=================

Data files must exist in your Webin upload area at the time when a run XML is being submitted. Once the
run XML has been submitted the data files will be moved from the Webin upload area into the archive.

You can upload the data file to the root directory of your Webin upload area or you can create directories
and upload the files there. If the files are uploaded to the root directory then simply use the file names 
without any prefix. 

Instructions on how to upload files to the Webin upload areas can be found
`here <http://www.ebi.ac.uk/ena/about/sra_data_upload>`_.

Create the Run and Experiment XML
=================================

Below is an example of an Illumina HiSeq 2000 experiment sequence reads being submitted in Fastq format.

The experiment is pointing to a pre-registered sample using the sample’s accession and to a 
pre-registered study using the study's accession. 

The run is being submitted at the same time as the experiment and must point to the experiment
it belongs to using the experiment's alias. 

Experiment XML:

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <EXPERIMENT_SET>
       <EXPERIMENT alias="exp_mantis_religiosa">
           <TITLE>The 1KITE project: evolution of insects</TITLE>
           <STUDY_REF accession="SRP017801"/>
           <DESIGN>
               <DESIGN_DESCRIPTION/>
               <SAMPLE_DESCRIPTOR accession="SRS462875"/>
               <LIBRARY_DESCRIPTOR>
                   <LIBRARY_NAME/>
                   <LIBRARY_STRATEGY>RNA-Seq</LIBRARY_STRATEGY>
                   <LIBRARY_SOURCE>TRANSCRIPTOMIC</LIBRARY_SOURCE>
                   <LIBRARY_SELECTION>cDNA</LIBRARY_SELECTION>
                   <LIBRARY_LAYOUT>
                       <PAIRED NOMINAL_LENGTH="250" NOMINAL_SDEV="30"/>
                   </LIBRARY_LAYOUT>
                   <LIBRARY_CONSTRUCTION_PROTOCOL>Messenger RNA (mRNA) was isolated using the Dynabeads mRNA Purification Kit (Invitrogen, Carlsbad Ca. USA) and then sheared using divalent cations at 72*C. These cleaved RNA fragments were transcribed into first-strand cDNA using II Reverse Transcriptase (Invitrogen, Carlsbad Ca. USA) and N6 primer (IDT). The second-strand cDNA was subsequently synthesized using RNase H (Invitrogen, Carlsbad Ca. USA) and DNA polymerase I (Invitrogen, Shanghai China). The double-stranded cDNA then underwent end-repair, a single `A? base addition, adapter ligati on, and size selection on anagarose gel (250 * 20 bp). At last, the product was indexed and PCR amplified to finalize the library prepration for the paired-end cDNA.</LIBRARY_CONSTRUCTION_PROTOCOL>
                  </LIBRARY_DESCRIPTOR>
           </DESIGN>
           <PLATFORM>
               <ILLUMINA>
                   <INSTRUMENT_MODEL>Illumina HiSeq 2000</INSTRUMENT_MODEL>
               </ILLUMINA>
           </PLATFORM>
           <EXPERIMENT_ATTRIBUTES>
               <EXPERIMENT_ATTRIBUTE>
                   <TAG>library preparation date</TAG>
                   <VALUE>2010-08</VALUE>
               </EXPERIMENT_ATTRIBUTE>
           </EXPERIMENT_ATTRIBUTES>
       </EXPERIMENT>
    </EXPERIMENT_SET>

Run XML:

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <RUN_SET>
        <RUN alias="run_mantis_religiosa" center_name="">
            <EXPERIMENT_REF refname="exp_run_mantis_religiosa"/>
            <DATA_BLOCK>
                <FILES>
                    <FILE filename="mantis_religiosa_R1.fastq.gz" filetype="fastq"
                        checksum_method="MD5" checksum="9b8932f85caa54e687eba62fca3edce2"/>
                    <FILE filename="antis_religiosa_R2.fastq.gz" filetype="fastq"
                        checksum_method="MD5" checksum="183d6a24e0c3704e993bebe75bbbd989"/>
                </FILES>
            </DATA_BLOCK>
        </RUN>
    </RUN_SET>

You can submit several experiments and runs at the same time by using multiple 
`<EXPERIMENT></EXPERIMENT>` and `<RUN></RUN>` blocks.

Experiment XML:

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <EXPERIMENT_SET>
     <EXPERIMENT alias="exp_01">
     ...
     ...
     </EXPERIMENT>
     <EXPERIMENT alias="exp_02">
     ...
     ...
     </EXPERIMENT>
    </EXPERIMENT_SET>

Run XML:

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <RUN_SET>
     <RUN alias="run_01">
       <EXPERIMENT_REF refname="exp_01"/>
         <DATA_BLOCK>
         ...
         ...
         </DATA_BLOCK>
     </RUN>
     ...
     <RUN alias="run_05">
       <EXPERIMENT_REF refname="exp_01"/>
         <DATA_BLOCK>
         ...
         ...
         </DATA_BLOCK>
     </RUN>
    </RUN_SET>


Change the XMLs by entering your own information and save it in two files, for example `experiment.xml` and `run.xml`.

Change the value of `alias` to be a unique name. You will need the unique name for example to refer to your 
experiment when adding run objects to it. An alias can be a short acronym but it should be meaningful 
and memorable in some way.

The `<FILES>` block in the run XML references the data files that are being submitted as
part of the run.

To check the integrity of the file transfer an md5 checksum must be provided for each file. 
You can provide this by using the `checksum_method="MD5"` and `checksum=""` attributes in the `<FILE>` element, 
or you can provide the MD5 checksum in file `<file>.md5` in the same folder as the corresponding data
file `<file>`. 

Experiment XML: library information
-----------------------------------

The experiment contains a `<LIBRARY_DESCRIPTOR>` block in order to capture
basic library information within the `<LIBRARY_STRATEGY>`, `<LIBRARY_SOURCE>` and `<LIBRARY_SELECTION>`
elements.

.. code-block:: xml

    ...
    <LIBRARY_DESCRIPTOR>
         <LIBRARY_NAME/>
         <LIBRARY_STRATEGY>RNA-Seq</LIBRARY_STRATEGY>
         <LIBRARY_SOURCE>TRANSCRIPTOMIC</LIBRARY_SOURCE>
         <LIBRARY_SELECTION>cDNA</LIBRARY_SELECTION>
         <LIBRARY_LAYOUT>
             <PAIRED NOMINAL_LENGTH="250"  NOMINAL_SDEV="30"/>
         </LIBRARY_LAYOUT>
         <LIBRARY_CONSTRUCTION_PROTOCOL>Messenger RNA (mRNA) was isolated using the Dynabeads mRNA Purification Kit (Invitrogen, Carlsbad Ca. USA) and then sheared using divalent cations at 72*C. These cleaved RNA fragments were transcribed into first-strand cDNA using SuperScript?II Reverse Transcriptase (Invitrogen, Carlsbad Ca. USA) and N6 primer (IDT). The second-strand cDNA was subsequently synthesized using RNase H (Invitrogen, Carlsbad Ca. USA) and DNA polymerase I (Invitrogen, Shanghai China). The double-stranded cDNA then underwent end-repair, a single `A? base addition, adapter ligation, and size selection on anagarose gel (250 * 20 bp). At last, the product was indexed and PCR amplified to finalize the library prepration for the paired-end cDNA.
         </LIBRARY_CONSTRUCTION_PROTOCOL>
     </LIBRARY_DESCRIPTOR>
    ...

Experiment XML: paired ended reads
-----------------------------------

In experiment XML, the `<LIBRARY_LAYOUT>` element within the `<LIBRARY_DESCRIPTOR>` 
differentiates between single and paired ended reads. In the Experiment XML fragment
below, we have described a paired ended experiment using the `<PAIRED>` element:

.. code-block:: xml

    ...
    <LIBRARY_LAYOUT>
        <PAIRED NOMINAL_LENGTH="250" NOMINAL_SDEV="30"/>
    </LIBRARY_LAYOUT>
    ...

The attribute `PAIRED NOMINAL_LENGTH` is the average insert size. 
It is not the length of the reads. It is the average size of the fragments that are being sequenced. 

The attribute `NOMINAL_SDEV` is the standard deviation of the fragment lengths. This attribute
is not mandatory so you can omit it if you do not have this detail.

Experiment XML: single ended reads
-----------------------------------

In the Experiment XML fragment below, we have described a 
single ended experiment using the `<SINGLE>` element:

.. code-block:: xml

    ...
    <LIBRARY_LAYOUT>
        <SINGLE/>
    </LIBRARY_LAYOUT>
    ...

Create the Submission XML
==========================

To submit an experiment, a run or any other object(s), you need an accompanying submission XML in a separate file. 
Let's call this file `submission.xml`. 

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <SUBMISSION>
       <ACTIONS>
          <ACTION>
             <ADD/>
          </ACTION>
       </ACTIONS>
    </SUBMISSION>

The submission XML declares one or more Webin submission service actions. 
In this case the action is `<ADD/>` which is used to submit new objects. 

The XMLs can be submitted programmatically, using CURL on command line or 
using the `Webin XML and reports portal](prog_11.html).

## Submit the XMLs using CURL 

CURL is a Linux/Unix command line program which you can use to send the `experiment.xml`, `run.xml` and `submission.xml`
to the Webin submission service.

.. code-block:: bash

    curl -u username:password -F "SUBMISSION=@submission.xml" -F "EXPERIMENT=@experiment.xml" -F "RUN=@run.xml" "https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/"

Please provide your Webin submission account credentials using the `username` and `password`.

After running the command above a receipt XML is returned. It will look like the one below:

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <RECEIPT receiptDate="2017-08-11T15:07:36.746+01:00" submissionFile="sub.xml" success="true">
       <EXPERIMENT accession="ERX2151578" alias="exp_mantis_religiosa" status="PRIVATE"/>
       <RUN accession="ERR2094164" alias="run_mantis_religiosa" status="PRIVATE"/>
       <SUBMISSION accession="ERA986371" alias="mantis_religiosa_submission"/>
       <MESSAGES>
           <INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
       </MESSAGES>
       <ACTIONS>ADD</ACTIONS>
       <ACTIONS>ADD</ACTIONS>
    </RECEIPT>

Submit the XMLs using Webin XML and reports portal
==================================================

XMLs can also be submitted interactively using the [Webin XML and reports portal](prog_11.html).
Please refer to the [Webin XML and reports portal](prog_11.html) document for an example how
to submit a study using XML. Other types of XMLs can be submitted using the same approach. 

The Receipt XML
===============

To know if the submission was successful look in the first line of the `<RECEIPT>` block. 

The attribute `success` will have value `true` or `false`. If the value 
is false then the submission did not succeed. In this case check the rest of 
the receipt for error messages and after making corrections, try the submission again. 

If the success attribute is true then the submission was successful. The receipt will 
contain the accession numbers of the objects that you have submitted. In the case of 
an ENA study this is likely to be the accession that you will be including in a 
publication.

Test and production services
=============================

Note the message in the receipt:

.. code-block:: xml

    <INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>

It is advisable to first test your submissions using the Webin test service where changes are not permanent 
and are erased every 24 hours. 

Once you are happy with the result of the submission you can use the CURL command again 
but this time using the production service. Simply change the part in the URL from `wwwdev.ebi.ac.uk` to 
`www.ebi.ac.uk`:

.. code-block:: bash

    curl -u username:password -F "SUBMISSION=@submission.xml" -F "EXPERIMENT=@experiment.xml" -F "RUN=@run.xml" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/"

Similarly, if you are using the `Webin XML and reports portal < prog_11.html>`_ change the URL from 
`wwwdev.ebi.ac.uk` to `www.ebi.ac.uk`.
