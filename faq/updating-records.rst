=========================
Updating Existing Records
=========================


My Reads Are Linked To The Wrong Sample Or Study — How Do I Correct This?
-------------------------------------------------------------------------

Correct the **experiment**, not the run: the experiment object carries both the sample and the study reference.
You do not need to cancel and resubmit the run.

1. Log in to the `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/login>`_ and open the 'Runs Report'.
2. Find the affected run and open its 'Action' menu.
3. Choose the option to edit the **experiment** XML.
4. To attach the run to a different sample, change the accession in the ``<SAMPLE_DESCRIPTOR>`` element. To move it to
   a different study, change the accession in the ``<STUDY_REF>`` element.
5. Save your changes.

The same correction can be made programmatically by submitting an updated experiment XML.

The change takes effect immediately, but the public ENA Browser can take up to 48 hours to show the new association.

See `Experiment And Run Edits <../update/metadata/interactive.html#experiment-and-run-edits>`_.


Can I Add More Reads To A Study I Already Submitted?
----------------------------------------------------

Yes, at any time, provided you own the study.

There is no need to edit the study first: submit the reads as normal, referencing the existing study accession and the
relevant sample accessions.
If the study is already public, the new reads and their sample records become public once submission processing
completes.

See `Adding Reads To An Existing Study <../submit/reads.html#adding-reads-to-an-existing-study>`_.


How Do I Update A Genome Assembly?
----------------------------------

Assembly updates are submitted by you through Webin-CLI, and produce a new version of the assembly rather than a new
accession.

Reference the **same study and sample accessions** as the original submission — that pair is how ENA recognises the
submission as an update — and give the manifest a new, unique ``ASSEMBLYNAME``.

Some changes have extra conditions. Removing contamination, scaffolds or non-chromosomal contigs is fine, but removing
a **chromosome** needs to be arranged with ENA first, and a chromosome-level update must otherwise keep all previous
chromosomes present with their existing names.

See `Updating Assemblies <../update/assembly.html>`_ for the full set of rules.


Can ENA Change My Assembly's Metadata After Submission?
-------------------------------------------------------

Yes, for values you cannot edit yourself.
Contact the ENA `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with the assembly accessions and the exact change
required.

This covers values such as the assembly name and description, and sequencing kit information.
It also covers refreshing an assembly after a linked record changed — if you have corrected the organism name or taxon
on the linked sample, tell ENA, so the relevant pipeline can run and the assembly or WGS record can be refreshed to
match.
Allow up to a week after reprocessing for the change to appear publicly.

Note that the study and sample accessions an assembly is linked to **cannot** be changed after submission.


How Do I Change A Study's Title, Description Or Publications?
-------------------------------------------------------------

Edit the study yourself in the `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/login>`_ under 'Studies Report'.
The release date, title, description and publication references can all be changed there, and papers can be added by
searching their PubMed ID.

An object's own accession and alias can never be edited.

See `Study Edits <../update/metadata/interactive.html#study-edits>`_.
