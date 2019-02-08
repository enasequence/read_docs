=====================================
Module 1: Preparing A File For Upload
=====================================

For submissions using the interactive or RESTful submission services, it is necessary to transfer data files to ENA, after which you can formally submit them. Guidance on how to do this is given below.

Please note that if you are submitting via Webin-CLI, you do not need to perform this upload step as it is handled for you by the program.

Most files uploaded to the ENA FTP server need to be:
1. Compressed
2. Have their MD5 checksum registered


Step 1: Compress The File Using gzip Or bzip2
=============================================

Files that are in a human readable text format (FastQ, FastA, VCF, tsv, csv ...) must be compressed before they are uploaded to the ENA FTP server.
Files that are not in a human readable text format like BAM, CRAM, SFF are already in a format that is efficient for transferring so additional compression is not required and should not be used.
With the exception of Oxford Nanopore FAST5 files, do not tar archive any collections of files - each should be uploaded separately.

If you are unsure about the format that your files should be in, please view our [read data formats](https://ena-docs.readthedocs.io/en/latest/format_01.html) page. This includes advice on general read data formats, as well as information specific to platforms or sequencing applications.

Tools for compressing files in gzip or bzip2 format are included in Linux and Mac distributions. Below is a simple example of the appropriate syntax for compressing a file named 'eg_01.fq':

.. code_block:: bash

    user_01$ gzip eg_01.fq


The result of this would be a file named 'eg_01.fq.gz'. Files can always be decompressed later:

.. code_block:: bash
    user_01$ gunzip eg_01.fq.gz


The `-k` flag can be used to retain the original file. This results in two files: the original uncompressed file and a compressed copy:

.. code_block:: bash
    user_01$ gzip -k eg_01.fq.gz


For Windows users, 3rd party tools are available to accomplish this. The standard compression type used in Windows, ZIP, is not accepted in ENA submissions.


Step 2: Record The MD5 Checksum For The File
=============================================

MD5 is a hash function that can be done on any file to create a 32 character string that is unique to that file.
It is a bit like a fingerprint for the file. If the contents of the file change in any way the MD5 checksum will change as well.
The file name *can* change without affecting the MD5 checksum because the calculation is done on the contents of the file only.
We ask that users provide the MD5 value for their files so that we can recalculate it on a file we receive. This allows us to be sure the file has been uploaded in its entirety.

Functions for calculating MD5 value are included with Linux and Mac distributions. See below for an example of how this may be done:

.. code_block:: bash

    user_01$ md5 eg_01.fq.gz
    MD5 (eg_01.fq.bz2) = 74f085a6f3dd8b2877b89fcb592c7f5c
    user_01$ md5 eg_01.fq.gz > eg_01.fq.gz.md5


Note that the MD5 value for this file is `74f085a6f3dd8b2877b89fcb592c7f5c`.
The second command in the above box generates no output, because the user directs the output to a file with the same name as the compressed FASTQ file but with '.md5' appended.
Creating and uploading a .md5 file is one way you can register your file's MD5 value.
Sometimes the correct command is 'md5sum' instead of 'md5':

.. code_block:: bash

    user_01$ md5sum eg_01.fq.gz
    MD5 (eg_01.fq.bz2) = 74f085a6f3dd8b2877b89fcb592c7f5c


For Windows users, 3rd party tools can be found to carry out these checks.


Registering The MD5 Checksum With ENA
-------------------------------------

In the example above the data file to be submitted is called ``eg_01.fq.bz2``
It is a compressed version on the original ``file eg_01.fq``. Compressing large files is advantageous because it takes less time to transfer them and this increases the likelihood of a complete transfer without corruption.
The MD5 checksum of file ``eg_01.fq.bz2`` is contained in file ``eg_01.fq.bz2.md5``. ENA requires the checksum that you have calculated so that we can compare it to the one that we calculate once the file is on our ftp server. So you can upload this **checksum file** in addition to the data file and our system will find it. As long as you abide by the naming convention XXX.md5 where XXX is the name of the data file and XXX.md5 is a text file containing the MD5 checksum ENA will understand.

This is not the only way to register the checksum for a data file. When you come to submit the uploaded data file you will find that you can include the 32 character checksum string in with the submission metadata. If you do include the checksums in with the metadata at submission time then you do not have to accompany each data file with an md5 file at upload time. Also note that the ENA file uploader (one of the [upload options](upload_01.html) available) will automatically create an MD5 file for every data file that it uploads and it will deposit this MD5 file (using the naming convention discussed) along with the data file on the ftp server. That means that you do not need to provide MD5 checksums in the metadata at submission time if you have used the ENA file uploader.

You can not pool checksums from several data files into a single md5 file. The ENA file processing system will not be able to interpret this. Each file must have its own md5 file (if you are choosing to register it that way)


File Validation Errors
----------------------

A common cause of file validation errors is when the checksum that you provide does not match the one that we have calculated. Automatic email notifications are set up to alert you of these problems. Remember the data file will not be validated until you have submitted it - uploading a data file does not constitute a submission. If you do receive an email about checksum mismatches then there is a chance that your transfers could not complete 100% and the files are corrupted. It could also be the case that you accidentally registered the wrong checksum. You can re-upload any file you like. Make sure it has the same name and is placed in the same subdirectory (if any) as the original. This should solve a corrupt file issue if the second upload is 100% successful because its checksum will now match the registered checksum. Alternatively if you believe the wrong checksum is registered simply upload a new checksum file with the correct MD5 checksum in it. The file processing system at ENA checks and recalculates all unvalidated files cyclically so once there is a match between the calculated and the registered MD5 value the file will be validated. You do not have to repeat any part of the submission but the queue of unvalidated files is variable so at busy times it can still take some time for the error notifications to cease. It is recommended to re-upload the data file and a checksum file so that both scenarios are covered and your file will be validated without any further trouble.

There are other possible validation errors. For example we may not be able to uncompress your data file because it is corrupted. You will need to upload a fixed version of the data file but you must **always** accompany fixed files with checksum files because you know that the new file will have a different MD5 checksum compared with the original because you have changed it. Often submitters provide a fixed file but forget to update the registered checksum so the validation still fails. Also remember that replacement data files must always have the same file name as the original or the system will not pick it up as a replacement. If the file name itself must change it is usually to submit a new data file and cancel the problem submission. For most validation errors this is completely unnecessary so do not be tempted to repeat a submission if you do not have to!


Step 3: Uploading the File
--------------------------

This is the final step before the submission. Instructions for this are well detailed already:
[Data Upload](upload_01.html)

Remember to upload the checksum file in addition to the data file unless you are going to register the checksum at submission time or you are using the ENA file uploader instead. Here is a basic example of using FTP to upload a data file called 'eg_01.fq.bz2' and its md5 file 'eg_01.fq.bz2.md5'. The example is using the Terminal application in the Mac operating system. See above link for more detailed instructions.

.. code_block:: bash

    user_01$ ftp webin.ebi.ac.uk
    Connected to hh-webin.ebi.ac.uk.
    220 (vsFTPd 2.2.2)
    Name (webin.ebi.ac.uk:user_01): Webin-XXX
    331 Please specify the password.
    Password:
    230 Login successful.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp> mput eg_01.fq.bz2
    229 Entering Extended Passive Mode (|||42382|).
    150 Ok to send data.
    100% |********************************************************************************************************************************|    51       25.65 KiB/s    00:00 ETA
    226 Transfer complete.
    50000 bytes sent in 05:00 (1.57 KiB/s)
    ftp> mput eg_01.fq.bz2.md5
    229 Entering Extended Passive Mode (|||41642|).
    150 Ok to send data.
    100% |********************************************************************************************************************************|    54       48.20 KiB/s    00:00 ETA
    226 Transfer complete.
    54 bytes sent in 00:00 (1.92 KiB/s)
    ftp> bye
    221 Goodbye.
