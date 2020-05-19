===================
Updating Assemblies
===================

Updates to assemblies can be performed through `Webin-CLI <../submit/general-guide/webin-cli.html>`_, and result in the
creation of a new version of the assembly.

Updates to assemblies are performed in very similar fashion to submission of assemblies.
It is therefore sufficient to follow the guidance in the `assembly submission <../submit/assembly.html>`_ pages, while
considering the below factors:

**Study and sample reference must be maintained:**
To submit an assembly update, make sure you reference the same study and sample accessions as were used in the original
submission.
In fact, this study-sample pair is unique to your assembly and is the means by which you submission is recognised as an
update rather than a new assembly.

**Chromosome names must be maintained:**
If you are updating a chromosome-level assembly, all chromosomes in the original assembly must be present in the
updated version, with identical name.
Webin-CLI does not currently validate for this and the error will only be caught after submission.
If you believe you may have mistakenly submitted an update with a chromosome absent or incorrectly named, please
contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.

The chromosome name is the value our pipeline uses to identify which sequence in your update should be considered the
successor to each of the original chromosomes.
The name is specified in the chromosome list file, as well as in the identifier lines of your FASTA or the 'AC * '
lines of your EMBL file.

Note that it is acceptable to include new chromosomes, as long as all previous chromosomes are maintained.
Also, it is acceptable to update a contig or scaffold-level assembly to a chromosome-level assembly, in which case
there are not yet any chromosome names to maintain.

**Annotation status must be maintained:**
If your assembly was previously submitted with annotation and you are updating the assembly you can do this following
the above factors, i.e. maintaining the study and sample, and adding an updated assembly including annotation.

If your assembly did not originally include annotation, it is not possible to update your assembly with annotation.
An unannotated assembly can only be updated with new versions of the same unannotated assembly.
In order to add annotation to a previously unannotated assembly you need to re-submit the assembly.
Note this will result in new accession numbers.
Please contact the `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ to request suppression of the existing
assembly version.

**Some metadata can be updated:**
However, not all can. Please contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ for queries about this
topic.

**State of publicity will be the same:**
If the original assembly is already public, then the update will be made public as soon as processing is complete.
However, please be aware that this process can take some time to complete, and you should allow at least a week after
successful submission for your update to be apparent.

**Metagenomic Assemblies:**
Primary and binned metagenome assemblies cannot be updated.
If you wish to update one of these assemblies, please contact our
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ so that we can suppress the existing version.
However, MAG assemblies work the same as isolate assemblies in the context of updates.
