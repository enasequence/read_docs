======================
Data Files and Formats
======================



What File Formats Can I Submit?
-------------------------------

The accepted format depends on the type of data.

- **Raw reads**: FASTQ, BAM and CRAM, plus some platform-specific native formats. BAM or CRAM is recommended.
- **Genome and transcriptome assemblies**: FASTA, or EMBL flat file where the assembly carries functional annotation.
- **Annotated sequences**: EMBL flat file, or the TSV annotation templates.

See `Preparing Files for Submission <../submit/fileprep.html>`_ for the full requirements for each format, including
file naming, compression and checksums.


How Do I Submit My Data?
------------------------

There are three submission routes, and which you can use depends on the data type.

- **Interactive**: fill in web forms in the Webin Portal, and download template spreadsheets to complete offline and
  upload. This is usually the most accessible route.
- **Programmatic**: prepare your submission as XML or JSON documents and send them to ENA with a program such as cURL,
  or through the Webin Portal.
- **Webin-CLI**: ENA's command-line program, which validates your submission fully before it completes. It gives you the
  most control, and is **required** for assemblies and targeted sequences.

Raw reads can be submitted by any of the three.
See `Submission Options <../submit/reads.html#submission-options>`_ for reads, or
`Getting Started <../submit/general-guide.html#getting-started>`_ for the matrix of which route applies to each
data type.


Can I Submit Oxford Nanopore POD5 Files?
----------------------------------------

No.
POD5 is not currently supported, and ENA cannot accept submissions in that format while its longer-term approach to
Oxford Nanopore native formats is under review.

Submit Oxford Nanopore reads as **FASTQ** instead.
BAM is also accepted, for either aligned or unaligned reads.

See `Oxford Nanopore <../submit/fileprep/reads.html#oxford-nanopore>`_.

To be told if this position changes, subscribe to the
`ena-announce mailing list <https://listserver.ebi.ac.uk/mailman/listinfo/ena-announce>`_.


I Have Uploaded My Files — Is That Enough To Submit Them?
---------------------------------------------------------

No.
The Webin upload area only stages your files; it does not submit anything.
Copying files there by FTP, Aspera or any other means leaves them unsubmitted until you complete a submission that
references them.

Assemblies and targeted sequences must be submitted with **Webin-CLI**, which performs the validation and processing
those routes require.
Reads can be submitted interactively, programmatically or with Webin-CLI.

To confirm an assembly submission succeeded, open the 'Analyses Report' in the
`Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/login>`_; the assigned GCA and contig accessions appear in the
analysis processing report.


My Upload Fails To Authenticate, But I Can Log In To Webin
----------------------------------------------------------

When the Webin Portal accepts your credentials in a browser but FTP, Aspera or Webin-CLI uploads fail to authenticate,
the cause is usually the network path rather than the credentials.

1. Retry the upload — transfer problems are occasionally transient.
2. Try Aspera instead of FTP, or FTP instead of Aspera.
3. Try from a machine outside your institutional or HPC network. If it works elsewhere, the restriction is on your
   network, and `Configuring Your Firewall For ENA Upload
   <../submit/fileprep/upload.html#appendix-configuring-your-firewall-for-ena-upload>`_ lists the ports and addresses
   your IT department needs to permit.

If network access is not the cause, contact the ENA `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with the exact
error message and any transfer logs.
