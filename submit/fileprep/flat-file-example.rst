=================
Flat File Example
=================

The EMBL flat file format should be used for the submission of annotation data,
from targeted assembled/annotated sequences to full annotated genome
assemblies.

This page provides an example of the format, and may be used as a basis for
preparing flat files for submission.
When used for this purpose, please do not change any fields currently filled
with 'XXX'. These represent values which will be generated automatically by the
ENA processing pipeline, so anything you enter here will be overwritten.
On the other hand, be sure to edit any text enclosed in curly brackets
( '{' and '}' ).

To see the full range of available features and qualifiers, please visit
`WebFeat <https://www.ebi.ac.uk/ena/WebFeat/>`_. To see any upcoming feature table
changes see `here <feature-table-updates.html>`_.

For a list of third party tools which may help with the creation of your
flat file or conversion from another format, please see our page on
`Third Party Tools <../../faq/third_party_tools.html>`_.

We have some pre-prepared flat file templates available for use with common
submission types available too, please see
`Entry Upload Templates <sequence-flatfile.html>`_.

::

    ID   XXX; XXX; {'linear' or 'circular'}; XXX; XXX; XXX; XXX.
    XX
    AC   XXX;
    XX
    AC * _{entry_name} (where entry_name=sequence name: e.g. _contig1 or _scaffold1)
    XX
    PR   Project:PRJEBNNNN;
    XX
    DE   XXX
    XX
    RN   [1]
    RP   1-2149
    RA   XXX;
    RT   ;
    RL   Submitted {(DD-MMM-YYYY)} to the INSDC.
    XX
    FH   Key           Location/Qualifiers
    FH
    FT   source        1..588788
    FT                 /organism={"scientific organism name"}
    FT                 /mol_type={"in vivo molecule type of sequence"}
    XX
    SQ   Sequence 588788 BP; 101836 A; 193561 C; 192752 G; 100639 T; 0 other;
         tgcgtactcg aagagacgcg cccagattat ataagggcgt cgtctcgagg ccgacggcgc        60
         gccggcgagt acgcgtgatc cacaacccga agcgaccgtc gggagaccga gggtcgtcga       120
         gggtggatac gttcctgcct tcgtgccggg aaacggccga agggaacgtg gcgacctgcg       180
    [sequence truncated]...
