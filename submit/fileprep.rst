==============================
Preparing Files for Submission
==============================

All files that are submitted to ENA need to be in the appropriate format to be accepted.

In the case of any data submitted `Interactively <general-guide/interactive.html>`_ or 
`Programmatically <general-guide/programmatic.html>`_ you will also need to register the 
md5 checksum of your files and upload these to your Webin Upload Area prior to submission. 

If data is submitted using `Webin-CLI <general-guide/webin-cli.html>`_ there is no need 
to register md5 checksums or previously upload data as the tool will do all this for you 
at the time of submission.

Below, you can find guides on the formats available for read and assembly submissions, as
well as information on the EMBL flat file format, with templates.
These are followed by sections on general steps you may need to take to prepare your file
to be uploaded, and finally, how to carry out the actual upload.

.. toctree::
   :caption: Creating and Formatting Files
   :maxdepth: 1

   fileprep/reads
   fileprep/assembly
   fileprep/sequence-flatfile


.. toctree::
   :caption: Compressing and Uploading Files
   :maxdepth: 1

   fileprep/preparation
   fileprep/upload
