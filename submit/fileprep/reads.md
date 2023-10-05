# Accepted Read Data Formats

## Single cell read data

Single cell read data can be submitted in BAM, CRAM or multi-fastq format.

### BAM/CRAM format

Single cell read data can be submitted in the BAM or CRAM format using
the following tags specified in the [SAM Optional Fields Specification](https://samtools.github.io/hts-specs/SAMtags.pdf):
- CB: Cell identifier
- CR: Cellular barcode sequence bases (uncorrected)
- CY: Phred quality of the cellular barcode sequence in the CR tag

### Multi-fastq format

Multi-fastq data submissions can be made using the programmatic route or
Webin-CLI. This is done by entering multiple file names and their 
respective read_type qualifiers. For more information please see:

- [Multi-fastq using Webin-CLI](../reads/webin-cli.html)
- [Multi-fastq using the programmatic route](../reads/programmatic.html)

## Other read data

We recommend that all read data is submitted in the `BAM` or `CRAM` format.
However, please note that a variety of other data formats are supported as well.

## Sample de-multiplexing

Reads for different samples should be submitted using separate files. The
only exception is when a `BAM` or `CRAM` file contains reads for a large
number of samples intended to be always analysed together. In this case
the sample associated with the read file should describe the sample
group while the `BAM` or `CRAM` file should identify the sample
for each read.

## Standard formats

The following standard file formats are accepted and transformed into Fastq products:
- cram
- bam
- fastq

### CRAM format

Each submitted CRAM file must:
- be compatible with the [CRAM Format Specification](https://samtools.github.io/hts-specs/CRAMv3.pdf)
- be readable with [Samtools](http://www.htslib.org/)
- contain only reference sequences that exist in the CRAM Reference Registry
- be submitted as a separate run
- use the .cram file name suffix (e.g. 'a.cram')

CRAM file names are required to end up with the .cram suffix (e.g. 'a.cram').

A CRAM index (CRAI) file is created by the archive for each submitted CRAM file and is available in
the same directory as the CRAM file from which is was created. CRAM index file names
start with the CRAM file name and end up with the .crai suffix (e.g. 'a.cram.crai' for CRAM file 'a.cram').

### BAM format

Each submitted BAM file must:
- be compatible with the [SAM/BAM Format Specification](http://samtools.github.io/hts-specs/SAMv1.pdf)
- be readable with [Samtools](http://www.htslib.org/)
- be submitted as a separate run
- use the .bam file name suffix (e.g. 'a.bam')

#### PacBio BAM files

We support the submission of the following types of PacBio BAM files:
- subread BAM files (*.subreads.bam)
- CCS read BAM files (*.ccs.bam)

### Fastq format

We recommend that read data is either submitted in BAM or CRAM format.
However, single and paired reads are accepted as Fastq files that meet the following the requirements:

- Quality scores must be in Phred scale.
- Both ASCII and space delimitered decimal encoding of quality scores are supported. We will automatically detect the Phred quality offset of either 33 or 64.
- No technical reads (e.g. adapters, linkers, barcodes, primers) are allowed.
- Single reads must be submitted using a single Fastq file and can be submitted with or without read names.
- Paired reads must be submitted using two Fastq files.
- The first line for each read must start with '@'.
- The base calls and quality scores must be separated by a line starting with '+'.
- Paired read names must either use Casava 1.8 read names
(regular expression: `^@(.+)( +|\\t+)([0-9]+):[YN]:[0-9]*[02468]($|:.*$)`
or must end with `/1` or `/2` optionally followed by a space and a comment.
- Read names must not exceed a length of 256 characters.    
- The Fastq files must be compressed using gzip or bzip2.
- The regular expression for bases is "^([ACGTNactgn.]*?)$”

Example of Fastq file containing single reads:

```
@read_name
GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT
+
!''*((((***+))%%++)(%%).1***-+*''))**55CCF>>>>>>CCCCCCC65
...
```

Example of Fastq file containing paired reads (prior to Casava 1.8):

```
@read_name/1
GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT
+
!''*((((***+))%%++)(%%).1***-+*''))**55CCF>>>>>>CCCCCCC65
@read_name/2
GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT
+
!''*((((***+))%%++)(%%).1***-+*''))**55CCF>>>>>>CCCCCCC65
...
```

With Casava 1.8 the format of the '@' line has changed and we accept this pattern too:

```
@EAS139:136:FC706VJ:2:2104:15343:197393 1:Y:18:ATCACG
```

## Platform specific formats

### Oxford Nanopore

Oxford Nanopore native data must be submitted as a single tar.gz
archive containing basecalled fast5 files from Guppy, Metrichor, or Albacore.

For Metrichor, an example directory structure for run named XYZ:

```
XYZ/reads/downloads/fail/
XYZ/reads/downloads/pass/
```

How to archive all files in the XYZ downloads directory in a linux command line:

```
cd <directory containing XYZ directory>
tar -cvzf XYZ.tar.gz XYZ/reads/downloads/
```

### PacBio

PacBio data submissions are supported in the platform specific native format.

One run consists of *.bax.h5, *.bas.h5 and xml files. Please note that these files must not be tarred.

### SFF format

The SFF format is supported for the 454 and Ion Torrent platforms.

### 10x Genomics

To submit 10x Genomics data where read indexes exist, you must convert to BAM
or CRAM format. The supported tags are defined in the [SAM Optional Fields Specification](http://samtools.github.io/hts-specs/SAMtags.pdf)


## Deprecated formats

Read submissions are no longer accepted in the following formats:

- SOLiD native format (support ended in 2010)
- Illumina native format (support ended in 2010)
- SOLiD csfasta/qual format (support ended in 2015)
- Illumina qseq format (support ended in 2015)
- Illumina scarf format (support ended in 2015)
- SRF format (deprecated in 2015)
- Complete Genomics native format (deprecated in 2021)
