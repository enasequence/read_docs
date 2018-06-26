Module 4: Add Read Files
************************

Read files are represented in the database as run objects which point to the file location in an FTP directory.
Runs also point to experiments, which describe the library preparation protocol and point to the sample and study for the data, as described in the below image:

.. image:: images/mod_01_p02.png
   :scale: 45
   :align: center

Before you register the run and experiment objects, you should have completed the following steps:

- `Register a study <mod_02.html>`_
- `Register a sample <mod_03.html>`_
- `Upload your read files <upload_01.html>`_

To start your read submission, log in to your Webin account and select the 'Submit sequence reads and experiments' radial in the 'New Submission' tab.

Step 1
======

.. image:: images/mod_04_p01.png

1. Select the study you wish to submit your data to.
   You may only add data to one study in each submission.
2. Click next to proceed to the next step, where you can register samples.
   It is recommended that you do this in advance, for which guidance can be found in the section `Sample Registration <mod_03.html>`_.
   If you have already registered your samples, click 'Skip'.

Step 2
======

.. image:: images/mod_04_p02.png

In this step, you will register the files you uploaded so that they may be archived.

1. Choose the type of file you will be submitting.
2. Fill out the fields to provide a description of your experiment.
3. The 'Sample Reference Suggestions' dropdown contains the aliases of any samples you registered in the previous step.
   If you didn't register your samples this way, it will be empty and you should manually enter a sample alias in the 'Sample Reference' field.
4. File names entered here must correspond exactly with the name of the file in your submission directory, including any subdirectories in which your file may exist.
5. A checksum is a fingerprint of your file which will allow us to verify that it was uploaded without any corruption.
   In Linux and Mac, you can generate this value from the command line by running the command 'md5' or 'md5sum' on the file.
   Microsoft has a `support article <https://support.microsoft.com/en-gb/help/889768/how-to-compute-the-md5-or-sha-1-cryptographic-hash-values-for-a-file>`_ on performing this activity for Windows.
6. If you are submitting many experiments, you may find it more convenient to download a template spreadsheet and enter your submission into this.
   Note that if you close the browser before you complete the submission, the details you have entered will be lost. A spreadsheet will help avoid this.
7. Click the 'Upload Spreadsheet' button to upload a spreadsheet you have prepared.
8. The 'Download Spreadsheet' button downloads a template containing all the information you have entered.
9. When you have completed the form and resolved any errors, click 'Submit' to finish.
