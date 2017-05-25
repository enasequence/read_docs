# Module 3: Entry Upload - Submit an EMBL Sequence File

*under construction*

Annotated sequence entries are stored in the ENA as EMBL format sequence files. [Here](http://www.ebi.ac.uk/ena/data/view/KU963029&display=text) is an example of an HLA gene in EMBL format. It is a text file that is computer readable due to the 2 character line beginnings (ID, AC, DE ...). The ENA browser renders the text file into a friendlier and more graphical [view](http://www.ebi.ac.uk/ena/data/view/KU963029) but the computer readable version is still available so that automatic pipelines down stream of the ENA can download and parse large numbers of sequence entries.

## Create your own EMBL sequence file

It is not trivial to submit an EMBL sequence file because of the specific formatting that is required. In most cases it is not necessary because the interactive tool [Webin](https://www.ebi.ac.uk/ena/submit/sra/#home) provides spreadsheet templates for various types of sequences so that you can submit using a tab separated file (TSV) which you can fill in using any spreadsheet editor. After the submission via Webin or via <a href="./prog_02.html">programmatic REST API</a> the TSV is converted into an EMBL format sequence file and validated, and accessions are delivered. 

Not all sequence types are available as a TSV spreadsheet template. For instance the HLA gene above has multiple exons and this is difficult for us to turn into a template. Typically the more complicated sequences with multiple and repeating features are the hardest to make into TSV templates. For these types of sequences you can create an EMBL sequence file yourself and submit it to the ENA using the programmatic REST API. This is called "submission by entry upload".

For a list of sequence types that are available for TSV spreadsheet submission see here:
[http://www.ebi.ac.uk/ena/submit/annotation-checklists](http://www.ebi.ac.uk/ena/submit/annotation-checklists)

Please do not use submission by entry upload for any sequence type listed on the above webpage. The spreadsheet submission route is more robust because we do the file conversion.

For examples of EMBL sequence files that are not available for submission by spreadsheet see here: 
[http://www.ebi.ac.uk/ena/submit/entry-upload-templates](http://www.ebi.ac.uk/ena/submit/entry-upload-templates) 

Pay close attention to how the sequences are files are formatted. Use the web page above to construct your sequence file. This will be submitted by entry upload. As with a TSV submission (module 2) you need to create an analysis object in XML format to wrap the EMBL sequence file. Please check <a href="./prog_02.html#the-analysis-object">module 2: Analysis object</a> for more information.  To see how the analysis object and the sequence entries will be accessioned please refer to <a href="./prog_02.html#a-word-about-accession-numbers">module 2: A word about Accession Numbers</a>


## Submission by Entry Upload

Submitting an EMBL sequence file is the same as submitting a tab separated file, so much of the detail is in <a href="./prog_02.html">module 2</a>). The main difference is that for tsv spreadsheet submissions the tab/tsv file is converted to an EMBL sequence file and then validation is applied. For a submission by entry upload, the conversion is omitted because the file is already in EMBL format. The system will try to validate your EMBL sequence file after only minimal processing. There is more opportunity for error but this can be remedied by following the [guidelines](http://www.ebi.ac.uk/ena/submit/entry-upload-templates) closely.

### Step 1: Create a project

As with a TSV submission (module 2), a project is required. If you already have a study you can add your annotated sequence entries to it. If you do not you need to create one first. Use either the <a href="./mod_02.html">interactive submission route</a> or the <a href="./prog_01.html">programmatic submission route</a> to do this. Note the project accession number when you receive it.

### Step 2: Compress and upload the sequence file

As with a TSV submission, the sequence file must be compressed and uploaded to your Webin ftp directory. You may also need to calculate the MD5 checksum. Check <a href="./prog_02.html#step-3-upload-the-tsv-file-to-your-ftp-directory">here</a> and <a href="./file_prep.html">here</a> for instructions.
In this example I have an EMBL file called **Human_parvovirus_B19_entryupload.embl** which I have compressed to create file **Human_parvovirus_B19_entryupload.embl.gz**. The checksum of **Human_parvovirus_B19_entryupload.embl.gz** is `7138bf3320cad8d215b7e9930ded114b`.

### Step 3: Create the analysis XML






