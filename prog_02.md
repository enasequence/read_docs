# Module 2: Submit an Annotated Sequence

*under construction*

Annotated sequences can be any number of sequences that are assembled from shorter reads or sequenced using Sanger capillary sequencing. They can be annotated with features such as coding domains, introns, exons, non coding RNA etc. Typical sequences submitted to the ENA are rRNA genes, single CDS genomic DNA sequences, MHC genes, mRNA and many more. Most submitters will use the [interactive WebIn Submission system](https://www.ebi.ac.uk/ena/submit/sra/#submissions) to submit these types of sequences:

![annotated sequences](images/prog_02_p01.png)

This is a guide for programmatic submission of annotated sequences. This submission route is useful for automating your submissions if you expect to be submitting large numbers of sequences at regular intervals. For one off or small scale submissions you are encouraged to use [Webin](https://www.ebi.ac.uk/ena/submit/sra/#submissions) instead.

#### Step 1: Create a project

If you already have a project you can add your annotated sequence entries to it. If you do not you need to create one first. Use either the <a href="./mod_02.html">interactive submission route</a> or the <a href="./prog_01.html">programmatic submission route</a> to do this.

#### Step 2: Get hold of the TSV template

Sequences are submitted as tsv spreadsheets. You can use [Webin](https://www.ebi.ac.uk/ena/submit/sra/#submissions) submission option "Submit other assembled and annotated sequences [formerly EMBL-Bank]" to get hold of the template that you will be using. You will only need to do this once for each type of sequence that you are submitting. After you have the template(s) you can submit without logging in to Webin.

![annotated sequences](images/prog_02_p02.png)

For this example I chose sequence type *rRNA gene* and then navigated to the page where there was an option to download the template:

![annotated sequences](images/prog_02_p03.png)

The downloaded file is called something like "Sequence-ERT000002-5697110325950293078.tsv". Take note of the ERT number which in this example is `ERT000002`. It represents the sequence type (rRNA gene in this case). This is required later - the system needs to know the sequence type so that it can create the right EMBL file from the TSV. To fill in the TSV you can use a spreadsheet editor. Each row in the tsv is a separate sequence record. The last column is for the sequence and the others are for annotation fields. It is a bit like a FASTA except that the header and sequence are on one line instead of two and the fields are tab separated.

### Step 3: Upload the TSV to your FTP directory


### Step 4: Prepare the Analysis XML file

The TSV is sent to ENA processing using the XML REST API. Create an analysis object to wrap the tsv. Note that the analysis references a study (see step 1 above) and the tsv file, and the ERT number. In this example I changed the name of the tsv but you do not have to. 

```xml
<?xml version = '1.0' encoding = 'UTF-8'?>
<ANALYSIS_SET>
   <ANALYSIS alias="ethylomonas" center_name="">
      <TITLE>16S of Methylomonas sp.</TITLE>
      <DESCRIPTION>16S Methylomonas sp.</DESCRIPTION>
      <STUDY_REF accession="PRJEB19775">
      </STUDY_REF>
      <ANALYSIS_TYPE>
         <SEQUENCE_FLATFILE/>
      </ANALYSIS_TYPE>
      <FILES>
         <FILE checklist="ERT000002" checksum="5831463bb16a4c14374a0962d5a353cc" checksum_method="MD5" filename="ethylomonas.tsv.gz" filetype="tab"/>
      </FILES>
   </ANALYSIS>
</ANALYSIS_SET>
```
