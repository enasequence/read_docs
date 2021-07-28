================================
Webin Submissions Portal Reports
================================


The `Webin Submissions Portal (WSP) <https://www.ebi.ac.uk/ena/submit/webin/>`_ is ENA's convenient interface for
creating and reviewing submissions.
This guide discusses it from the perspective of a user who wishes to review the content and status of their
existing submissions.
For advice on how to create submissions, please visit the general guide to `Interactive Submission <interactive.html>`_.
This page does not deal with updating your submissions, please see
`Interactive Metadata Update <../../update/metadata/interactive.html>`_ for advice on this.

To access WSP, visit the link and log in with your standard Webin credentials (or create an account if you don't
already have one): https://www.ebi.ac.uk/ena/submit/webin/

.. image:: ../images/webin_portal_login.png

WSP has a range of functionalities, listed below.
Those which are covered in this article are bolded:

- Submission of XML metadata objects
- Update of XML metadata objects
- Submission of studies
- Spreadsheet-based submission of samples, experiments, and runs
- **Reports on the content of submitted metadata objects**
- Acquisition of template spreadsheet for submission of short annotated sequences
- **Reports on the file content of run and analysis objects**
- **Reports on the processing status of submitted data files**
- Registration of new taxa
- **Reports on files which have been uploaded but not submitted**

All reports are enabled by the `Webin Reports Service </reports-service.html>`_, an API.


Metadata Reports
================


For each type of submission you may register with ENA, there is a report interface which will allow you to review its
details and in some cases update it.
Metadata reports are available for:

- Studies
- Samples
- Reads (Experiments and Runs)
- Analyses

From the `WSP <https://www.ebi.ac.uk/ena/submit/webin/>`_ dashboard, find the section for the type of object you wish
to review.
The below image shows the reports view for samples.
The interface is similar in look and functionality for all data types, but will vary in what attributes are shown.

.. image:: ../images/webin_portal_sample_reports.png

1. Enter the accession or name of a sample to search for it directly
2. Filter by release status (e.g. show only public samples)
3. Modify the maximum amount of rows to be shown: default 100
4. Download all the results of your query in a CSV file
5. Rows are sorted by accession number
6. Use the 'Action' button to access additional functions, such as editing and linking to related accessions


File Reports
============


Unsubmitted Files
-----------------

When submitting data to ENA, it is often necessary to upload the data files in advance of submission.
Your account comes with its own FTP area for this reason.
See `Preparing Files for Submission <../fileprep.html>`_ for information on this.

You can  review the content of your directory through `WSP <https://www.ebi.ac.uk/ena/submit/webin/>`_ Unsubmitted
Files Report.
Access this from the dashboard, under the 'Raw Reads' section:

.. image:: ../images/webin_portal_raw_reads_dashboard.png

The form will be automatically populated with a list of files from your submission area.
The name, size in bytes, and expiration date of the file is shown.
If a file is shown in this area, it is ready for you to submit it.
The expiration date refers to the fact that unsubmitted files are removed after 4 months, to minimise ENA storage
overheads.


Submitted Runs and Analyses
---------------------------

For analyses and runs there are reports available on archival of their associated files.
Access these in `WSP <https://www.ebi.ac.uk/ena/submit/webin/>`_.
These are the only two object types which have data files associated with them rather than just metadata.
These can be accessed from the WSP dashboard, look for the buttons named:

- Run Files Report
- Analysis Files Report

The below image shows the file report interface for runs; the interface for analyses is much the same.

.. image:: ../images/webin_portal_run_file_report.png

1. Enter the accession or name of a run to search for it directly
2. Filter by processing status: active, completed, or failed
3. Modify the maximum amount of rows to be shown: default 100
4. Download all the results of your query in a CSV file
5. Rows are sorted by accession number
6. The archival status of the submitted file
7. Use the 'Action' button to access additional functions, such as editing and linking to related accessions

Where archiving failure has occurred, you will also be informed of email, with information about the errors.
If your runs have failed archiving, you can often fix this yourself using information available in the
`Common Run Submission Errors FAQ <../../faq/runs.html>`_.

The information shown in this interface (for runs and analyses) deals with the archival of files, while the below
section deals with the processing of files.
For an explanation of the difference between these, please see `Appendix: Archival and Processing of Files`_.


Processing Reports
==================


Reports on the post-archival processing of files submitted with runs and analyses are available through
`WSP <https://www.ebi.ac.uk/ena/submit/webin/>`_.
From the dashboard, look for the buttons named:

- Run Processing Report
- Analysis Processing Report

Both reports will give you information on the outcome (if any) of file processing.
Below is an example of the analysis processing report:

.. image:: ../images/webin_portal_analysis_process_report.png

1. Enter the accession or name of an analysis to search for it directly
2. Filter by analysis type, or processing status: active, completed, or failed
3. Modify the maximum amount of rows to be shown: default 100
4. Download all the results of your query in a CSV file
5. Rows are sorted by accession number
6. Review the assigned sequence accessions of analysis submissions for which this is relevant
7. The file processing status of the submitted file: completed, failed, or active
8. Use the 'Action' button to access additional functions, such as editing and linking to related accessions

Note that while this interface allows you to check the processing status of your files, in cases where there are
failures you will most likely need to `contact the helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.

The information shown in this interface deals with the post-archival processing of files, while the above section
(`Submitted Runs and Analyses`_) deals with the archival of files.
For an explanation of the difference between these, please see `Appendix: Archival and Processing of Files`_.


Appendix: Archival and Processing of Files
==========================================


Two of sections in this page deal with the archiving and processing of files.
The archiving stage applies to all data files submitted to ENA, while the processing stage applies to only some files.
There are several different processing pipelines, the one used depends on the type and form of data submitted.

The archiving and processing procedures are described briefly here: this is not intended as an exhaustive look at them,
but may help provide some context to the status information given in the reports described above.

**File archival** applies to all data files submitted to ENA, whose formats are many and various, including FASTQ, BAM,
TSV, FASTA, EMBL flat file and others.
There are a few checks which must be passed in order to achieve archival.
These are either universal and apply to all files, or are so fundamental that they must be passed to confirm the file
is possibly valid.
Archiving includes:

- MD5 check - this uses the MD5 hashing algorithm to confirm that a file has been uploaded in full, by comparing a value
  before and after upload
- File integriy check - this uses a file-appropriate method to confirm that the content of the file is readable.
  Most commonly, this uses ``gzip``  test mode to confirm that a file compressed with gzip has readable content

If the 'Run Files Report' or 'Analysis Files Report' section indicates an error, it is this stage where an error
has occurred.

**File processing** applies to all runs in certain common formats (FASTQ, BAM, CRAM) and specific subtypes of analyses
(sequence assemblies, assembled/annotated short sequences, transcriptome sequence assemblies).

The content of these processing pipelines is beyond the scope of this article, but if either the 'Run Processing
Report' or 'Analysis Processing Report' reports an error, then it has occurred here.

**In either case** if an error is reported with your data, you may or may not have the ability to fix it as a user.
If in doubt, please `contact the helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ as attempting to fix submissions
will in some cases result in more errors.

Reports
=======


Studies
-------


The `Studies` report lists all studies submitted through your
submission account.

.. image:: ../images/webin_portal_studies.png)

The `Release date` shows when the study and any associated data
will be made public. If the `Release date` is in the future
then the `Status` will be `Private`. The status will become `Public`
once the the study release date expires.

In the above example, the status of the study is `Cancelled`. This
means that that study has been withdrawn before making it public.
Studies that are withdrawn after they have become public have
either `Suppressed` or `Killed` status.


Samples
-------


The `Samples` report lists all samples submitted through your submission account.

.. image:: ../images/webin_portal_samples.png

Like studies all samples have a `Status`.
Note that samples are automatically made public when data referring to them is made public.


Runs
----


The `Runs` report lists all sequence read experiments submitted through your submission account.

.. image:: ../images/webin_portal_runs.png

Sequence read experiments are defined using run and experiment metadata objects.
Data files are associated with runs while experiments link runs to studies and samples.

Run and experiment are automatically made public when the study they are part of is made public.


Analyses
--------


The `Analyses` report lists all analyses submitted through your submission account.

.. image:: ../images/webin_portal_analyses.png

Analyses can be of many different types.
Many analyses are automatically made public when the study they are part of is made public.
Some analyses will always be kept private while their data is made available through other services.


Run Files
---------


The `Run files` report lists all run files submitted through your submission account.

.. image:: ../images/webin_portal_run_files.png

The `Archive status` column value becomes `File archived` once the file has been incorporated into the archive.
Any pre-archival file validation errors are also shown in this column.


Analysis Files
--------------


The `Analysis files` report lists all analysis files submitted through your submission account.

.. image:: ../images/webin_portal_analysis_files.png

The `Archive status` column value becomes `File archived` once the file has been incorporated into the archive.
Any pre-archival file validation errors are also shown in this column.


Run Process
-----------


The `Run process` report lists the processing status of runs submitted through your submission account.

.. image:: ../images/webin_portal_run_process.png

When the `Process status` is `COMPLETED` then the run has been successfully processed by the archive.
Note that submitted files may be archived and available for download without them being succesfully processed.
In this case derived file products, such as archive generated Fastq files, may be missing.


Analysis process
----------------


The `Analysis process` report lists the processing status of analyses submitted through your submission account.

.. image:: ../images/webin_portal_analysis_process.png

When the `Process status` is `COMPLETED` then the analysis has been successfully processed by the archive.
In the above example, the status of the analysis is `CANCELLED`.
This means that that analysis processing has been cancelled and will no longer be attempted.

If any sequence accessions are assigned as part of the analysis processing then they will be listed in the `Sequence
accession` column.


Unsubmitted files
-----------------


Uploading a file to the Webin file upload area is not sufficient for inclusion into the archive.
The file must also be submitted through the Webin submission service either as a run or analysis.

The Webin file upload area is a temporary transit area.
Any unsubmitted files are subject to be removed according to `ENA fair use policy <../fileprep/upload.html>`_.

The unsubmitted file report shows uploaded files scheduled to be removed unless
submitted by the expiration date.

.. image:: ../images/webin_portal_unsubmitted_files.png
