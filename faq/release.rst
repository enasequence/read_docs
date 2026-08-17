Data Release Policies
=====================


How Is Data Release Managed?
------------------------------

Data release is controlled from the level of study objects.
When a study is made public, all samples, experiments, runs and analyses associated with it are also made public.
For an explanation of these terms and their relationships, please read the
`Metadata Model <https://ena-docs.readthedocs.io/en/latest/submit/general-guide/metadata.html>`_ page.


Can I Advance/Postpone The Release Date?
----------------------------------------

Yes. You can edit the release date of a study from within your Webin account, provided it is private and has never been
public.

First, log into `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/>`_.
Click the 'Studies Report' button and find the study you wish to change the release date for.
Use the pencil icon next to the study to bring up a dialog which will allow you to set a new release date.
You can move the date to be sooner or later as required.
When making the date later, the new date cannot be more than 2 years beyond the current date.

.. image:: images/release_p01.png

When you are ready to release your study, you should do it by changing the release day to the present date.

Once the release date has elapsed, it will no longer be possible for you to affect the publicity of your data.
See further down the page for information on this.

# TODO: Avoid vague references to other, mention the specific Q&A, or ommit the sentence altogether. 
Apply this throughout the FAQ.


I Released My Study, Why Can't I Find It In The Public Database?
----------------------------------------------------------------

Release is not instantaneous, and the two archives update on different timescales:

- **ENA Browser**: allow up to 48 hours for your data to become searchable.
- **GenBank**: allow four days, as the record must first be exchanged with the INSDC partners.

Please take this into consideration if you have a strict deadline by which your data must be public.
Note that the processes which are taking place in this time are automated, and we are not able to intervene in order to
expedite the release of your data.

If after 48 hours your data remain private in the ENA Browser, please contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.

If your data are public in ENA but the corresponding record has still not appeared in GenBank several days later,
contact us as well: ENA and GenBank records are exchanged between the archives, and a record which has not appeared
after that point may indicate a validation or transfer problem rather than normal delay.


My Study Is Public, But The Browser Says There Is No Public Data Associated With It
-----------------------------------------------------------------------------------

This message on the project page can be misleading.
Check the project's 'Related Records' section, and for assemblies also check the 'WGS files' section.

The most common cause is searching by the wrong accession.
For each submission, Webin reports an analysis accession (ERZ...) which is used to track post-submission processing.
An ERZ accession may or may not be released with your submission and is not the accession to search by.
Submissions which complete processing receive public accessions, such as GCA... for a genome assembly or contig
accessions for sequences, and these are the accessions which become publicly searchable.
Look for your data using the public accessions.

Allow up to 48 hours after release for all elements to appear while processing and indexing complete.
If your data are still not available by their public accessions 72 hours after release, please contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.
For the accessions issued by each submission type, see
`Analyses And Accessions <../submit/general-guide/analysis-accessions.html>`_.


If My Project Is Already Public, Will New Data I Submit To It Become Public Automatically?
-------------------------------------------------------------------------------------------

Yes.
Data submitted to a project which is already public will become publicly visible once submission processing completes.
This applies to the sample records referenced by the new data as well as to the data themselves.
If you need the new data to remain confidential, submit them to a separate private study instead.


Can I Make My Study Partially Available?
----------------------------------------

Unfortunately, we do not support making only part of a submission available or restricting access to selected users.

Our policy is that submissions must be made available in full and be accessible to all users.

If your study contains data that you no longer wish to release, please contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ for assistance.

How Do I Remove A Study That Is Still Private?
----------------------------------------------

Records which are not yet public can be cancelled.
Contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with an explanation of the issue and be very clear
about which accessions should be removed, especially if you only want a few objects removed from the study.

See `Removing and Suppressing Data <suppression.html>`_ for what to include in your request and for guidance on
individual object types.


How Do I Remove A Study That Is Already Public?
-----------------------------------------------

Our policy is that data released into the public domain should remain public.
In limited circumstances a public record can be suppressed on request: contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with the accession(s) to be suppressed and an explanation of
the issue, and a curator will assess the request.
If the suppression is temporary, you must also provide a new release date.

Note that data which are public for even a short time may already have been mirrored to the other INSDC partners or
used by downstream services which we do not control.

The circumstances in which suppression is considered are set out in our
`Data Availability Policy <#what-do-the-data-availability-statuses-mean>`__, and the process is described in full in
`Removing and Suppressing Data <suppression.html>`_.


My Data Were Released Earlier Than I Intended — What Can I Do?
--------------------------------------------------------------

Release dates cannot be changed once they have elapsed, and data cannot be made private again by editing the study.

Where data were released earlier than intended — for example because a release date was set incorrectly, or was not
extended in time — temporary suppression may be possible.
Contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with the accessions, the reason the data need to be
removed from public access, and the new release date you require.
Once that date is reached the data will be re-released automatically, so contact us in good time if the date needs to
change again.

See `Removing and Suppressing Data <suppression.html>`_ for what suppression does and does not achieve.


What Do The Data Availability Statuses Mean?
--------------------------------------------

While the INSDC databases hold public data, there are several levels of data availability which control access to
these data.  These are described below.

+------------------+------------------------------------------+-------------------------------------------+
|   Status name    |   Causes                                 |   Implications                            |
+==================+==========================================+===========================================+
| **Public**       | | Data are submitted with no request for | Data are fully available.                 |
|                  | | private hold prior to publication      |                                           |
|                  | | or have reached an owner-agreed public |                                           |
|                  | | release date.                          |                                           |
+------------------+------------------------------------------+-------------------------------------------+
| **Private**      | | Data owner requires and indicates that | | Data are not available publicly through |
|                  | | confidentiality is required until a    | | any means. A release date is            |
|                  | | release date or publication in the     | | recorded for the data, which are        |
|                  | | literature, whichever comes earlier.   | | subsequently and automatically released |
|                  |                                          | | as **Public** on **reaching this date** |
|                  |                                          | | or **when cited online** or **in a**    |
|                  |                                          | | **publication prior to this date**. In  |
|                  |                                          | | the event that a release date must be   |
|                  |                                          | | extended, data owners are required to   | 
|                  |                                          | | follow the submission database's        |
|                  |                                          | | guidelines on how to extend the release |
|                  |                                          | | of their data. Alternatively, please    |
|                  |                                          | | `contact ENA`_ at least ten working     |
|                  |                                          | | days before the currently recorded      |
|                  |                                          | | release date.                           |
+------------------+------------------------------------------+-------------------------------------------+
| **Permanently**  | | Data are found to be incorrect with no | | Data are removed where possible from    |
| **Suppressed**   | | immediate opportunity on the part of   | | direct search tools (such as text and   |
|                  | | part of the owner to be updated.       | | sequence similarity search) but remain  |
|                  | | Possible causes include:               | | available by accession number.          |
|                  | |                                        | | Permanently Suppressed data is not      |
|                  | |  • incorrect annotation                | | expected to be re-released.             |
|                  | |  • incorrect source metadata           |                                           |
|                  | |  • incorrect sequence                  |                                           |
|                  | |  • poor quality sequence               |                                           |
|                  | |  • incorrect or misidentified source   |                                           |
|                  | |    organism                            |                                           |
|                  | |  • sample mix-up                       |                                           |
|                  | |  • sequence misassembly                |                                           |
|                  | |  • sequence contamination              |                                           |
|                  | |  • unallowed submission type           |                                           |
|                  | |  • erroneous submission                |                                           |
+------------------+------------------------------------------+-------------------------------------------+
| **Temporarily**  | | Data owners realize after sequences    | | Data are removed where possible from    |
| **Suppressed**   | | have been released that they failed to | | direct search tools (such as text and   |
|                  | | request a private status, either       | | sequence similarity search) but remain  |
|                  | | at the the time of submission, or      | | available by accession number.          |
|                  | | within the period between completion   | | Data will be re-released when published |
|                  | | of submission processing and the date  | | or after a certain date.                |
|                  | | on which the submission is normally    |                                           |
|                  | | made available to the public (this time|                                           |
|                  | | period can vary among the INSDC        |                                           |
|                  | | members).                              |                                           |
+------------------+------------------------------------------+-------------------------------------------+
| **Replaced**     | | Data owners generate new data under    | | Data are removed where possible from    |
|                  | | new accession identifiers that         | | direct search tools (such as text and   |
|                  | | directly replace existing data; if     | | sequence similarity search) but remain  |
|                  | | possible, updates should be made to the| | available by accession number. Where    |
|                  | | existing accession instead of creating | | possible, look-up by original accession |
|                  | | a new record with a new accession.     | | identifiers leads to a re-direct to new |
|                  | |                                        | | records available under the new         |
|                  | |                                        | | accession identifiers. In some cases,   |
|.                 | |                                        | | the original accession is added to the  |
|                  | |                                        | | new record as a secondary accession.    |
+------------------+------------------------------------------+-------------------------------------------+
| **Withdrawn**    | | (1) The submitter has requested a      | | Data are not directly available         |
|                  | | **Private** status or an extension to  | | publicly from INSDC partners through    |
|                  | | an existing release date, but the ENA, | | **any means**. However, because the data|
|                  | | or their submissions collaborator, has | | will have been distributed previously   |
|                  | | failed to apply the appropriate        | | as **Public**, the INSDC partners cannot|
|                  | | release date correctly.                | | exercise any control on the resultant   |
|                  | |                                        | | use of the data by third parties.       |
|                  | | (2) Data are found to have been        |                                           |
|                  | | submitted to the databases without the |                                           |
|                  | | permission of the rightful owner; this |                                           |
|                  | | is expected to be extremely rare and   |                                           |
|                  | | requires formal institutional contact  |                                           |
|                  | | with the aggrieved institution.        |                                           |
|                  | |                                        |                                           |
|                  | | (3) Human sequence data that was not   |                                           | 
|                  | | consented for unrestricted-access.     |                                           |
|                  | |                                        |                                           |
|                  | | (4) Serious events such as malfeasance |                                           | 
|                  | | or outright fraud                      |                                           |
+------------------+------------------------------------------+-------------------------------------------+

.. _`contact ENA`: https://www.ebi.ac.uk/ena/browser/support
