Removing and Suppressing Data
=============================


ENA's policy is that data released into the public domain should remain public.
Once a record has been released it becomes part of the permanent scientific record, is mirrored across the INSDC
partners, and is picked up by downstream services which ENA does not control.
Removal after release is therefore an exception rather than a routine operation, and each request is assessed by a
curator before it is carried out.

Records which have never been public are different: these can be cancelled on request, and this is a normal part of
correcting a submission.

This page describes both routes.
For the circumstances in which each availability status applies, see the
`Data Availability Policy <release.html#what-do-the-data-availability-statuses-mean>`_.


# TODO: Re-frame section as Q&A

Cancellation And Suppression Are Not The Same
---------------------------------------------

**Cancellation** applies to records which are still private and have never been released.
Cancelled records are never made public.
They remain visible in your Webin account with a status of 'Cancelled' so that your submission history stays complete.

**Suppression** applies to records which are already public.
Suppressed records are removed from search where possible, but they remain retrievable by accession number and cannot
be recalled from third parties who obtained them while they were public.

If you are not sure which applies to your records, check their status in the
`Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/>`_ before contacting us.


What Should I Include In My Request?
------------------------------------

Send your request to our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ and include:

- the accession of every record you want removed;
- what should happen to records associated with them, and in particular anything you want kept;
- an explanation of why removal is needed;
- a new release date, if you are asking for temporary suppression rather than permanent removal.

Be explicit about scope.
A request to remove 'the project' is ambiguous: it may mean the study record alone, or the study together with its
samples, runs and analyses.
If you ask for part of a project to be removed, we will normally check whether you meant only the accessions you listed
or everything associated with the project, and this exchange delays the request.


How Do I Remove Records That Have Never Been Public?
----------------------------------------------------

Private records can be cancelled.
This covers records which were registered by mistake, are duplicates, were created for testing, or are simply no longer
needed.

Contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with the accessions and a clear statement of what
should be cancelled.
Cancelled records will not be released on their release date.

Private objects other than assemblies can also be cancelled programmatically without contacting us, using the
``CANCEL`` action in the submission XML.
See `Submission XML: cancel objects <../submit/general-guide/webin-v1.html#submission-xml-cancel-objects>`_.

Note that ``CANCEL`` propagates: cancelling a study also cancels its associated experiments and analyses, and
cancelling an experiment also cancels its associated runs.
If you only want part of a study removed, target the individual objects rather than the study.
This route cannot be used on public records.


How Do I Remove Records That Are Already Public?
-------------------------------------------------

Public records can only be suppressed by ENA, and only where the request meets the criteria in the
`Data Availability Policy <release.html#what-do-the-data-availability-statuses-mean>`_.
Circumstances in which suppression is considered include incorrect or contaminated sequence, incorrect source metadata,
a misidentified source organism, a sample mix-up, an erroneous submission, and data released earlier than the submitter
intended.

Contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with the accessions and an explanation.
A curator will assess the request and carry it out if it is deemed suitable.

Suppression may be permanent or temporary.
If you need the records to be released again later, say so and provide the new release date; the data will then be
re-released automatically when that date is reached.
Contact us in good time if that date subsequently needs to change.


What Happens To Data Once It Is Suppressed?
--------------------------------------------

Suppressed records are removed where possible from direct search tools, including text search, sequence similarity
search and the ENA APIs.
They remain available by accession number, and the ENA Browser will still display the record, marked as suppressed, to
anyone who looks it up by its exact accession.
Suppressed metadata are decoupled from the other components of the project.

Search indexes are not updated immediately; allow a day or two for a suppression to be reflected in the browser and in
search results.

Suppression does not undo release.
Data which have been public for even a short time may already have been downloaded, mirrored to the other INSDC
partners, or incorporated into downstream databases.
ENA cannot guarantee that this has not happened, and cannot control how such copies are subsequently used.

# TODO: Re-frame section as Q&A

Removing Specific Object Types
-------------------------------

Reads, Runs And Experiments
+++++++++++++++++++++++++++

Runs and experiments can be removed without affecting the samples they reference.
This is the usual route when the wrong files were submitted, when files were assigned to the wrong run, or when a
submission failed validation and needs to be replaced.

The sample accessions remain intact and can be reused for the corrected submission.
When you resubmit, use experiment and run aliases which do not clash with the removed submission; the file names
themselves can be reused.
The corrected submission will receive new run and experiment accessions.

If you also need the samples removed, ask for that explicitly and list their accessions.


Samples
+++++++

Sample records can be cancelled where they were registered by mistake, are duplicates, or are no longer needed.
Provide the sample accessions and state which of them should be removed.

Note that a sample which is left intact can be reused in a new submission, so it is often unnecessary to remove samples
when you are only correcting the data attached to them.


Genome Assemblies
+++++++++++++++++

An incorrect assembly can be removed so that a corrected version can be submitted.
This includes assemblies submitted under the wrong project.

Where the assembly is being corrected rather than withdrawn, consider whether an assembly update is the better route:
updates preserve the accession and add a new version.
See `Update Assembly <../update/assembly.html>`_.

Once the incorrect assembly has been removed, submit the corrected version.
If the resubmission produces validation errors, reply on the same helpdesk thread with the error message.


Studies And Projects
++++++++++++++++++++

A study or project can be removed on its own or together with its associated data.
If the study has no linked samples or sequence data, only the study record is cancelled.

State which associated records should be removed and which should be kept.
Where sample records are left intact, their accessions remain usable for other submissions.


Can I Request Removal Of Records In Another Webin Account?
----------------------------------------------------------

Requests are actioned for the account which owns the records.
If the records belong to another Webin account, we will normally need written confirmation from the current account
owner before acting, or you will need to be added as a contact on that account first.

See `Register a Submission Account <../submit/general-guide/registration.html>`_ for how account contacts are managed.

Data brokers cannot suppress data once it has been publicly released, because those data have already been exchanged
with the INSDC partners.
See `Brokering Data to ENA <../submit/general-guide/data-brokering.html>`_.


How Do I Release Temporarily Suppressed Data?
----------------------------------------------

If records were temporarily suppressed and are now ready to be public, contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ and ask for them to be released.

For run records, provide the corresponding experiment accessions as well as the run accessions, as both are needed to
process the request.
