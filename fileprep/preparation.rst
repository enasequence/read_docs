===========================
Preparing A File For Upload
===========================

For submissions using the interactive or RESTful submission services, it is
necessary to transfer data files to ENA, after which you can formally submit
them. Guidance on how to perform the upload step is given below.

Please note that if you are submitting via Webin-CLI, you do not need to
perform this upload step as it is handled for you by the program. However,
Webin-CLI will still require you to compress some files, which you can learn
how to do below.

Most files uploaded to the ENA FTP server need to:

  1. Be compressed
  2. Have their MD5 checksum registered


Step 1: Compress The File Using gzip Or bzip2
=============================================

Files that are in a human-readable text format (such as FASTQ or FASTA) must be
compressed before they are uploaded to the ENA FTP server. Files that are not
in a human readable text format like BAM, CRAM, SFF are already in a compact
format so additional compression should not be used. With the exception of
Oxford Nanopore FAST5 files, do not tar archive any collections of files - each
should be uploaded separately.

If you are unsure about the format that your files should be in, please view
our `read data formats <../fileprep/reads.html>`_ page. This includes advice on general
read data formats, as well as information specific to platforms or sequencing
applications.

Tools for compressing files in gzip or bzip2 format are included in Linux and
Mac distributions. Below is a simple example of the appropriate syntax for
compressing a file named ``eg_01.fq``:

.. code-block:: bash

    gzip eg_01.fq

The result of this would be a compressed file named ``eg_01.fq.gz``.
Files can always be decompressed later:

.. code-block:: bash

    gunzip eg_01.fq.gz

The ``-k`` flag can be used to retain the original file.
This results in two files: the original uncompressed file and a compressed copy:

.. code-block:: bash

    gzip -k eg_01.fq.gz

For Windows users, third party tools are available to accomplish this.
The standard compression type used in Windows, ZIP, is not accepted in ENA
submissions.


Step 2: Record The MD5 Checksum For The File
=============================================

MD5 is a function which can be applied to a file to create a 32 character
string. This string is unique to the file and functions like a fingerprint: if
the contents of the file change in any way the MD5 checksum will change as well.
The file name can change without affecting the MD5 value because the calculation
is done on the contents of the file only. You must provide the MD5 value for
your files so that we can be sure they transferred successfully and completely.

Calculating and registering an MD5 value is not necessary if you are using
Webin-CLI, as the program handles this for you behind the scenes.

Functions for calculating MD5 value are included with Linux and Mac
distributions. Below you can see an example command, along with its output:

.. code-block:: bash

    md5 eg_01.fq.gz
    MD5 (eg_01.fq.bz2) = 74f085a6f3dd8b2877b89fcb592c7f5c

Note that the MD5 value for this file is ``74f085a6f3dd8b2877b89fcb592c7f5c``.

The command in the below box generates no output, because the user directs the
output to a file with the same name as the compressed FASTQ file but with
``.md5`` appended. Creating and uploading a ``.md5`` file is one way you can
register your file's MD5 value.

.. code-block:: bash

    md5 eg_01.fq.gz > eg_01.fq.gz.md5

Sometimes the correct command is ``md5sum`` instead of ``md5``:

.. code-block:: bash

    md5sum eg_01.fq.gz
    MD5 (eg_01.fq.bz2) = 74f085a6f3dd8b2877b89fcb592c7f5c

For Windows users, 3rd party tools can be found to carry out these checks.


Registering The MD5 Checksum With ENA
-------------------------------------

As described above, you can register your file's MD5 value by outputting it to
a second file and uploading this along with the data file. Alternatively, you
can make a note of the value and enter it when prompted during the submission
process.

The Webin File Uploader is a program provided by ENA covered `here
<fileprep/upload.html>`_ which can be used to upload your files. It also
automatically creates ``.md5`` files and uploads them for you.

If you make and upload your own ``.md5`` file, be sure it contains only the 32
digit MD5 value for a single file, and that its name matches the name of that
file.


File Validation Errors
======================

Improperly compressed files and incorrect MD5 values are two of the most common
errors encountered when processing submitted read files. Often, this happens
because the file upload was incomplete. When this occurs, you are automatically
notified by email. Guidance on fixing such errors is given in our `common run
submission errors <../faq/runs.html>`_ page.


Next Steps
==========

Once you have compressed your files and recorded their MD5 values in some way,
proceed to upload them:

    `Data Upload Documentation <upload.html>`_.


Fair Use Policy
===============

ENA is a permanent and comprehensive data repository for public domain sequence
and associated information. Data submitted into this system are routed
transiently through users' private data upload areas until such time as a
submission instruction from the user, through his/her use of the Webin system,
leads to the validation of the data and the movement of files from the data
upload area into the ENA.

The data upload areas are provided as a temporary place in which data are held
while in transit. As such, they are neither intended nor suitable for any
longer-term storage of data. Such storage is provided in ENA itself. Once in
ENA, data can be released immediately following submission or can be held
confidential prior to analysis and literature publication if required.

We expect any given data file to remain in a data upload area for no longer
than 2 months before the instruction is given by the user to submit the file.
While we attempt to remind users of this policy at the 2 months time point we
reserve the right to routinely delete any data files that persist in them for
more than 2 months.

We place no absolute limit within the 2-month period on the total volume of
user data that may exist in a data upload area at any one time and are keen to
accommodate the largest submissions where possible. However, we strongly
encourage continuous data submissions where files are uploaded and submitted in
small patches of few Terabytes or less and expect that volumes would not exceed
10 Terabytes under normal circumstances. Unexpected heavy use of the data
upload areas may have an impact on other Webin users and we are grateful for
users' attention to this aspect of our fair use policy.
