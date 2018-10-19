================================
Module 3: Entry Upload Templates
================================


Introduction
============

The Entry Upload Templates provided on this page are skeletons of actual
flatfiles, suitable for submission. All submissions should include the topology
of the ID line, the description from the DE line, and the feature table (FT
lines). Other parts of the final flatfile will be collected during submission,
including release date and references, rather than being present in the
submitted file.

To use one of the templates, copy the boxed example and save into a plain text
file. It is essential that you use a plain text format, as hidden characters and
formatting associated with other file types will result in automatic
rejection of your submission.

Please carefully read the accompanying notes for the template you choose, and
make sure that all tokens (shown in curly brackets {} ) are replaced with actual
values, and any unused parts of the FT block are removed. Please use only
the ASCII character set; extended ASCII (including special characters and
characters not native to English) is not accepted and may cause validation
errors. Please use the nearest ASCII equivalent.

The templates provide the basic and minimal information required for
constructing your flatfile. Advanced users may wish to add further annotation
within the scope of the feature table. In this case, please refer to the `INSDC
WebFeat documentation <https://www.ebi.ac.uk/ena/WebFeat/>`_.

Most templates here assume that the sequences are nuclear in origin. For
organellar sequences, the qualifier /organelle="{organelle}" should be included,
with the value of {organelle} taken from the `INSDC controlled vocabulary
<https://www.ebi.ac.uk/ena/WebFeat/qualifiers/organelle.html>`_.

Sequences extracted from mixed samples of anonymous organisms (metagenomic
samples) where independent identification, such as culturing, has not been done
are environmental samples by INSDC definition. The organism feature for these
sequences should reference a taxon whose name starts with 'uncultured'. In
addition, these should inclue the flag '/environmental sample' within the
source feature.

Sequences should always be submitted on the forward strand. When submitting a
multi-feature region with loci on both strands, you will need to apply the
complement operator to the coordinates for reverse strand features. Refer to
the `Feature Table Document
<ftp://ftp.ebi.ac.uk/pub/databases/embl/doc/FT_current.html#7.5>`_ or
similarly-annotated records in the database.

The nucleotide sequence itself should comprise only characters from the IUPAC
nucleotide nomenclature. An unsequenced region of unsure length should be
represented with a string of 100 Ns; gaps of known length may use the exact
number, but if this is very large (e.g. >200bp) then it is advisable to condense
the gap to one of unknown length (100 Ns).

Unsequenced regions should be annotated with a gap feature, shown below. Gaps
formed as artefacts of alignment are not allowed. If the gap covers an entire
intron, then the corresponding intron block should be removed from the
annotation.

.. code-block::

    FT   gap             {X..Y}
    FT                   /estimated_length={unknown or known}

When you have prepared your flatfile, you will need to submit it using
`Webin-CLI <cli_01.html>`_.

**Available templates:**

- 1: `HLA Gene With Sequenced Introns`_
- 2: `HLA Gene With Unsequenced Introns`_
- 3: `Bacterial Operon`_
- 4: `Multi-Exon Gene`_
- 5: `Multi-Feature Region`_
- 6: `rDNA Region (ITS And rRNA Features)`_
- 7: `Precursor mRNA`_
- 8: `Synthetic Construct`_


HLA Gene With Sequenced Introns
===============================

HLA genes have strictly controlled formats in ENA falt files. Please adhere to
the below conventions to avoid having your submission rejected.

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{gene}** has a value such as *HLA-A*, *HLA-B*, *HLA-DRB*
3. **{allele}** takes the form *{gene\*allele designation}*, e.g. *HLA-A\*01:01*,
   *HLA-B\*40:32*
4. **{product}** takes the form *MHC class I antigen* or *MHC class II antigen*
5. **{reading frame}** should be 1 where the start codon is present, otherwise
   1, 2 or 3 depending on the reading frame of the 5' partial coding sequence
6. **{partial}** - delete if coding region is complete, otherwise just
   remove the curly brackets
7. **{a to n}** are the exon/intron/CDS coordinates
8. **{A and N}** are the coding region 5' and 3' coordinates, which may differ
   from exon coordinates due to UTR. If the start or stop codon is absent,
   please include partiality symbols, e.g. *<1..250* or *2917..>2960*
9. Incompleteness of any features should be described using partiality symbols,
   e.g. *<1..250* or *2917..>2960*
10. **{sequence}** should be the sequence in IUPAC nucleotide characters,
    as described above
11. Add or remove exon and intron blocks as required

HLA gene with sequenced introns:


.. code-block::

    #TODO


HLA Gene With Unsequenced Introns
=================================

HLA genes have strictly controlled formats in ENA falt files. Please adhere to
the below conventions to avoid having your submission rejected. When introns are
unsequenced, exons should be concatenated in order with 100 Ns representing gaps
of unknown length.

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{gene}** has a value such as *HLA-A*, *HLA-B*, *HLA-DRB*
3. **{allele}** takes the form *{gene\*allele designation}*, e.g. *HLA-A\*01:01*,
   *HLA-B\*40:32*
4. **{product}** takes the form *MHC class I antigen* or *MHC class II antigen*
5. **{reading frame}** should be 1 where the start codon is present, otherwise
   1, 2 or 3 depending on the reading frame of the 5' partial coding sequence
6. **{partial}** - delete if coding region is complete, otherwise just
   remove the curly brackets
7. **{a to h}** are the exon/intron/CDS coordinates
8. **{A and H}** are the coding region 5' and 3' coordinates, which may differ
   from exon coordinates due to UTR. If the start or stop codon is absent,
   please include partiality symbols, e.g. *<1..250* or *2917..>2960*
9. Incompleteness of any features should be described using partiality symbols,
   e.g. *<1..250* or *2917..>2960*
10. Add or remove exon and intron blocks as required
11. **{sequence}** should be the sequence in IUPAC nucleotide characters,
    as described above


.. code-block::

    #TODO


Bacterial Operon
================

Bacterial operons contain multiple ORFs which are transcribed together. In ENA
records, the annotation contains an *operon* feature and multiple *CDS*
features.

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{strain}** is the strain identifier. You may change this to /isolate if you
   prefer
3. **{operon}** is the name of the operon and has a value like *gal* or *lac*
4. **{geneX}** is the gene symbol and has a value like *galA* or *lacZ*
5. **{productX}** is the product/protein name and has a value like *galactose-
   permease*, *beta-galactosidase*
6. **{reading frame}** should be 1 where the start codon is present, otherwise
   1, 2 or 3 depending on the reading frame of the 5' partial coding sequence
7. **{a to l}** are the coordinates of the operon and CDS 5' and 3' ends
8. Incompleteness of any features should be described using partiality symbols,
   e.g. *<1..250* or *2917..>2960*
9. **{sequence}** should be the sequence in IUPAC nucleotide characters,
   as described above
10. Add or remove CDS blocks as required
11. Advanced users: consider including other features, such as *promoter*, *-35_
   signal* and *-10_signal*. See the `WebFeat page
   <http://www.ebi.ac.uk/ena/WebFeat/>`_ for more information

Optional features

.. code-block::

    #TODO


Bacterial operon:

.. code-block::

    #TODO


Multi-Exon Gene
===============

This template should be used as a starting point for submitting multi-exon
genes. Where optional qualifiers are not used, please remove the entire line
from the template.

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{identifier}** is a form of sample or organism identification. You must use
   at least one from the below list and fill in the **{ID}** field with it.
   Other qualifiers are available in `WebFeat
   <https://www.ebi.ac.uk/ena/WebFeat/source.html>`_.

   a. Isolate: any sample or isolate name
   b. Strain: the strain of the sequenced organism
   c. Clone: the clone name of the sequence
   d. Note: the breed of a domesticate
   e. Cultivar: a cultivated variety of a plant or fungus
   f. Variety: a natural variety of a plant or fungus

3. **{gene}** is the gene symbol, putative or official. This is optional, but
   highly recommended
4. **{product}** is the product/protein name and is mandatory. If uncertain, use
   "hypothetical protein"
5. **{allele}** is the allele name. This is optional.
6. **{reading frame}** should be 1 where the start codon is present, otherwise
   1, 2 or 3 depending on the reading frame of the 5' partial coding sequence
7. **{partial}** - delete if coding region is complete, otherwise just
   remove the curly brackets
8. **{a to n}** are the exon/intron/CDS coordinates
9. **{A to N}** are the coding region 5' and 3'coordinates, which may differ
   from exon coordinates due to UTR. If the start or stop codon is absent,
   please include partiality symbols, e.g. *<1..250* or *2917..>2960*
10. Incompleteness of any features should be described using partiality symbols,
    e.g. *<1..250* or *2917..>2960*
11. **{sequence}** should be the sequence in IUPAC nucleotide characters,
    as described above
12. Add or remove exon, intron and gap blocks as required

Multi-exon genes

.. code-block::

    #TODO


Multi-Feature Region
====================

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{organelle}** with the value taken from the INSDC
   `controlled vocabulary
   <https://www.ebi.ac.uk/ena/WebFeat/qualifiers/organelle.html>`_.
   The organelle should also be added to the DE line. Remove this entirely if
   the sequence is of nuclear origin.
3. **{identifier}** is a form of sample or organism identification. You must use
   at least one from the below list and fill in the **{ID}** field with it.
   Other qualifiers are available in `WebFeat
   <https://www.ebi.ac.uk/ena/WebFeat/source.html>`_.

   a. Isolate: any sample or isolate name
   b. Strain: the strain of the sequenced organism
   c. Clone: the clone name of the sequence
   d. Note: the breed of a domesticate
   e. Cultivar: a cultivated variety of a plant or fungus
   f. Variety: a natural variety of a plant or fungus

4. **{gene}** is the gene symbol, putative or official. It is optional, but
   highly recommended. For tRNAs, the INSDC standard is *tRNA-Aaa* where *Aaa*
   is the 3-letter amino acid code (e.g. *tRNA-Gly*). For rRNAs, the standard is
   *XXS ribosomal RNA*, where *XX* is the sedimentation coefficient (e.g. *16S
   ribosomal RNA*)
5. **{product}** is the product/protein name and is mandatory. If uncertain, use
   "hypothetical protein"
6. **{reading frame}** should be 1 where the start codon is present, otherwise
   1, 2 or 3 depending on the reading frame of the 5' partial coding sequence
7. **{a to h}** are the feature coordinates. For CDS features, this is the first
   and last base of the coding sequence, whether or not the start or stop codons
   are present.
8. **{short note}** should describe any misc_feature in simple terms, e.g.
   *intergenic spacer region*. It is useful here to refer to similar entries in
   the database. For tRNAs, the INSDC standard is *tRNA-Aaa* where *Aaa*
   is the 3-letter amino acid code (e.g. *tRNA-Gly*). For rRNAs, the standard is
   *XXS ribosomal RNA*, where *XX* is the sedimentation coefficient (e.g. *16S
   ribosomal RNA*)
9. Incompleteness of any features should be described using partiality symbols,
   e.g. *<1..250* or *2917..>2960*
10. **{sequence}** should be the sequence in IUPAC nucleotide characters,
    as described above
11. Any of the feature blocks can be replicated/removed as required
12. The DE line should be written using the templated format but will need to be
    expanded according to the number and type of features in the sequence

Multi-feature region:

.. code-block::

    #TODO


rDNA Region (ITS And rRNA Features)
===================================

The ITS/rDNA region can be submitted using an `annotation checklist
<https://www.ebi.ac.uk/ena/submit/annotation-checklists>`_ but this provides all
details within a single misc_RNA feature. If you wish to add individual feature
annotation for each rRNA and ITS, you will need to generate the file yourself.
This section provides a skeleton for that.

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{identifier}** is a form of sample or organism identification. You must use
   at least one from the below list and fill in the **{ID}** field with it.
   Other qualifiers are available in `WebFeat
   <https://www.ebi.ac.uk/ena/WebFeat/source.html>`_.

   a. Isolate: any sample or isolate name
   b. Strain: the strain of the sequenced organism
   c. Clone: the clone name of the sequence
   d. Note: the breed of a domesticate
   e. Cultivar: a cultivated variety of a plant or fungus
   f. Variety: a natural variety of a plant or fungus

3. **{a to f}** are the feature coordinates. Incompleteness of any features
   (rRNA, misc_RNA) should be described using partiality symbols, e.g. *<1..250*
   or *2917..>2960*
4. **{sequence}** should be the sequence in IUPAC nucleotide characters,
    as described above
5. Any of the feature blocks can be replicated/removed as required
6. Please update the DE line to reflect the addition/removal of features

rDNA region: 

.. code-block::

    #TODO


Precursor mRNA
==============

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{}**
3. **{}**
4. **{}**
5. **{}**
6. **{}**
7. **{}**
8. **{}**
9. **{}**
10. **{}**
11. **{}**


.. code-block::

    #TODO


Synthetic Construct
===================

1. **{organism}** is a species-rank organism present in the database. Search
   available taxa at
   `ENA Search <https://www.ebi.ac.uk/ena/data/warehouse/search>`_.
2. **{}**
3. **{}**
4. **{}**
5. **{}**
6. **{}**
7. **{}**
8. **{}**
9. **{}**
10. **{}**
11. **{}**


.. code-block::

    #TODO
