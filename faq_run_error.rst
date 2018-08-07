============================
Common Run Submission Errors
============================

| Runs are objects in the ENA database which wrap read files of types such as FASTQ and BAM.
| Before they can be submitted, these files must be uploaded to your Webin account's FTP directory.
  After you complete the submission, several validation procedures are applied to the file(s).
  If validation is successful, files are archived.
  Otherwise, you will be notified of the error.
|
| The errors discussed here typically do not require you to repeat the submission in its entirety.
  It is usually sufficient to reupload the file or correct the error.
| Once you correct your submission, it can take 24 hours or longer for this to be registered and for the error notifications to cease.
|
| Find the error you are receiving in the subsections below for advice on how to fix the error.


Error: Invalid File Checksum
============================

| If this error occurs, you will receive an email containing something similar to the below:

::

 FILE_NAME | ERROR | MD5 | FILE_SIZE | DATE | RUN_ID/ANALYSIS_ID
 mbr_depth_05.bam | Invalid file checksum | 594934819a1571f805ff299807431da4 | 895557023 | 20-DEC-2016 14:02:50 | ERR1766300

The Problem
-----------

| The checksum is a means of checking a file has been uploaded in its entirety.
  It is a 32-character string calculated from the file, and is unique to that file.
  Therefore, if the upload procedure fails to deliver the full file, this will be evident from the checksum.
| You will have calculated this value previously and included it in your submission: you can see the value you registered in the notification email, as is the case above.
  We recalculate the MD5sum after you complete your submission and confirm that it matches the value you registered.
|
| The checksum is calculated using the MD5 hash algorithm, which can be done easily from a Linux or Mac command line.
  Try the following commands:

.. code-block:: bash

	> md5sum mbr_depth_05.bam
	594934819a1571f805ff299807431da4  mbr_depth_05.bam
    > md5 mbr_depth_05.bam
    594934819a1571f805ff299807431da4  mbr_depth_05.bam

| Windows users should see the `Microsoft Support Article <https://support.microsoft.com/en-gb/help/889768/how-to-compute-the-md5-or-sha-1-cryptographic-hash-values-for-a-file>`_ on this subject.

The Solution
------------

| Depending on the exact cause of the error, there are two possible solutions.

Corrupted File: Upload Again
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| If you recalculate the MD5 value of you file locally and it matches the value you registered, it is likely the file upload was incomplete or corrupt.
  You therefore need to reupload the file.
| See the `Data Upload <upload_01.html>`_ pages for a guide to uploading.
  You may find using Aspera for your upload gives you a more stable connection, especially if you and the ENA are geographically distant from one another.

Wrong MD5 Value Registered: Register a New One
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| If you recalculate the MD5 value of your local file and it does not match the value you registered, this will be the root of the problem.
| You will need to re-register the MD5 value.
  The simplest way to do this is to log in to your Webin account, navigate to the 'Runs' tab and click the 'Edit' button next to the errored run.
  You will be presented with a field in which you can update the MD5 value.
|
| If you have many runs to update, you may wish to do this programmatically, by submitting corrected XML versions of your runs.
  View our pages on `Programmatic Run Updates <prog_08.html>`_ to learn more about this.


Error: Number Of Lines Is Not A Multiple Of Four
================================================

You will receive an email resembling the below if this error occurs:

::

    FILE_NAME | ERROR | MD5 | FILE_SIZE | DATE | RUN_ID/ANALYSIS_ID
    SOC9/MCONS1_R1.fq.gz | File content missing or malformed, Number of lines in fastq is not multiple of 4 | c2f8455c1a024cfb96a6c91f5d71f534 | 1358349886 | 01-DEC-2016 03:12:35 | ERR1755094

The Problem
-----------

| This error is specific to FASTQ files: each entry in such a file should comprise exactly four lines.
  If this is not the case, then the file is either inappropriately formatted or has been corrupted during upload.

The Solution
------------

| You can replicate this check on the file locally from the command line:

.. code-block:: bash

    > zcat MCONS1_R1.fq.gz | wc -l

| This command will output the amount of lines in the file.
| If it is divisible by four, it is likely the file was corrupted during upload and should be reuploaded.
| If it is not divisible by four, you should discover why, correct your file and reupload.

.. note::

    If you reformat your file and then reupload it, you will also need to reregister the checksum.
    See the 'Invalid File Checksum' section above for information on this.


Error: File Integrity Check Failed
==================================

| You will know this error has occurred if you receive an email resembling the below:

::

    FILE_NAME | ERROR | MD5 | FILE_SIZE | DATE | RUN_ID/ANALYSIS_ID
    UK/BR1-20_2.fq.gz | File integrity check failed, Can't unzip file | ef7e73ed95f64355d7bf7d48636b704f | 3801612790 | 22-DEC-2016 04:08:41 | ERR0757927
    cetbiorep1.bam | File integrity check failed, File cannot be read using samtools | cecfa479356456cb6770986a6141bc44 | 800838646 | 24-MAY-2016 03:02:08 | ERR0332189
    frger.cram | File integrity check failed, Can't count number of records in the file using cram tools | 807a0f61da013916c1ca5f60b9b42526 | 2347399950 | 11-JAN-2017 14:59:49 | ERR363314

The Problem
-----------

| Submitted files are checked to confirm they can be unpacked.
  The specifics of how this is done depends on the file type, e.g. gzipped FASTQ files are checked with gunzip, while BAM files are checked with SAMtools.
| Unpacking will fail for one of two reasons: either the uploaded file was corrupt to begin with, or the upload procedure did not complete fully and a corrupted file was received.

The Solution
------------

| You should start by confirming the integrity of your local copy of the file.
  Find instruction on how to do this by referring to the relevant subsection below.
| If the file unpacks correctly, reupload it to your submission directory.
  If it does not, remake the file and upload this.
  Be sure to check that the MD5 value hasn't changed: you will need to re-register a correct value if it has.


FASTQ Files
^^^^^^^^^^^

| Our pipeline performs the following check on gzipped FASTQ files to validate them:

.. code-block:: bash

    > zcat BR1-20_2.fq.gz > /dev/null 2>&1
    > echo $?

| This will attempt to read the content of the file and print an exit code.
  If this value is 1 or higher, there is a problem with the file.
  You can try this on your local file to check its validity, then upload a corrected version.


BAM Files
^^^^^^^^^

| The check performed on BAM files is as follows:

.. code-block:: bash

    > samtools view cetbiorep1.bam > /dev/null 2>&1
    > echo $?

| This command attempts to view the BAM file and output the exit code of this procedure.
  If the code is 1 or higher, there is a problem with the file.
  Try this check on your local file and then upload a corrected version.
