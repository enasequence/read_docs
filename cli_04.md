# Module 4: Annotated sequence spreadsheet submissions

Currently supported through the [Webin interactive submission interface](mod_01.html).

Planned to be supported in 2018 through the [Webin command line submission interface](cli_01.html).

<!---

## Introduction

Annotated sequences (e.g. 16S rRNA genes) can be submitted to the European Nucleotide Archive (ENA) 
as tab-separated (tsv) spreadsheets using the [Webin command line submission interface](cli_01.html) 
with `-context sequence` option. 
 
An annotated sequence submission consists of:
- General sequence information
   - Study accession or unique name (alias)
   - Unique name for the submission
- Sequences
- Functional annotation

The following picture illustrates the stages of the annotated sequence spreadsheet submission process:

![Submission process](images/webin-cli_02.png)

## Stage 1: Pre-register study

Each submission must be associated with a pre-registered study.

Instructions for interactive submitters:
- [Register a Study](mod_02.html)

Instructions for programmatic submitters:
- [Register a Study](prog_02.html)

## Stage 2: Prepare the files

The set of files that are part of the submission are specified using a manifest file.
The manifest file is specified using the `-manifest <filename>` option.

An annotated sequence spreadsheet submission consists of the following files:

- 1 manifest file
- 0-1 info files
- 1 tab-separated (tsv) spreadsheet containing the sequences and functional annotation

### Manifest file

The manifest file has two columns separated by a tab (or any whitespace characters):
- Field name (first column): case insensitive field name   
- Field value (second column): field value

The following metadata fields are supported in the manifest file:

- STUDY: Study accession or unique name (alias)
- NAME: Unique name for the submission 

The following file name fields are supported in the manifest file:

- TAB: tab-separated (tsv) spreadsheet containing the sequences and functional annotation 

For example, the following manifest file represents a submission:

```
STUDY   TODO
NAME   TODO
TAB    sequences.tsv.gz
``` 

### Info file

You can also provide the metadata fields in a separate info file. The info file has the same format as the manifest file.

When a separate info file is used then the manifest file must contain the `INFO` 
field pointing to the info file. 

For example, the following manifest file represents a submission:

```
INFO    sequences.info
TAB    sequences.tsv.gz
```

### Tab-separated (tsv) spreadsheet

Please download and fill a tab-separated (tsv) spreadsheet template
from the [Webin submission portal](portal_01.html):

[https://www.ebi.ac.uk/ena/submit/webin](https://www.ebi.ac.uk/ena/submit/webin)

- Step 1: Expand the 'Download spreadsheet template for annotated sequences' option from the 'Submit' page.

![Download sequence template spreadsheet step_1](images/webin_submit_annotated_sequences_01.png)

- Step 2: Press the 'Start' button.

![Download sequence template spreadsheet step_2](images/webin_submit_annotated_sequences_02.png)

- Step 3: Select the most appropriate checklist group.

![Download sequence template spreadsheet step_3](images/webin_submit_annotated_sequences_03.png)

- Step 4: Select the most appropriate checklist.

![Download sequence template spreadsheet step_4](images/webin_submit_annotated_sequences_04.png)

- Step 5: Select the checklist fields and click 'Next' at the botton of the page.

![Download sequence template spreadsheet step_5](images/webin_submit_annotated_sequences_05.png)

- Step 6: Click 'Download' button to download the spreadsheet template.

![Download sequence template spreadsheet step_6](images/webin_submit_annotated_sequences_06.png)


## Stage 3: Validate and submit the files

Files are validated, uploaded and submitted using the [Webin command line submission interface](cli_01.html). 
Please refer to the [Webin command line submission interface](cli_01.html) documentation for more information 
about the submission process.

## Assigned accession numbers

Once the sequences have been submitted an analysis (ERZ) accession number is immediately assigned and 
returned to the submitter by the Webin command line submission interface. 

The purpose of the ERZ accession number is for the submitter to be able to refer to their submission within the 
Webin submission service. For example, the submitter can retrieve the assigned sequence accessions 
from the [Webin XML and reports portal](prog_11.html) or from the [Webin reports service](prog_10.html) using
the ERZ accession number.

For sequences, long term stable accession numbers that can be used in publications are:

- Study accession (PRJ) assigned at time of study registration.
- Sequence accession(s) assigned once the submission has been fully processed by ENA.

Submitters can retrieve the sequence accession numbers from the [Webin XML and reports portal](prog_11.html) 
or from the [Webin reports service](prog_10.html). These accession numbers are also send to the submitters by
e-mail.

-->