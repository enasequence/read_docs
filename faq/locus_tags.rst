==================
Locus Tag Prefixes
==================


What Are Locus Tags?
====================

Locus tags are identifiers applied systematically to every gene in a sequencing
project. If two submitters of different genomes use the same systematic names to
describe different genes, this can be a source of confusion. Therefore, INSDC
maintains a registry of locus tag prefixes to avoid overlap between genome
annotation projects. The prefix is then used systematically to give a new
unambiguous name to every gene.


How Do I Register A Locus Tag Prefix?
=====================================

A locus tag prefix can be registered when a project is registered. Advice on
doing this can be found at our `study registration page <../study/interactive.html>`_. You
can allow automatic assignment of a prefix, or you can specify your own.

If you did not add a prefix when you registered your project, it is possible to
update the project with a prefix later on. See our advice on `updating studies
<../update/interactive.html>`_.

Please note that after you register the prefix, it will not be usable until 24
hours later. Therefore, you will not immediately be able to submit your
annotated assembly.

A study can have multiple prefixes registered to it, but each prefix can only
be registered to a single study.


What Rules Should The Prefix Conform To?
----------------------------------------

The prefix you register must follow the listed conventions or it will not be
accepted:
 - Must begin with a letter
 - All letters must be upper case
 - Must from 3 to 12 characters in length
 - All characters must be alphanumeric with none such as -_*

Each prefix can only be registered to a single study; you cannot reuse a
prefix from another study, or one which another user has registered.

How Do I Use Locus Tags?
========================

| Locus tags should be assigned to all genes, including both protein-coding and
  non-protein coding genes (e.g. structural RNAs). Within your flat file,
  you should include the `/locus_tag` qualifier in every gene, mRNA, CDS, 5'UTR,
  3'UTR, intron, exon, tRNA, rRNA, misc_RNA, etc. We discourage the use of this
  qualifier on repeat_region and misc_features.
| You should include the qualifier in each component of a gene, and it should
  have the same value for all components of a single gene. The feature itself
  should resemble:

::

    FT      /locus_tag="BN5_00001"

Locus tags should be added systematically to every gene within a genome,
generally in sequential order. When updating an assembly with additional
annotation, you may either add new genes onto the end, or leave gaps when
initially assigning /locus_tags and fill new genes into these gaps.

It is possible to encode information after the underscore but before the number.
For example, the following tags might indicate the first genes of chromosomes I
and II:

::

    BN5_I00001
    BN5_II00001

The following tags could indicate an rRNA gene and a tRNA gene:

::

    BN5_r1112
    BN5_t1113
