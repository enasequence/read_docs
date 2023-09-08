=====================
Annotation Checklists
=====================

Checklists for some commonly submitted types of targeted sequence have been
defined. These are more convenient than manually preparing a flat file and
should be used where applicable.

Please note that none of the information here is relevant to submission of
annotated genome assemblies. For information on this, please see our page
`How To Submit Genome Assemblies <../../assembly.html>`_.

There are several categories of checklist:

- `Frequently Used Checklists`_
- `Marker Sequence Checklists`_
- `Virus-Specific Checklists`_
- `Large-Scale Data Checklists`_


Frequently Used Checklists
==========================

+------------------------+--------------+------------------------------------------------------------------------------+
| Name                   | Checklist ID | Definition                                                                   |
+========================+==============+==============================================================================+
| rRNA Gene              | ERT000002    | | For ribosomal RNA genes from prokaryotic, nuclear or                       |
|                        |              | | organellar DNA. All rRNAs are considered partial.                          |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Single CDS           | ERT000029    | | For complete or partial coding sequence (CDS) derived                      |
| | genomic DNA          |              | | from genomic DNA. This checklist will not accept                           |
|                        |              | | segmented genes (i.e., with intron regions) so should                      |
|                        |              | | be used for prokaryotic, organellar genes or for                           |
|                        |              | | submitting a single exon.                                                  |
+------------------------+--------------+------------------------------------------------------------------------------+
| Single CDS mRNA        | ERT000006    | | For complete or partial single coding sequence (CDS)                       |
|                        |              | | derived from mRNA (via cDNA).                                              |
|                        |              | |                                                                            |
|                        |              | |                                                                            |
+------------------------+--------------+------------------------------------------------------------------------------+
| MHC gene 1 exon        | ERT000030    | | For partial MHC class I or II antigens containing                          |
|                        |              | | one exon ONLY.                                                             |
+------------------------+--------------+------------------------------------------------------------------------------+
| MHC gene 2 exons       | ERT000036    | | For partial MHC class I or II antigens containing two                      |
|                        |              | | exons ONLY. An intron feature should only be used when                     |
|                        |              | | the intron region has actually been sequenced. If the                      |
|                        |              | | intron has not been sequenced, or only partially                           |
|                        |              | | sequenced, please fill the non-sequenced gap with 100 Ns.                  |
+------------------------+--------------+------------------------------------------------------------------------------+
| ncRNA                  | ERT000042    | | For non-coding RNA (ncRNA) transcripts or single-exon                      |
|                        |              | | genes of prokaryotic or eukaryotic origin with the                         |
|                        |              | | exception of the ribosomal RNA (rRNA) and transfer RNA                     |
|                        |              | | (tRNA).                                                                    |
+------------------------+--------------+------------------------------------------------------------------------------+
| Satellite DNA          | ERT000039    | | For submission of Satellites, Microsatellites and                          |
|                        |              | | Minisatellites. Complete or partial single polymorphic                     |
|                        |              | | locus present in nuclear and organellar DNA that                           |
|                        |              | | consists of short sequences repeated in tandem arrays.                     |
+------------------------+--------------+------------------------------------------------------------------------------+
| Mobile Element         | ERT000056    | | For the submission of a single complete or partial                         |
|                        |              | | mobile element. This checklist captures the mobile                         |
|                        |              | | element feature but does not allow for granular                            |
|                        |              | | annotation of component parts, such as coding regions,                     |
|                        |              | | repeat regions and miscellaneous features within the                       |
|                        |              | | mobile element itself. If precise annotation or                            |
|                        |              | | translation is required, please use an alternative                         |
|                        |              | | submission route.                                                          |
+------------------------+--------------+------------------------------------------------------------------------------+
| Gene Promoter          | ERT000054    | | For submission of uni- or bi-directional gene promoter                     |
|                        |              | | regions. Please note that CDS is not annotated; if you                     |
|                        |              | | wish to include the start of the coding region(s),                         |
|                        |              | | please leave a comment with the coordinates of the                         |
|                        |              | | start site(s).                                                             |
+------------------------+--------------+------------------------------------------------------------------------------+


Marker Sequence Checklists
==========================

+------------------------+--------------+------------------------------------------------------------------------------+
| Name                   | Checklist ID | Definition                                                                   |
+========================+==============+==============================================================================+
| COI gene               | ERT000020    | | For mitochondrial cytochrome oxidase subunit 1 genes.                      |
+------------------------+--------------+------------------------------------------------------------------------------+
| ITS rDNA               | ERT000009    | | For ITS rDNA region. This checklist allows generic                         |
|                        |              | | annotation of the ITS components (18S rRNA, ITS1,                          |
|                        |              | | 5.8S rRNA, ITS2 and 28S rRNA). For annotation of the                       |
|                        |              | | rRNA component only, please use the rRNA gene checklist.                   |
+------------------------+--------------+------------------------------------------------------------------------------+
| trnK-matK locus        | ERT000032    | | For complete or partial matK gene within the                               |
|                        |              | | chloroplast trnK gene intron.                                              |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Phylogenetic         | ERT000038    | | For the submission of the following markers: actin                         |
| | Marker               |              | | (act), tubulin (tuba or tubb), calmodulin (CaM), RNA                       |
|                        |              | | polymerase II large subunits (RPB1 and RPB2),                              |
|                        |              | | translation elongation factor 1-alpha (tef1a),                             |
|                        |              | | glyceraldehyde 3-phosphate dehydrogenase (GAPDH) and                       |
|                        |              | | histone 3 (H3) where the intron/exon boundaries are                        |
|                        |              | | not known.                                                                 |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Multi-Locus          | ERT000058    | | For the submission of multi-locus markers (e.g., tRNA                      |
| | Marker               |              | | + CDS + rRNA) from in vivo gemomic DNA. This checklist                     |
|                        |              | | provides a simple submission process fororganellar or                      |
|                        |              | | nuclear regions containing multiple genes. For example,                    |
|                        |              | | a region containing coding genes, rRNA genes and tRNA                      |
|                        |              | | genes. Please note that individual feature annotation                      |
|                        |              | | is not possible with this checklist.                                       |
+------------------------+--------------+------------------------------------------------------------------------------+
| D-Loop                 | ERT000034    | | For mitochondrial D-loop (control region) sequences.                       |
|                        |              | | All D-loops are considered partial.                                        |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Intergenic           | ERT000035    | | For intergenic spacer (IGS) sequences between                              |
| | Spacer, IGS          |              | | neighbouring genes (e.g. psbA-trnH IGS, 16S-23S rRNA                       |
|                        |              | | IGS). Inclusion of the flanking genes is allowed.                          |
+------------------------+--------------+------------------------------------------------------------------------------+
| Gene intron            | ERT000037    | | For complete or partial single gene intron.                                |
+------------------------+--------------+------------------------------------------------------------------------------+
| | External             | ERT000053    | | For submission of External Transcribed Spacer (ETS)                        |
| | Transcribed          |              | | regions of the eukaryotic rDNA transcript; a region                        |
| | Spacer (ETS)         |              | | often used to study intrageneric relationships.                            |
+------------------------+--------------+------------------------------------------------------------------------------+
| | 16S-23S              | ERT000050    | | For submission of the 16S-23S rRNA intergenic spacer                       |
| | Intergenic           |              | | region: the transcribed spacer between the 16S rRNA                        |
| | Spacer Region        |              | | and 23S rRNA genes of rRNA operons, found in                               |
|                        |              | | prokaryotes and organelles.                                                |
+------------------------+--------------+------------------------------------------------------------------------------+


Virus-Specific Checklists
=========================

+------------------------+--------------+------------------------------------------------------------------------------+
| Name                   | Checklist ID | Definition                                                                   |
+========================+==============+==============================================================================+
| | Single Viral         | ERT000028    | | For complete or partial single coding sequence (CDS)                       |
| | CDS                  |              | | from a viral gene.Please do not use for peptides                           |
|                        |              | | processed from polyproteins or proviral sequences,                         |
|                        |              | | as these are all annotated differently.                                    |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Viral                | ERT000051    | | For complete or partial viral polyprotein genes where                      |
| | Polyprotein          |              | | the mature peptide boundaries remain undefined. This                       |
|                        |              | | template is not suitable for proviral sequences. If                        |
|                        |              | | the sequences contain ribosomal frameshifts, please                        |
|                        |              | | contact us.                                                                |
+------------------------+--------------+------------------------------------------------------------------------------+
| | ssRNA(-) Viral       | ERT000052    | | For complete or partial viral copy RNA (cRNA)                              |
| | copy RNA             |              | | sequences, complementary to ssRNA(-) virus genomes.                        |
|                        |              | | Only one CDS can be added; further CDS information                         |
|                        |              | | should be provided in the curator comments section.                        |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Viral                | ERT000060    | | For complete or partial untranslated region (UTR) or                       |
| | Untranslated         |              | | nontranslated region (NTR) found at the termini of                         |
| | Region (UTR)         |              | | viral genomes. Please do not use this checklist for                        |
|                        |              | | submitting virus genomes or viral coding genes.                            |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Alphasatellite       | ERT000057    | | For submission of circular single stranded DNA                             |
| | sub-viral            |              | | alphasatellite sequences associated with Begomovirus,                      |
| | particle             |              | | Babuvirus and Nanovirus.                                                   |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Betasatellite        | ERT000047    | | For submission of circular single stranded DNA                             |
| | sub-viral            |              | | betasatellite sequences of the Begomovirus genus.                          |
| | particle             |              | |                                                                            |
+------------------------+--------------+------------------------------------------------------------------------------+
| Plant Viroid           | ERT000031    | | For complete circular ssRNA plant viroid sequences.                        |
|                        |              | | Please do not use for other circular viruses.                              |
+------------------------+--------------+------------------------------------------------------------------------------+


Large-Scale Data Checklists
===========================

+------------------------+--------------+------------------------------------------------------------------------------+
| Name                   | Checklist ID | Definition                                                                   |
+========================+==============+==============================================================================+
| | Expressed            | ERT000003    | | For submission of Sanger-sequenced Expressed Sequence                      |
| | Sequence             |              | | Tags (ESTs). ESTs are short transcripts ~500-800 bp                        |
| | Tag (EST)            |              | | long usually of low quality as they are the result                         |
|                        |              | | of only single pass reads. No feature annotation is                        |
|                        |              | | recorded on ESTs.                                                          |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Sequence             | ERT000055    | | For submission of Sequence Tagged Sites (STS). The                         |
| | Tagged               |              | | Sequence Tagged Site (STS) is a relatively short,                          |
| | Site (STS)           |              | | easily PCR-amplified sequence (200 to 500 bp) which                        |
|                        |              | | can be specifically amplified by PCR and detected in                       |
|                        |              | | the presence of all other genomic sequences and whose                      |
|                        |              | | location in the genome is mapped.                                          |
+------------------------+--------------+------------------------------------------------------------------------------+
| | Genome Survey        | ERT000024    | | For submission of Genome Survey Sequences (GSS). These                     |
| | Sequence (GSS)       |              | | are short DNA sequences which inlude: random single                        |
|                        |              | | pass genome survey sequences, single pass reads from                       |
|                        |              | | cosmid/BAC/YAC ends (may be chromosome specific), exon                     |
|                        |              | | trapped genomic sequences, Alu PCR sequences and                           |
|                        |              | | transposon-tagged sequences.                                               |
+------------------------+--------------+------------------------------------------------------------------------------+
