# Module 1: Tools Overview

This section describes tools that can assist in making Webin submissions.

## Validate flat files

You can use sequence flat files to describe nucleotide sequences, functional annotation and other related information.

Full details of the format are available from the following documents:

* [Flat file format specification](<ftp://ftp.ebi.ac.uk/pub/databases/embl/doc/usrman.txt>)
* [Feature table specification](<http://www.insdc.org/documents/feature-table>)


If you use the [Webin command line interface](general-guide/webin-cli.html) then the flat files will be automatically
validated during the submission process.

If you are submitting flat files through another Webin service
then please first validate your flat files using the [ENA flat file validator](tools_02.html).

### How to create flat files

We recommend that you prepare flat files and functional annotation using [Artemis](http://www.sanger.ac.uk/science/tools/artemis).
Artemis is a free annotation tool that allows visualisation and editing of sequence features.

### How to convert GFF3 files into flat files

If you already have your annotated sequences in the GFF3 format you can try [EMBLmyGFF3](https://github.com/NBISweden/EMBLmyGFF3)
to convert them into sequence flat files.

## Validate AGP files

You can use AGP files to describe the assembly of longer sequences from shorter ones.

If you use the [Webin command line interface](general-guide/webin-cli.html) then the AGP files will be automatically
validated during the submission process.

If you are submitting AGP files through another Webin service then please
first validate your AGP files using the [NCBI AGP validator](https://www.ncbi.nlm.nih.gov/assembly/agp/AGP_Validation/).
