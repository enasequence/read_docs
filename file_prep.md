# Preparing a file for Upload

Most files submitted to the ENA need to be transferred to the ENA server in a process that is separate from the submission itself. When we talk about submissions we are usually talking about registering the metadata- the information about the file and about where it comes from. This metadata usually gets registered in the form of objects. For example a sample object represents the physical source material that is sampled for eventual sequencing. The file itself can be the result of sequencing the sample, such as the output of the sequencing machine. Having a separate transfer step means that files can be large and handled separately without interrupting or delaying the submission/registration steps. When data files are uploaded to the ENA ftp server the submission is not complete. There is usually more to come by way of this metadata registration. For instance, a read file submission requires project, sample, experiment, and run objects, while a whole genome FASTA file needs a sample and a project object. An annotated sequence submission requires at the very least a project object to belong to.

Most files uploaded to the ENA ftp server need to be
1. Compressed
2. Have their MD5 checksum registered

## Step 1: Compress the file using gzip or bzip2

Files that are in a human readable text format (FastQ, FastA, VCF, tsv, csv ...) are compressed before uploading them to the ENA ftp server. Files that are not in a human readable text format like BAM, CRAM, SFF are already in a format that is efficient for transferring so additional compression is not required (the file will fail to validate if it is wrongly compressed). Also, with the exception of Oxford Nanopore files, do not tar archive any collections of files - each should be uploaded separately. 

If you are unsure about the format that your files should be in you can check [here](http://www.ebi.ac.uk/ena/submit/read-file-formats#standard_formats) for standard file formats and [here](http://www.ebi.ac.uk/ena/submit/read-file-formats#platform_specific_formats)  for platform specific formats.

Tools used for compressing files are 3rd party so you can find out more about how to do this from outside the ENA (a simple web search should be sufficient). However here is a basic example of compressing a file from within a Mac operating system using the Terminal application.

```bash
user_01$ ls *fq
eg_01.fq
user_01$ gzip eg_01.fq 
user_01$ ls *gz
eg_01.fq.gz
user_01$ gunzip eg_01.fq.gz 
user_01$ ls *fq
eg_01.fq
user_01$ bzip2 eg_01.fq 
user_01$ ls *bz2
eg_01.fq.bz2
user_01$ 

```

In the above example the user has listed all files in the current directory that ends in 'fq' (there is one called 'eg_01.fq'). The user then compresses the file with 'gzip' command, then reverts it back to uncompressed form with 'gunzip' command. Next the user compresses the file with 'bzip2' command. Note that files that are compressed end in '.gz' or '.bz2' depending on what tool is used.

## Step 2: Calculate the MD5 checksum for the file

Md5 is a hash function that can be done on any file to create a 32 character string that is unique to that file ([see](https://en.wikipedia.org/wiki/MD5) the Wikipedia page on MD5). It is a bit like a fingerprint for the file. If the contents of the file change in any way the MD5 checksum will change as well. The file name *can* change without affecting the MD5 checksum because the calculation is done on the contents of the file only. The idea is that when you transfer your large file to us it may not get transferred 100%. If you tell us the MD5 checksum of the file that you have before it is uploaded and then we calculate the checksum of the file that has been uploaded to us we can tell if the upload was successful. If the checksum we calculate matches the one you provided then the transfer was a success.

Hash functions are a common way of testing file identity and integrity so you can find out more about how to do this from outside the ENA (a simple web search should be sufficient). However here is a basic example of calculating the checksum for a file called 'eg_01.fq.bz2' using the Terminal application within the Mac operating system.

```bash
user_01$ md5 eg_01.fq.bz2 
MD5 (eg_01.fq.bz2) = 74f085a6f3dd8b2877b89fcb592c7f5c
user_01$ md5 eg_01.fq.bz2 > eg_01.fq.bz2.md5
user_01$ cat eg_01.fq.bz2.md5 
MD5 (eg_01.fq.bz2) = 74f085a6f3dd8b2877b89fcb592c7f5c
```

In the above example the user uses command 'md5' to calculate the checksum for the file. In a Linux operating system this is equivalent to 'md5sum' command. Then the user does it again, but redirects the output to a file called 'eg_01.fq.bz2.md5'. Finally the user checks the contents of the new file. This is an md5 file and can be used to register the MD5 checksum of the original file with ENA.

### Registering the MD5 checksum with ENA

In the example above the data file to be submitted is called 'eg_01.fq.bz2'
It is a compressed version on the original 'file eg_01.fq'. Compressing large files is advantageous because it takes less time to transfer them and this increases the likelihood of a complete transfer without corruption.
The MD5 checksum of file 'eg_01.fq.bz2' is contained in file 'eg_01.fq.bz2.md5'. ENA requires the checksum that you have calculated so that we can compare it to the one that we calculate once the file is on our ftp server. So you can upload this **checksum file** in addition to the data file and our system will find it. As long as you abide by the naming convention XXX.md5 where XXX is the name of the data file and XXX.md5 is a text file containing the MD5 checksum ENA will understand. 

This is not the only way to register the checksum for a data file. When you come to submit the uploaded data file you will find that you can include the 32 character checksum string in with the submission metadata. If you do include the checksums in with the metadata at submission time then you do not have to accompany each data file with an md5 file at upload time. Also note that the ENA file uploader (one of the [upload options](http://www.ebi.ac.uk/ena/about/sra_data_upload) available) will automatically create an MD5 file for every data file that it uploads and it will deposit this MD5 file (using the naming convention discussed) along with the data file on the ftp server. That means that you do not need to provide MD5 checksums in the metadata at submission time if you have used the ENA file uploader.

You can not pool checksums from several data files into a single md5 file. The ENA file processing system will not be able to interpret this. Each file must have its own md5 file (if you are choosing to register it that way)

### File Validation Errors

A common cause of file validation errors is when the checksum that you provide does not match the one that we have calculated. Automatic email notifications are set up to alert you of these problems. Remember the data file will not be validated until you have submitted it - uploading a data file does not constitute a submission. If you do receive an email about checksum mismatches then there is a chance that your transfers could not complete 100% and the files are corrupted. It could also be the case that you accidentally registered the wrong checksum. You can re-upload any file you like. Make sure it has the same name and is placed in the same subdirectory (if any) as the original. This should solve a corrupt file issue if the second upload is 100% successful because its checksum will now match the registered checksum. Alternatively if you believe the wrong checksum is registered simply upload a new checksum file with the correct MD5 checksum in it. The file processing system at ENA checks and recalculates all unvalidated files cyclically so once there is a match between the calculated and the registered MD5 value the file will be validated. You do not have to repeat any part of the submission but the queue of unvalidated files is variable so at busy times it can still take some time for the error notifications to cease. It is recommended to re-upload the data file and a checksum file so that both scenarios are covered and your file will be validated without any further trouble. 

There are other possible validation errors. For example we may not be able to uncompress your data file because it is corrupted. You will need to upload a fixed version of the data file but you must **always** accompany fixed files with checksum files because you know that the new file will have a different MD5 checksum compared with the original because you have changed it. Often submitters provide a fixed file but forget to update the registered checksum so the validation still fails. Also remember that replacement data files must always have the same file name as the original or the system will not pick it up as a replacement. If the file name itself must change it is usually to submit a new data file and cancel the problem submission. For most validation errors this is completely unnecessary so do not be tempted to repeat a submission if you do not have to!

## Step 3: Uploading the file

This is the final step before the submission. Instructions for this are well detailed already:
[http://www.ebi.ac.uk/ena/about/sra_data_upload](http://www.ebi.ac.uk/ena/about/sra_data_upload)

Remember to upload the checksum file in addition to the data file unless you are going to register the checksum at submission time or you are using the ENA file uploader instead. Here is a basic example of using FTP to upload a data file called 'eg_01.fq.bz2' and its md5 file 'eg_01.fq.bz2.md5'. The example is using the Terminal application in the Mac operating system. See above link for more detailed instructions.

```
user_01$ ftp webin.ebi.ac.uk
Connected to hh-webin.ebi.ac.uk.
220 (vsFTPd 2.2.2)
Name (webin.ebi.ac.uk:user_01): Webin-XXX
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> mput eg_01.fq.bz2
229 Entering Extended Passive Mode (|||42382|).
150 Ok to send data.
100% |********************************************************************************************************************************|    51       25.65 KiB/s    00:00 ETA
226 Transfer complete.
50000 bytes sent in 05:00 (1.57 KiB/s)
ftp> mput eg_01.fq.bz2.md5 
229 Entering Extended Passive Mode (|||41642|).
150 Ok to send data.
100% |********************************************************************************************************************************|    54       48.20 KiB/s    00:00 ETA
226 Transfer complete.
54 bytes sent in 00:00 (1.92 KiB/s)
ftp> bye
221 Goodbye.
```





