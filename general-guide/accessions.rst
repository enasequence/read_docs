Accession Numbers
=================

Submissions to ENA always result in accession numbers. A set of rules describe
the format of the accessions, and these are described below, alongside
examples of how they look.

Understanding these accessions can give you some information about what they
refer to, even before you find them in our browser. For example, in the case
of studies, samples, experiments and runs, you can identify which INSDC
partner accepted the original submission by looking at the first letter: 'E'
for ENA, 'D' for DDBJ, or 'S' for NCBI.


+------------------------------+----------------------------------+-------------------+
| **Accession Type**           | **Accession Format**             | **Example**       |
+------------------------------+----------------------------------+-------------------+
| Assembled/Annotated Sequence | | [A-Z]{1}[0-9]{5}\\.[0-9]+      | | AB12345.1       |
|                              | | [A-Z]{2}[0-9]{6}\\.[0-9]+      |                   |
|                              | | [A-Z]{4}S?[0-9]{8,9}\\.[0-9]+  |                   |
|                              | | [A-Z]{2}[0-9]{8}               | | AB12345678      |
|                              | | [A-Z]{6}[0-9]{2}S?[0-9]{7,9}   | | ABCDEF0101234567|
+------------------------------+----------------------------------+-------------------+
| Protein Coding Sequences     | | [A-Z]{3}[0-9]{5}\\.[0-9]+      | ABC12345.1        |
|                              | | [A-Z]{3}[0-9]{7}\\.[0-9]+      |                   |
+------------------------------+----------------------------------+-------------------+
| Genome Collections           | GCA\_[0-9]{9}\\.[0-9]+           | GCA_123456789.1   |
+------------------------------+----------------------------------+-------------------+
| Projects                     | PRJ(E|D|N)[A-Z][0-9]+            | PRJEB12345        |
+------------------------------+----------------------------------+-------------------+
| Studies                      | (E|D|S)RP[0-9]{6,}               | ERP123456         |
+------------------------------+----------------------------------+-------------------+
| BioSamples                   | SAM(E|D|N)[A-Z]?[0-9]+           | SAMEA123456       |
+------------------------------+----------------------------------+-------------------+
| Samples                      | (E|D|S)RS[0-9]{6,}               | ERS123456         |
+------------------------------+----------------------------------+-------------------+
| Experiments                  | (E|D|S)RX[0-9]{6,}               | ERX123456         |
+------------------------------+----------------------------------+-------------------+
