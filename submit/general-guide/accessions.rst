=================
Accession Numbers
=================

Submissions to ENA result in accession numbers. A set of rules describe
the format of the accessions, and these are described below, alongside
examples of how they look. These accessions can be used to identify each
unique part of your submission.

Please note, not all accessions become available in the browser and
not all can be used in publications. For information on which accessions can
be described in publications, see the guidelines at the bottom of this page.

Understanding these accessions can give you some information about what they
refer to, even before you find them in our browser. For example, in the case
of studies, samples, experiments, runs and analyses, you can identify which INSDC
partner accepted the original submission by looking at the first letter: 'E'
for ENA, 'D' for DDBJ, or 'S' for NCBI.


+---------------------------------+----------------------------------+--------------------+
| **Accession Type**              | **Accession Format**             | **Example**        |
+---------------------------------+----------------------------------+--------------------+
| Projects                        | PRJ(E|D|N)[A-Z][0-9]+            | PRJEB12345         |
+---------------------------------+----------------------------------+--------------------+
| Studies                         | (E|D|S)RP[0-9]{6,}               | ERP123456          |
+---------------------------------+----------------------------------+--------------------+
| BioSamples                      | SAM(E|D|N)[A-Z]?[0-9]+           | SAMEA123456        |
+---------------------------------+----------------------------------+--------------------+
| Samples                         | (E|D|S)RS[0-9]{6,}               | ERS123456          |
+---------------------------------+----------------------------------+--------------------+
| Experiments                     | (E|D|S)RX[0-9]{6,}               | ERX123456          |
+---------------------------------+----------------------------------+--------------------+
| Runs                            | (E|D|S)RR[0-9]{6,}               | ERR123456          |
+---------------------------------+----------------------------------+--------------------+
| Analyses                        | (E|D|S)RZ[0-9]{6,}               | ERZ123456          |
+---------------------------------+----------------------------------+--------------------+
| Assemblies                      | GCA\_[0-9]{9}\\.[0-9]+           | GCA_123456789.1    |
+---------------------------------+----------------------------------+--------------------+
| | Assembled/Annotated Sequences | | [A-Z]{1}[0-9]{5}.[0-9]+        | | A12345.1         |
| | (including contig, scaffold   | | [A-Z]{2}[0-9]{6}.[0-9]+        | | AB123456.1       |
| | and chromosome sequences      | | [A-Z]{2}[0-9]{8}               | | AB12345678       |
| | generated from an assembly    | | [A-Z]{4}[0-9]{2}S?[0-9]{6,8}   | | ABCD01123456     |
| | submission)                   | | [A-Z]{6}[0-9]{2}S?[0-9]{7,9}   | | ABCDEF011234567  |
+---------------------------------+----------------------------------+--------------------+
| Protein Coding Sequences        | | [A-Z]{3}[0-9]{5}\\.[0-9]+      | | ABC12345.1       |
|                                 | | [A-Z]{3}[0-9]{7}\\.[0-9]+      | | ABC1234567.1     |
+---------------------------------+----------------------------------+--------------------+

How to cite your ENA study
==========================

In all cases, the top-level Project accession should be cited as well as a 
link to where the data can be found in the browser, for example:

 “the data for this study have been deposited in the European Nucleotide Archive
 (ENA) at EMBL-EBI under accession number PRJEBxxxx (https://www.ebi.ac.uk/ena/browser/view/PRJEBxxxx).”

If there is a particular scenario where using the top level accession would not
be suitable, for example, if you have *multiple* publications that reference
*individual* components within a *single* ENA project (and therefore the project
accession provides too much ambiguity), then the following accessions are also
considered accessions that could be used for publication:

- Assemblies
- BioSamples (in the context of associated data)
- Assembled/Annotated Sequences 
