==============================
Submit Raw Reads Interactively
==============================

Read files are represented in the database as run objects which point to the file location in an FTP directory.
Runs also point to experiments, which describe the library preparation protocol and themselves point to the sample and study for the data, as described in the below image:

.. image:: images/mod_01_p02.png
   :scale: 45
   :align: center

Before you register the run and experiment objects, you should have completed the following steps:

- `Register a study <study/interactive.html>`_
- `Register a sample <samples/interactive.html>`_
- `Upload your read files <fileprep/upload.html>`_

To start your read submission, log in to your Webin account and select the 'Submit sequence reads and experiments' radial in the 'New Submission' tab.

Step 1: Choose A Study To Add To
================================

.. image:: images/mod_04_p01.png

1. Select the study you wish to submit your data to.
   You may only add data to one study in each submission.
2. Click next to proceed to the next step, where you can register samples.
   It is recommended that you do this in advance, for which guidance can be found in the section `Sample Registration <samples/interactive.html>`_.
   If you have already registered your samples, click 'Skip'.

Step 2: Describe Your Experiments
=================================

In this step, you will register the files you uploaded so that they may be
archived, and provide metadata explaining how they were produced.

1. First, you will need to select the file format your runs are to be submitted
   in:

.. image:: images/mod_04_p02.png
    :scale: 50 %
    :align: center

2. If you switch to any of the other tabs while filling out run information, the
   information you have already entered in the New Submission tab will be
   preserved:

.. image:: images/mod_04_p03.png

3. You can download a template spreadsheet to enter details of your submission
   into, then reupload it later to complete your submission.
4. The third button will download the spreadsheet containing any information you
   have already entered.

.. image:: images/mod_04_p04.png

5. Fill out each field to provide a description of your experiment.
6. The 'Sample Reference' box must contain the accession or alias of a sample
   you have registered with us.
7. The 'Sample Reference Suggestions' box will contain references to any
   samples you registered in the previous step, but will otherwise be empty. In
   the latter case, look up the appropriate aliases and enter them manually.
8. Use the green cross to add more rows.

.. image:: images/mod_04_p05.png

9. The file name must exactly correspond with the name of a file in your upload
   directory including any subdirectories (see the top of this page if you have
   not uploaded your files.
10. The checksum is a 'fingerprint' of the file which will allow us to verify
    that it was uploaded successfully. In Linux and Mac, you can generate this
    value from the command line by running the command 'md5' or 'md5sum' on the
    file, while Microsoft has a `support article <https://support.microsoft.com/en-gb/help/889768/how-to-compute-the-md5-or-sha-1-cryptographic-hash-values-for-a-file>`_
    on performing this activity for Windows.

.. image:: images/mod_04_p06.png

11. When you have filled out all the information you need to, click 'Submit' to
    finish submission. Accession numbers will be provided as soon as the
    submission is completed.

.. image:: images/mod_04_p07.png
    :scale: 50 %
    :align: center
