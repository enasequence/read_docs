==============================
Submit Raw Reads Interactively
==============================


Within ENA, raw reads are represented as ‘run’ and ‘experiment’ submission objects.

- **Experiment**: The experiment submission holds metadata that describe the methods used to sequence the sample,
  including library and instrument details.

- **Run**: A run is part of an experiment and refers to data files containing sequence reads. The run submission holds
  information about the raw read files generated in a run of sequencing as well as their location on an FTP server.

When submitting read data interactively, one Run is always linked with one Experiment object. Experiments are
linked with one Sample and one Study.

.. image:: ../images/metadata_model_reads.png
   :align: center

If you are not yet familiar with the ENA metadata model, please see :doc:`here <../general-guide/metadata>` for some
more information. To submit raw read sequencing data to ENA you must also provide some metadata to describe the biological
material which was sequenced. This helps make your data re-useable and searchable. A raw read submission references ENA
Sample and Study objects, and you must submit these before you can submit your read data.

Step 0: Prepare the submission
==============================

To archive your read data interactively at the ENA, you will need to complete the following steps:

- **Register a Study**, see :doc:`How to Register a Study <../study/interactive>`

- **Register Samples**, see :doc:`How to Register a Sample <../samples/interactive>`

- **Upload read files**

First check to make sure your reads are in the correct format, as detailed in :doc:`Accepted Read Data Formats <https:../fileprep/reads>`.

Next, :doc:`Prepare Files for Upload <../fileprep/preparation>`.

Finally, :doc:`Upload your read files <../fileprep/upload>` to your
Webin file upload area.

- **Submit your read records** (detailed here in Steps 1-3)

To start your read submission, log in to the `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin>`_.
You will need to complete three steps, described below:

1. Select and customise a read submission template spreadsheet
2. Fill out the template spreadsheet
3. Validate and submit the template spreadsheet

If you are unsure, you are welcomed and encouraged to test out your submission through the Webin Portal
`test version <https://wwwdev.ebi.ac.uk/ena/submit/webin/>`_.
All submissions to the test version are overwritten within 24 hours, so your submissions here are consequence-free.
To be sure that you are in the test environment, always check for the 'wwwdev' URL.


Step 1: Select A Read Spreadsheet
=================================


To begin, log in to the `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/login>`_ and select the
'Submit Reads' button.

1. Expand the 'Download spreadsheet template for Read submission' section by clicking it
2. Carefully review the list of submittable read file formats and choose the one which applies to your submission.
   Note that there are different options for single and paired FASTQ files
3. Click the appropriate file format to advance and see its list of attributes

.. image:: ../images/wsp_read_1_template_selection.png

4. Review the included attributes, their meanings, and requirements; use the 'Show Description' box to see more
   information about an attribute
   Expand the 'Optional Fields' section and check the boxes next to the non-default attributes to include them
5. Click 'Next' when you are ready to continue; you can return to this interface later to review attribute meanings and
   requirements
6. Click 'Download TSV Template' to acquire a copy of your customised template spreadsheet


Step 2: Complete The Template Spreadsheet
=========================================



Once you have downloaded the template spreadsheet, you should open it in an appropriate spreadsheet editing program,
such as Microsoft Excel or Google Sheets.
Consider the following tips as you complete your spreadsheet:

- Each row of your spreadsheet should describe the files and metadata for exactly one experiment/run pair

  - Submissions must always be de-multiplexed

- Return to the interface in the previous step to review the meanings of attributes and any requirements they have
- The study and sample fields can be filled out with either ENA or BioStudies/BioSamples accessions
- The file name fields must exactly match the name of a file in your account's upload area

  - If you created subdirectories for your files, include this full path in the file name field

- The MD5 fields should be filled with file MD5 values, which are 32-digit hexadecimal numbers.
  The MD5 value is a fingerprint value for the file which allows us to verify that it was uploaded successfully. The values
  should be filled in lower case letters.
  In Linux and Mac, you can generate this value from the command line by running the command 'md5' or 'md5sum' on the
  file, while Microsoft has a `support article <https://support.microsoft.com/en-gb/help/889768/how-to-compute-the-md5-or-sha-1-cryptographic-hash-values-for-a-file>`_
  on performing this activity for Windows.
- Do not edit the existing column names
- Use only valid ASCII characters
- When you come to submit the file you must use one of the following extensions: .csv, .tsv, .tab, .txt

Once you are satisfied that your spreadsheet content is complete, save the file and move on to the final step.


Step 3: Submit The Template Spreadsheet
=======================================


Return to the 'Submit Reads' interface in `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/login>`_.
This time, expand the 'Upload filled spreadsheet template for Read submission' section.

Select the 'Browse' option or click-and-drag the file onto this section.
Then, click the 'Submit Completed Spreadsheet' button to have your file validated and submitted.

.. image:: ../images/wsp_read_2_spreadsheet_submission.png

Should metadata validation fail, you will receive a pop-up with an error message.
If the content of the error message is unclear, please
`contact the helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.

If metadata validation is successful, you will receive a pop-up informing you of this and confirmation of the assigned
experiment and run accessions.
Your submitted data files will then be entered into a processing pipeline which will check their validity before moving
them to an archive.
If there are file errors, these will be reported to account holders by the registered email address(es).
You can always check the processing status of your submissions via the run reports available in Webin Portal.

See `Webin Portal Reports <../general-guide/submissions-portal.html>`_ for advice on retrieving information
about these submissions.