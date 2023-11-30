================================
How to Submit Targeted Sequences
================================


.. _Introduction:

Introduction
============


The information on this page pertains to the submission of targeted sequences, typically short assembled and annotated
sequences representing interesting features or gene regions.
This is unrelated to the submission of genome assemblies annotated or otherwise, which is described in our `Assembly
Submission Pages <assembly.html>`_.
Submissions of this type very rarely exceed a few hundred individual sequences, and usually contain substantially less
than this.
Please do not use the information given here to submit thousands of sequences without prior approval as there may be a
more appropriate route.
If you're unsure whether this is the correct option for your submission, please
`contact the helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.

.. image:: images/metadata_model_sequences.png
   :align: center

All submissions of this type are submitted as 'analysis' objects with accessions resembling ERZxxxxxx.
However, analysis accessions of this type are not exposed.
Instead, specific sequence accessions are assigned later, and these are what should be used to reference the sequences.

Sequence submission requires that a study be registered first.
Please do this before attempting any of the guides shown below:

- `Register a Study <study.html>`_

There is also an option to link sequences to sample accessions in annotation checklists if preferred. However, this is
not mandatory.

- `Register a Sample <sample.html>`_

.. note::
   This submission route is for sets of stand-alone targeted assembled and annotated sequences only.
   If you intend to submit an annotated **assembly** such as a genome, please follow the `assembly submission guidelines
   <assembly.html>`_ and submit your assembly in EMBL flat file format.


.. _Accessions:

Accessions
==========


As all sequences in ENA are submitted as 'analyses', for each sequence set submission, you will receive a unique
analysis accession number that starts with ERZ.
This accession number is for internal processing only and will not be visible in the browser so do not reference
this number in publications, etc.
Furthermore, if your submission includes multiple sequences, the ERZ accession will not be unique to any one of them.
Instead, you will receive additional post-processing accession numbers for your sequences via email, each of which will
be unique to one of your sequences. You may also link sample accessions to your sequences if needed.

Always make a note of any accessions you receive as these are the unique identifiers for each of your submissions to
ENA.
You can use the ERZ accession to retrieve the assigned sequence accessions from the `Webin Portal
</general-guide/webin-cli.html>`_ or the `Webin Reports Service </general-guide/reports-service.html>`_.


.. _Submission Options:

Submission Options
==================


There are two ways in which targeted sequences can be submitted: all targeted sequences can be submitted in the
`EMBL flat file format </en/latest/submit/fileprep/flat-file-example.html>`_.
Alternatively, for commonly submitted types of sequence there are checklists which can be used for submission instead.
In checklist-based submission, you provide a spreadsheet of pre-defined attributes for each sequence, and our pipeline
automatically creates flat files based on these.

Annotation checklists provide greater ease of use, but may give you less control over your submissions.
Browse the available checklists at the below page to see if one meets your needs before proceeding:

- `List of Annotation Checklists <sequence/annotation-checklists.html>`_

Whether you submit with a flat file or a checklist spreadsheet, the actual submission is much the same and it is only
the preparation of these files which differs significantly.
The stages of your submission are illustrated in the below diagram:

.. image:: images/webin-cli_03.png

Refer to the relevant guide below on preparing your file:

.. toctree::
    :maxdepth: 1

    sequence/webin-cli-spreadsheet
    sequence/webin-cli-flatfile


Once you are satisfied that your file is correct, compress it with GZIP and proceed with the Webin-CLI submission
instructions below.


Submitting Your Sequences With Webin-CLI
----------------------------------------

To complete you submission you will need:

- A study accession number (see `Introduction`_)
- Sequences in spreadsheet or EMBL flat file format compressed with GZIP (see `Submission Options`_)
- A meaningful unique name for your submission.

In addition, you will need to have our Webin-CLI tool available on the machine from which you will submit your data.
For information on what this tool is and how to get started with it, including an instructional video for Windows
users, please refer to the `Webin-CLI general guide </general-guide/webin-cli.html>`_.
The linked page provides extensive detail on Webin-CLI and its use, but the information below should be enough to
complete your submission provided you are already able to run Webin-CLI.


Step 1: Prepare A Manifest File
_______________________________

The manifest file describes your submission to Webin-CLI.
It must be a plain text file with two columns, separated by a tab or other whitespace character.
Each line in the file consists of:

- Field name - *first column* - case insensitive field name
- Field value - *second column* - field value

The following manifest fields are supported for targeted sequence submission:

- STUDY: a study accession - *mandatory*
- NAME: a unique name for the submission - *mandatory*
- DESCRIPTION: free-text describing the submitted sequences - *optional*
- FLATFILE: name of a flat file containing sequences
- TAB: name of a spreadsheet containing sequences

Note that the FLATFILE and TAB fields are mutually exclusive.
You will have already prepared one of these file types as described in `Submission Options`_.

Below are two example manifest files, which you could copy into a plain text file and edit with appropriate values:

::

    STUDY        todo
    NAME         todo
    FLATFILE     <filename>.embl.gz


::

    STUDY        todo
    NAME         todo
    TAB          <filename>.tsv.gz



Step 2: Validate And Submit Files
_________________________________

Once you have successfully prepared your manifest file, you should be prepared to complete your submission.
Please refer to the `Webin-CLI general guide </general-guide/webin-cli.html>`_ if you do not have this program set up.

Webin-CLI has 'submission' and 'validation-only' modes.
Both of these will run the full validation suite on your submission, but only the submission mode will submit your file.
No submission is accepted before it has passed validation.
You are encouraged to run Webin-CLI in validate mode before attempting to submit.
An example validation command will resemble:

::

    webin-cli -username Webin-XXXXXX -password XXXXXX -context sequence -manifest manifest.txt -validate


This will review the contents of your manifest and sequence file and output a validation result, indicating a pass or
fail.
In the case of a failed validation, the output will point to the location of a file detailing the identified errors with
your submission.

Once validation is successful, proceed with a submission command:

::

    webin-cli -username Webin-XXXXXX -password XXXXXX -context sequence -manifest manifest.txt -submit


A successful submission will result in an analysis accession being immediately assigned.
After your sequences have been processed, you will be sent the assigned sequence accessions and copies of the flat
files by email.
Refer to the `Accessions`_ section above for an explanation of these.

See `Webin Portal Reports <../general-guide/submissions-portal.html>`_ for advice on retrieving information
about these submissions.