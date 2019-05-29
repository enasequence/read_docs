Module 2: Accession Numbers
===========================

Submissions to ENA always result in accession numbers. A set of rules describe
the format of the accessions, and these are described below, alongside
examples of how they look.

Understanding these accessions can give you some information about what they
refer to, even before you find them in our browser. For example, in the case
of studies, samples, experiments and runs, you can identify which INSDC
partner accepted the original submission by looking at the first letter: 'E'
for ENA, 'D' for DDBJ, or 'S' for NCBI.


+------------------------------+---------------------------+-----------------+
| **Accession Type**           | **Accession Format**      | **Example**     |
+------------------------------+---------------------------+-----------------+
| Assembled/Annotated Sequence | [A-Z]{1}\\d{5}\\.\\d+     | AB12345.1       |
|                              | [A-Z]{2}\\d{6}\\.\\d+     |                 |
|                              | [A-Z]{4}S?\\d{8,9}\\.\\d+ |                 |
+------------------------------+---------------------------+-----------------+
| Protein Coding Sequences     | [A-Z]{3}\\d{5}\\.\\d+     | ABC12345.1      |
+------------------------------+---------------------------+-----------------+
| Projects                     | PRJ(E|D|N)\\d+            | PRJEB12345      |
+------------------------------+---------------------------+-----------------+
| Studies                      | (E|D|S)RP\\d{6,}          | ERP123456       |
+------------------------------+---------------------------+-----------------+
| BioSamples                   | SAM(E|D|N)[A-Z]?\\d+      | SAMEA123456     |
+------------------------------+---------------------------+-----------------+
| Samples                      | (E|D|S)RS\\d{6,}          | ERS123456       |
+------------------------------+---------------------------+-----------------+
| Experiments                  | (E|D|S)RX\\d{6,}          | ERX123456       |
+------------------------------+---------------------------+-----------------+
| Genome collections           | GCA\_\\d{9}\\.\\d+        | GCA_123456789.1 |
+------------------------------+---------------------------+-----------------+
