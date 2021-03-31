===================
Updating Assemblies
===================

Updates to assemblies can be performed through `Webin-CLI <../submit/general-guide/webin-cli.html>`_, and result in the
creation of a new version of the assembly.

Updates to assemblies are performed in very similar fashion to submission of assemblies.
It is therefore sufficient to follow the guidance in the `assembly submission <../submit/assembly.html>`_ pages, while
considering the below factors. Note that this information applies only to updating the sequence and annotation, not
the general assembly metadata.

**Study and sample reference must be maintained:**
To submit an assembly update, make sure you reference the same study and sample accessions as were used in the original
submission.
In fact, this study-sample pair is unique to your assembly and is the means by which you submission is recognised as an
update rather than a new assembly.

Chromosome names must be maintained:
  | If you are updating a chromosome-level assembly, all chromosomes in the original assembly must be present in the
  | updated version, with identical name.
  | Webin-CLI does not currently validate for this and the error will only be caught after submission.
  | If you believe you may have mistakenly submitted an update with a chromosome absent or incorrectly named, please
  | contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.
  |
  | The chromosome name is the value our pipeline uses to identify which sequence in your update should be considered the
  | successor to each of the original chromosomes.
  | The name is specified in the chromosome list file, as well as in the identifier lines of your FASTA or the 'AC * '
  | lines of your EMBL file.
  |
  | Note that it is acceptable to include new chromosomes, as long as all previous chromosomes are maintained.
  | Also, it is acceptable to update a contig or scaffold-level assembly to a chromosome-level assembly, in which case
  | there are not yet any chromosome names to maintain.

Annotation status must be maintained:

  If your assembly was previously submitted with annotation and you are updating the assembly you can do this following
  the above factors, i.e. maintaining the study and sample, and adding an updated assembly including annotation.

  If your assembly did not originally include annotation, it is not possible to update your assembly with annotation.
  An unannotated assembly can only be updated with new versions of the same unannotated assembly.
  In order to add annotation to a previously unannotated assembly you need to re-submit the assembly.
  Note this will result in new accession numbers.
  Please contact the `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ to request suppression of the existing
  assembly version.

**Both the sequence and annotation may be updated, or just one**


**Use a new ASSEMBLYNAME:** The Webin-CLI manifest format includes an 'ASSEMBLYNAME' field. This must be unique in
each of your submissions, whether they are updates or new assemblies. Using a pre-existing assembly name will result
in an error informing you the object you are trying to submit already exists:

::

    ERROR: In analysis, alias:"webin-genome-ASSEMBLYNAME", accession:"". The object being added already exists in the submission account with accession: "ERZxxxxxxx". The submission has failed because of a system error.


To check the name used for the previous submission, look up its ERZ accession in interactive Webin. Enter the XML view
and find the 'alias' field, which will resemble "webin-genome-ASSEMBLYNAME".

**Taxonomy changes require our assistance:**
If there is a problem with the taxonomy of your sample, please contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.
This process will require first that the sample taxonomy be correct, so you are welcome to
`update your sample first <metadata/interactive.html>`_.
If the taxon you wish to use does not exist in the taxonomy database, you will need to
`request its addition <../faq/taxonomy_requests.html>`_.

**Contact us for other metadata updates:**
The advice given here pertains to updating the sequence and annotation (if applicable) of your assembly.
If you wish to change the assembly metadata values, such as the coverage, please contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.

**State of publicity will be the same:**
If the original assembly is already public, then the update will be made public as soon as processing is complete.
However, please be aware that this process can take some time to complete, and you should allow at least a week after
successful submission for your update to be apparent.

**Allow 30 minutes after original submission:**
If the update is submitted less than 30 minutes after the original submission, it will fail after submission.
This is a failsafe to prevent duplicate submissions, but does occasionally inconvenience some genuine use cases.

**Metagenomic Assemblies:**
Primary and binned metagenome assemblies cannot be updated.
If you wish to update one of these assemblies, please contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ so that we can suppress the existing version.
However, MAG assemblies work the same as isolate assemblies in the context of updates.
