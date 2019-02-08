=================================================
Module 7: Genome Assembly Update and Resubmission
=================================================

You may need to update or resubmit a genome assembly for a number of reasons, such as:

- A mistake was made in the submission
- A file in the submission was found to contain errors
- You have new information to add to the assembly

The procedures described here can involve several manual steps on the part of ENA curators.
Therefore, if you are performing an update or resubmission, expect to be in contact with us and allow some time for the completion of this process.

Should you need to reupload files, review our `Data Upload <upload_02.html>`_ guide.
If you upload a replacement for a previously submitted file, be sure that the new filename is identical to the old one.


Updating Genome Assemblies
==========================

Occasionally, refinements to an assembly may justify a new version replacing an old one.
You can upload a new version of the assembly and keep the same accession, with a different version number.
All versions will remain visible, but the most up-to-date one will be the default.

If you need to change the details of the study or sample, but not the assembly itself, please view the `Sample and Study update page <mod_05.html>`_.

| Edits to the assembly itself could take the form of adding, removing or modifying sequences or their annotations.
| The general procedure involves repeating your submission, as described in the `Assembly Submission guide <mod_06.html>`_.
  As you do this, be sure to consider the following:

- Use the same study and sample accessions as in the original submission
- Use the same entry name as in the original submission
- Use a different assembly name in the new submission

| If you follow the above instructions, our pipeline will recognise your submission as an update of the original assembly and process it as such.
| We recommend you modify the submitted flat files and use these for your update submission.
  If your assembly is public, you can download these yourself.
  If it is private, you can request a copy by emailing datasubs@ebi.ac.uk making sure to include your submission account ID and any relevant accessions.


Preparing Files For Assembly Updates
------------------------------------

- If you are **changing the annotation** of your assembly, submit a flat file with the same sequence and the new annotation together.
  Your accession numbers will not be changed.
- If you are **changing the sequence** of your assembly, submit all the involved sequences, not just the new ones.
  You will receive new accession numbers formatted to indicate that this is a new build of an old assembly.
- If you are **adding chromosomes** to an assembly which contains only chromosomes, submit only the chromosome sequences to be added.
  The new sequence will be included under the same assembly accession (GCA_XXXXXXXX).

Resubmitting Genome Assemblies
==============================

Sometimes, due to errors in the submitted files an assembly submission will fail.
You will have identified this for yourself, or ENA will have contacted you about it.
In either case, the original submission must be cancelled before you can resubmit.
This should be requested via datasubs@ebi.ac.uk and you should await confirmation that it has been completed before you begin your resubmission.

When you are resubmitting, you should proceed as directed in the `Genome Assembly Submission <mod_06.html>`_ section with the mistakes omitted.
You should use the same study and samples which you registered for the first submission.
