Bulk Submissions with Webin-CLI
===============================

Webin-CLI can submit multiple data objects in one invocation using a bulk JSON manifest.
Bulk submission is available for every data object type supported by Webin-CLI. Each
element in the JSON array is a complete manifest for one submission and follows the same
metadata and file requirements as an individual submission.

For installation and general command-line options, see
:doc:`Webin-CLI Submission <../webin-cli>`.

Prepare a Bulk JSON Manifest
----------------------------

#. Prepare a complete JSON manifest object for each submission, using the fields defined
   for its context.

#. Place the objects inside one top-level JSON array, enclosed by ``[`` and ``]``, and
   separate the objects with commas.

#. Save the array in JSON file format.

#. Check that each object has the required metadata, the correct references and the
   appropriate data files.

The outer array determines how many submissions are described. File fields can have
their own objects or arrays inside each submission.

Examples
--------

.. tabs::

   .. tab:: Raw Reads

      The example below contains three read submissions. The first has a pair of FASTQ files.
      The other two each have one single-end FASTQ file.

      .. code:: none

         [
           {
             "study": "PRJEB123456",
             "sample": "SAMEA123456",
             "name": "bulk-reads-paired-001",
             "platform": "TODO",
             "instrument": "TODO",
             "insert_size": "TODO",
             "library_name": "amplicon-library-001",
             "library_source": "TODO",
             "library_selection": "TODO",
             "library_strategy": "TODO",
             "fastq": [
               {
                 "value": "read_file_R1.fastq.gz",
                 "attributes": {"read_type": ["paired"]}
               },
               {
                 "value": "read_file_R2.fastq.gz",
                 "attributes": {"read_type": ["paired"]}
               }
             ]
           },
           {
             "study": "PRJEB12345",
             "sample": "SAMEA12345",
             "name": "bulk-reads-single-002",
             "platform": "TODO",
             "instrument": "TODO",
             "library_name": "amplicon-library-002",
             "library_source": "TODO",
             "library_selection": "TODO",
             "library_strategy": "TODO",
             "fastq": {
               "value": "run.fastq.gz",
               "attributes": {"read_type": ["single"]}
             }
           },
           {
             "study": "PRJEB1234",
             "sample": "SAMEA1234",
             "name": "bulk-reads-single-003",
             "platform": "TODO",
             "instrument": "TODO",
             "library_name": "amplicon-library-003",
             "library_source": "TODO",
             "library_selection": "TODO",
             "library_strategy": "TODO",
             "fastq": {
               "value": "file_run.fastq.gz",
               "attributes": {"read_type": ["single"]}
             }
           }
         ]

   .. tab:: Genome Assemblies

      The following genome-context example contains an isolate assembly and a MAG. The MAG
      also references a chromosome list.

      .. code:: none

         [
           {
             "study": "PRJEB123456",
             "sample": "SAMEA123456",
             "assemblyname": "TODO",
             "platform": "TODO",
             "assembly_type": "clone or isolate",
             "run_ref": "ERR123456",
             "program": "TODO",
             "coverage": "TODO",
             "moleculetype": "genomic DNA",
             "fasta": {"value": "genome_1.fasta.gz"}
           },
           {
             "study": "PRJEB12345",
             "sample": "SAMEA12345",
             "assemblyname": "bulk-MAG-001",
             "platform": "unspecified",
             "run_ref": "ERR12345",
             "assembly_type": "Metagenome-Assembled Genome (MAG)",
             "program": "TODO",
             "coverage": "TODO",
             "moleculetype": "genomic DNA",
             "fasta": {"value": "genome_2.fa.gz"},
             "chromosome_list": {"value": "chromosome_list.txt.gz"}
           }
         ]

Validate the Bulk Manifest
--------------------------

Pass the JSON file to ``-manifest`` and select the context with ``-context``. For
example, validate a bulk read submission with:

.. code-block:: bash

   java -jar webin-cli.jar \
     -context reads \
     -manifest reads-bulk.json \
     -inputDir ./data \
     -outputDir ./webin-output/reads-validation \
     -userName Webin-XXXXX \
     -password 'YOUR_PASSWORD' \
     -validate

Replace ``webin-cli.jar`` with the path to your downloaded JAR and provide your own
credentials. In this example, relative file paths in the manifest are resolved using
``./data``. Use paths appropriate for your own files.

Test the Submission
-------------------

Use ``-submit`` ``-test`` to submit to the Webin test service:

.. code-block:: bash

   java -jar webin-cli.jar \
     -context reads \
     -manifest reads-bulk.json \
     -inputDir ./data \
     -outputDir ./webin-output/reads-test \
     -userName Webin-XXXXX \
     -password 'YOUR_PASSWORD' \
     -submit -test

The test service is refreshed daily from production. Test records do not constitute a
production submission. Ensure that the study and sample references you use are available
in the service against which you are submitting.

Submit to Production
--------------------

When you are ready, use ``-submit`` without ``-test``:

.. code-block:: bash

   java -jar webin-cli.jar \
     -context reads \
     -manifest reads-bulk.json \
     -inputDir ./data \
     -outputDir ./webin-output/reads-production \
     -userName Webin-XXXXX \
     -password 'YOUR_PASSWORD' \
     -submit

Change the context, manifest and directories for other submission types.

Check Results for Objects
-------------------------

Review the reports and submission receipts under the output directory. Record the
accession numbers assigned to each object and retain the manifest and reports together.

If you need to retry, first determine which objects were accepted. Prepare a new array
containing only objects that still require submission, after correcting their errors. If
a receipt is missing or the outcome is uncertain, check the reports in your
:doc:`Webin portal account <../submissions-portal>` before repeating a submission.
