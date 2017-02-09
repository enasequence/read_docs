Solving Error Notifications (runs)
==================================


Submission of read files such as BAM and FastQ involves uploading them to your confidential ftp directory (this comes with your Webin account). Following this you will 'submit' the files: wrap each file (or pair of files) into a run object. This action of registering the run objects triggers our file processing pipeline to do some preliminary checks on the read files before moving them to an archive area. If any check fails you will receive an error notification by email. 

To correct these preliminary validation errors you do not need to repeat any of the submission process. Simply upload and replace the files with fixed versions and if necessary update the registered md5 checksum (more on this later). The runs will automatically be updated because the processing pipeline cycles through all files that are flagged/unvalidated to see if there has been a changed. The duration of this cycle is dependent on the queue. At quiet times it can be less than 24 but it can take several days during busier times so please allow some time after you have implemented your fix for the automatic email notifications to cease.

Error Type 1: Invalid file checksum
-----------------------------------

If 'Invalid file checksum' appears in your emailed error report

.. topic:: List of file processing errors:

    FILE_NAME | ERROR | MD5 | FILE_SIZE | DATE | RUN_ID/ANALYSIS_ID
    
    mbr_depth_05.bam | Invalid file checksum | 594934819a1571f805ff299807431da4 | 895557023 | 20-DEC-2016 14:02:50 | ERR1766300
    
    mbr_depth_minus_05.bam | Invalid file checksum | a2becdf04ab799c4e208de6161b470b3 | 341165746 | 20-DEC-2016 14:00:46 | ERR1766407


File checksum refers to a hash function that can be performed on a file to create a unique string. When you upload a file to our ftp server it may not get transferred 100%. In this case we will have a corrupted or truncated file which is no good. To check this we can calculate the hash function. If it is different from the hash function of the original file before you uploaded it then we can be sure the file on our server is complete. You can read this page on `Wikipedia <https://en.wikipedia.org/wiki/Cryptographic_hash_function>`_ for more information about hash functions. 

We use the MD5 hash algorithm which you can perform easily with Linux or Mac command line on your local read files:

.. code-block:: bash

	> md5sum mbr_depth_05.bam 
	594934819a1571f805ff299807431da4  mbr_depth_05.bam

	> md5sum mbr_depth_minus_05.bam 
	99cf94b7287658254dd1be689fbc447d  mbr_depth_minus_05.bam

Outcome One: Corrupt File: Upload Again
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the example above, according to the email notification, file "mbr_depth_05.bam" has a registered MD5 of 594934819a1571f805ff299807431da4. When we calculate the checksum of the original file ourselves we find the same MD5. So the registered checksum is correct. This table is reporting that the uploaded file does not match the registered checksum so we can assume that the file was not transferred completely. To remedy this try to upload the file again. The file processing pipeline is checking for a match systematically and when it happens the run will update itself.

.. _newmd5:

Outcome Two: Wrongly Registered MD5 checksum: Register new one
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File "mbr_depth_minus_05.bam" has a different story. The registered checksum according to the email notification is a2becdf04ab799c4e208de6161b470b3. When we calculate it locally we get 99cf94b7287658254dd1be689fbc447d. It appears that the wrong MD5 is registered. To remedy this we need to change the registered MD5 checksum. To do this, upload the correct checksum as a separate file. For file XXX the md5 checksum should be in file XXX.md5, so we need to create a file called mbr_depth_minus_05.bam.md5 and this file should contain the correct MD5 checksum. We should then upload this MD5 file to the same location as the original file (your Webin ftp directory)


.. code-block:: bash

	>md5sum mbr_depth_minus_05.bam > mbr_depth_minus_05.bam.md5 # create MD5 file

	>cat mbr_depth_minus_05.bam.md5 # check contents of new MD5 file
	99cf94b7287658254dd1be689fbc447d  mbr_depth_minus_05.bam

Remember the file processing pipeline cycles through all files that are flagged with an error. You do not need to repeat the submission. Uploading the file again, or the checksum file, or both (for extra security) is sufficient to update the run but you may continue to get errors by email for a day or 2 after (depending on the queue).

If you don't remember registering the MD5 checksum for each file when you submitted it, it would have happened in one of 3 ways:

1. Our file uploader `tool <http://www.ebi.ac.uk/ena/submit/uploading-data-files#webin_uploader>`_ calculates the MD5 checksum automatically for any file that you upload. It then deposits the 'XXX.md5' file itself
2. You registered the MD5 checksum using the tsv columns during submission time. (module 4, :ref:`part 2 <mod_04_part_02>`, step 5). This method is the most common source of wrongly registered checksums. Most other times it is sufficient to re upload the file and assume the registered checksum is correct.
3. You uploaded 'XXX.md5' checksum files along with the XXX read files.

If you are submitting a new run(s) you can use the procedure described above to register an md5 checksum for each file that you upload. If you use option 2 from above (register the checksum in the metadata tsv table) it will over-ride the checksum file present in your ftp directory. If you provide a checksum file for every read file you can leave the checksum column(s) blank at the metadata registration :ref:`stage <mod_04_part_02>`.


Error Type 2: Number of lines is not multiple of 4
--------------------------------------------------

This validation check helps to pick up errors in FastQ files. It is by no means thorough, but it can catch badly formatted FastQ files before they enter the processing pipeline (after which, errors are harder to fix). You will have received an email with a table like this.

.. topic:: List of file processing errors:

	FILE_NAME | ERROR | MD5 | FILE_SIZE | DATE | RUN_ID/ANALYSIS_ID

	SOC9/MCONS1_R1.fq.gz | File content missing or malformed, Number of lines in fastq is not multiple of 4 | c2f8455c1a024cfb96a6c91f5d71f534 | 1358349886 | 01-DEC-2016 03:12:35 | ERR1755094

	SOC9/MDSD8_R2.fq.gz | File content missing or malformed, Number of lines in fastq is not multiple of 4 | 3729df0ab14b2f00e863780281ec69fc | 3324175122 | 01-DEC-2016 03:14:33 | ERR1755093

This is the check that is done on FastQ files

.. code-block:: bash

	zcat MCONS1_R1.fq.gz | grep -c [^[:space:]]

zcat and grep are commands that exist on the Linux platform as well as the Mac platform. 'zcat' uncompresses and prints the contents and the grep command will count the number of non-whitespace lines. A read in FastQ format is 4 lines long (header line + base calls + quality score header line + quality score calls) and so the total line count should be a multiple of 4. 

The output of the command above is simply divided by 4 and if a whole number is not reached an error is flagged and the email notification is sent. To remedy the error, upload a version of the file that has the correct line count (same file name and directory location as before (overwriting any pre-existing files)). You can check your files before uploading them using the above command on a linux machine. 

**IMPORTANT Final Step:** The new file you upload will have a different MD5 checksum to the registered MD5 checksum. The registered checksum for each file is provided in the table in the email (column 3). To remedy this follow this step from the previous section: `Outcome Two: Wrongly Registered MD5 checksum: Register new one`_

Error Type 3: File integrity check failed
-----------------------------------------

This error occurs when we can not unpack or read the file. The type of problem is related to the format of the file. Here are a few examples of the error notification that you might receive.

.. topic:: List of file processing errors:

	FILE_NAME | ERROR | MD5 | FILE_SIZE | DATE | RUN_ID/ANALYSIS_ID

	UK/BR1-20_2.fq.gz | File integrity check failed, Can't unzip file | ef7e73ed95f64355d7bf7d48636b704f | 3801612790 | 22-DEC-2016 04:08:41 | ERR0757927

	cetbiorep1.bam | File integrity check failed, File cannot be read using samtools | cecfa479356456cb6770986a6141bc44 | 800838646 | 24-MAY-2016 03:02:08 | ERR0332189 

	frger.cram | File integrity check failed, Can't count number of records in the file using cram tools | 807a0f61da013916c1ca5f60b9b42526 | 2347399950 | 11-JAN-2017 14:59:49 | ERR363314

The integrity checks are different for each file type but they follow the same principle.

File Types
^^^^^^^^^^

**for compressed fastq files**

.. code-block:: bash

	zcat BR1-20_2.fq.gz > /dev/null 2>&1
	echo $? # exit code of 1 or higher means that there was an error. 

The linux zcat command uncompresses the gzipped file (bzcat for bzip2) and parses it. The output is not important at this stage, just the exit code. The output (and any human readable error message) is redirected to /dev/null (a way of discarding it). If the exit code of the program is greater than 0 we know there was some issue in uncompressing the file and the error report gets generated. To fix the problem, check that your local file can be uncompressed. You can use a similar approach to above or try using the -t flag with gzip program (it tests the integrity of the gzipped file (gzip -t <filename>)).

**for BAM files**

.. code-block:: bash

	samtools view cetbiorep1.bam > /dev/null 2>&1
	echo $? # exit code of 1 or higher means that there was an error. 

Preliminary validation done on BAM files is simply to use samtools 'view' option on the BAM file to check that it can unpack and read the BAM. If the exit code of the program is greater than 0 we know that the samtools program was not able to fully read the BAM file and this triggers the error report to be emailed.

**for CRAM files**

CRAM files are similar to BAM files with some additional steps. The reference needs to be downloaded before the file can be unpacked. The validation checks are based on this process and you can test cram file integrity yourself before uploading the file in a similar way to the previous file formats.

.. **Fixing the error**

How to Fix
^^^^^^^^^^

1. Obtain a working file that passes the same preliminary test that our own validator applies. Upload the fixed file (same name and location as the previous version so as to overwrite it) to your Webin ftp directory.
2. The fixed file that you upload will have a different MD5 checksum to the registered MD5 checksum. The registered checksum for each file is provided in the table in the email (column 3). To remedy this follow this step from the previous section: `Outcome Two: Wrongly Registered MD5 checksum: Register new one`_
3. Do not attempt to re do the submission. Uploading the file and registering its checksum will be enough to fix the run object. Our system checks for updates to files regularly. This can take a few days depending on the file queue so please allow a couple of days for the emails to cease.
