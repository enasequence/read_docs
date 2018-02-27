# Read data formats

We recommend that read data is either submitted in BAM or CRAM format. However,
read data can be submitted in several standard and platform specific formats.
Please note that reads must always be de-multiplexed into separate files prior submission.

## Standard formats

The following standard file formats are accepted and transformed into Fastq products:
- cram
- bam
- fastq

### CRAM format

Submitted CRAM files must be readable with [Samtools](http://www.htslib.org/)
and the reference sequences must exist in the CRAM Reference Registry.

CRAM file names are required to end up with the .cram suffix (e.g. 'a.cram').

A CRAM index (CRAI) file is created by the archive for each submitted CRAM file and is available in
the same directory as the CRAM file from which is was created. CRAM index file names 
start with the CRAM file name and end up with the .crai suffix (e.g. 'a.cram.crai' for CRAM file 'a.cram').

### BAM format

Submitted CRAM files must be readable with [Samtools](http://www.htslib.org/).

BAM file names are required to end up with the .bam suffix (e.g. 'a.bam').

### Fastq format

We recommend that read data is either submitted in BAM or CRAM format. 
However, single and paired reads are accepted as Fastq files that meet the following the requirements:

- Quality scores must be in Phred scale. 
- Both ASCII and space delimitered decimal encoding of quality scores are supported. We will automatically detect the Phred quality offset of either 33 or 64.
- No technical reads (adapters, linkers, barcodes) are allowed.
- Single reads must be submitted using a single Fastq file and can be submitted with or without read names.
- Paired reads must split and submitted using either one or two Fastq files. The read names must have a suffix identifying the first and second read from the pair, for example '/1' and '/2' (regular expression for the reads: "^@([a-zA-Z0-9_-]+:[0-9]+:[a-zA-Z0-9]+:[0-9]+:[0-9]+:[0-9-]+:[0-9-]+) ([12]):[YN]:[0-9]*[02468]:[ACGTN]+$").
- The first line for each read must start with '@'.
- The base calls and quality scores must be separated by a line starting with '+'.
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
archive containing basecalled fast5 files from Metrichor or Albacore.

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
