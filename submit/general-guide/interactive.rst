======================
Interactive Submission
======================


Introduction
============

This guide will introduce you to the Webin Submissions Portal (WSP) service, which allows you to submit data to ENA
interactively through an ordinary web browser.


Production and Test Services
============================

There are two WSP services: one for test submissions and another for production (real) submissions.
The test service allows you to trial the interface in a consequence-free manner.
The test service is recreated from the full content of the production service every day at
03.00 GMT/BST. Therefore, any submissions made to the test service will be removed by the following day.

- Test service URL: https://wwwdev.ebi.ac.uk/ena/submit/webin/login
- Production service URL: https://www.ebi.ac.uk/ena/submit/webin/login

We advise and encourage that you trial your submissions using the Webin test service before using the production
service.


Limitations
===========

Some types of submission cannot be completed via WSP and must be done through our other submission routes.
For a summary of what can be submitted through each interface, as well as what these interfaces are, please read the
`General Guide on ENA Data Submission <../general-guide.html>`_.


Submission
==========

When you come to make a new submission, you will have the options described below.
Follow the links for specific guidance on each submission activity.


.. image:: ../images/wsp_dashboard.png

Account Management:
  **Edit Information:** Update the associated with your account, add new contacts for people using the account, and
  change your centre name, a value which is immutably attached to all your submissions

Metadata Registration:
  **`Register study (project)`_:** An interface to register new studies
  **`Register samples`_:** Select and customise a sample checklist, download a template spreadsheet, then re-upload it
  to this interface to register your samples
  **`Register taxonomy`_:** If your submission uses taxa which are not known to the taxonomy database, you can request
  their addition through this interface

Data Submission:
  **Submit XML:** All submissions are represented in whole or in part in XML format; you can submit directly in XML
  format through this interface or via Programmatic Submission
  **`Submit reads`_:** Select a type of read data and download a template spreadsheet, then re-upload it to this
  interface to complete registration of your read data
  **`Create annotated sequence spreadsheet`_:** Short pieces of assembled and annotated sequence such as single genes
  and others can often be submitted using template spreadsheets; select and customise a template here and download a
  file to submit via Webin-CLI

Reports:
  **Studies Report:** Review and edit previously submitted studies, and change their release date
  **Samples Report:** Review and edit previously submitted samples
  **Analyses Report:** Review and edit previously submitted analyses
  **Analysis File Report:** Review status of files associated with previously submitted analyses
  **Analysis Processing Report:** Review processing status of files associated with previously submitted analyses
  **Runs Report:** Review and edit previously submitted runs and experiments
  **Run Files Report:** Review status of files associated with previously submitted runs
  **Run Processing Report:** Review processing status of files associated with previously submitted runs
  **Unsubmitted Files Report:** Often, before you can submit a file you must `upload it to your account's FTP area`_;
  review the status of such unsubmitted files here


.. _Register study (project): ../study/interactive.html
.. _Register samples: ../samples/interactive.html
.. _Register taxonomy: ../../faq/taxonomy_requests.html

.. _Submit sequence reads and experiments: ../reads/interactive.html
.. _Create annotated sequence spreadsheet: ../sequence/interactive.html

.. _upload it to your account's FTP area: ../fileprep/upload.html

Each of these links will interfaces which provide further information on how to complete the described action.
Interactive submission is recommended for registration of your Study and Samples and for small scale Read submissions.