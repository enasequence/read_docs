# Updating a Raw Read Submission Programmatically

The main difference between programmatically creating new experiment and runs
and updating existing ones is that the `MODIFY` action should be used instead of the `ADD` action:

```
<SUBMISSION>
     <ACTIONS>
         <ACTION>
             <MODIFY/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

Please note that the new experiment or run XML must either contain the original alias or the
assigned accession number for the correct object to be updated.

Detailed advice on how to programmatically update XMLs
including instructions for retrieving previously submitted XMLs can be
found in [Programmatic Submission Options](../../submit/general-guide/programmatic.html).
Experiment and run XMLs can also be manually edited using the
[Webin Portal](../../submit/general-guide/submissions-portal.html).

## Reasons for Updating Experiment XML

Typical reasons for updating experiment XMLs include:

- Change the library descriptor:

```
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
 ```

- Move the experiment to a different study by changing the `STUDY_REF`:

```
    <STUDY_REF accession="..."/>
```

- Associate the experiment with a different sample by changing the `SAMPLE_DESCRIPTOR`:

```
    <SAMPLE_DESCRIPTOR accession=".."/>
```

- Include more information in experiment attributes:

```
<EXPERIMENT_ATTRIBUTE>
   <TAG>library preparation date</TAG>
   <VALUE>2010-08</VALUE>
</EXPERIMENT_ATTRIBUTE>
```

