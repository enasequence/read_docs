=========================================================
How to Download Data files from ENA using enaBrowserTools
=========================================================

enaBrowserTools is a set of scripts that interface with the ENA web services to download data from ENA easily,
without any knowledge of scripting required.

You will need to have Python installed and have a basic understanding on how to use the Command Line.

Download `enaBrowserTools <https://github.com/enasequence/enaBrowserTools>`_ and have a look through the
`README <https://github.com/enasequence/enaBrowserTools/blob/master/README.md>`_ for guides on installation, set
up and general usage. The tutorials below will walk you through some examples of how to use enaBrowserTools to
download data from ENA.

enaDataGet
==========

To download all data for a given accession, use the command "enaDataGet". This works for data-holding accessions such
as Sequence records, Assembly records, Run or Analysis records or WGS sets.

Begin by printing the command's "help" to the screen so you can see what arguments are available for enaDataGet:

.. code-block:: bash

   > enaDataGet --help

Review the help until you are happy with what the command does and how to use it.

Now, let's try an example and download the data files that are in the sequencing run
`ERR164409 <https://www.ebi.ac.uk/ena/browser/view/ERR164409>`_.

We can see from the help output that raw reads are available in 'submitted', 'fastq' and 'sra' formats:

- submitted - the file format provided by the submitter when they provided their data to the archive
- fastq - the standardised ENA fastq format (where the sequence names in the file are standardised)
- sra - a file format that works with the NCBI tool `SRAToolkit <https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?cmd=show&f=software&m=software&s=software>`_.

Simply choose the desired file format, specify the accession and provide a destination directory and the raw read file
will be downloaded:

.. code-block:: bash

   > enaDataGet -f fastq -d <destination/directory> ERR164409

Unless you provide a destination directory, the data will be downloaded to the directory from which you
run the command so it's advised to use a '-d' argument in your command.

In this case, the run ERR164409 has a library layout of SINGLE. If the sequencing data was paired-end then this command
would download both files.

Including Metadata
------------------

If you wanted to also download the Run metadata, you could do this by including the "-m" argument which will also
download the ENA Record in XML format:

.. code-block:: bash

   > enaDataGet -f fastq -d <destination/directory> -m ERR164409

Note that the XML metadata download option is only available for Run and Analysis records.

enaGroupGet
===========

The command "enaGroupGet" allows download of all data files of a certain type of Record that are associated with
a Study, Sample or given Taxon. This means you can download all raw reads in a Study or all analyses of a Sample etc.
in bulk.

Begin by printing the command's "help" to the screen so you can see what arguments are available for enaGroupGet:

.. code-block:: bash

   > enaGroupGet --help

Review the help until you are happy with what the command does and how to use it.

Now, let's try an example and download all the raw read files associated with the Sample
`SAMEA2591084 <https://www.ebi.ac.uk/ena/browser/view/SAMEA2591084>`_.

Again we know that raw reads are available in 'submitted', 'fastq' and 'sra' formats so let's try and download
the submitted files this time. Please note that if data was submitted via one of our INSDC partners (NCBI or DDBJ) as
opposed to through ENA, these submitted files will not be available.

.. code-block:: bash

   > enaGroupGet -f submitted -d <destination/directory> SAMEA2591084

In this case, 6 files should be downloaded.

Including Metadata
------------------

If you wanted to also download the metadata for all the resulting Runs, you could do this again by including the
"-m" argument:

.. code-block:: bash

   > enaGroupGet -f submitted -d <destination/directory> -m SAMEA2591084
