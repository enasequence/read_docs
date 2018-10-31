# Module 2: ENA Flatfile Validator

## Introduction

You can use the ENA flatfile validator to validate your sequence flatfiles
before submitting themthrough Webin.

The validator is updated regularly. Please check every few weeks to see if a new
version is available.

## Download the Program

The latest version of the validator can be downloaded from:

<https://github.com/enasequence/sequencetools/releases>

The program is a self executing Java jar file named
`embl-api-validator-<version>.jar`
(for example: `embl-api-validator-1.0.0.jar`).

It requires Java 1.8 or newer, which can be downloaded from:

<https://java.com/en/download>

The latest version of the validator is also available from [Maven](https://mvnrepository.com/artifact/uk.ac.ebi.ena.sequence/embl-api-validator)
together with the following additional jar files:
- `embl-api-core`: flatfile reader, data model and writer
- `embl-api-ff`: flatfile validator and fixer

## Using the Program

The program must be run from the command line as shown below.
You should provide file name(s) to the validator, which may include wildcards
(\*).

For example, two files `file1.txt` and `file2.txt`:

```
java -jar embl-api-validator-1.0.0.jar -r -fix file1.txt file2.txt
```
Or all files ending with `*.txt` in the current working directory:

```
java -jar embl-api-validator-1.0.0.jar -r - fix *.txt
```

### Options

The validator should always be run using the `-r` option, to show that you are
running it remotely. This will exclude checks which require internal EBI
infrastructure.

The `-fix` option is recommended, as it will display some errors which would
otherwise be missed.

You can set the output level by using the `-l` argument:
- `0` is silent
- `1` is summary only
- `2` is full report

For example:

```
java -jar embl-api-validator-1.0.0..jar -r -fix -l 2 *.txt
```

## Validation Reports

A summary output is shown on the console at the end of execution.
This summary allows you to quickly see if there were any errors in your files.
Full error reports are written to text files.

Validation messages have three severities:
- `info`: no problem with the flatfile, just a comment
- `warning`: the flatfile can be submitted but you may be able to improve the
 quality of the information
- `error`: the flatfile is invalid and must be corrected

If a message occurs multiple times then the message will be shown once in the
"compressed messages" section.

The "file summary" section shows you the results for each file while the
"summary" shows an overall
number of validated and possibly failed flatfile entries. Please ignore the
fixed and unchanged entry counts. These are for when running the validator in
the "fix" mode, which you will not be using.

The validator produces the following reports:

- `VAL_SUMMARY.txt`: the summary output is also saved into this file
- `VAL_ERROR.txt`: error messages
- `VAL_REPORTS.txt`: some validation messages include extended information
written into this file. For example, CDS translation errors include a detailed
translation report.
- `VAL_INFO.txt`: info and warning messages
- `VAL_FIXES.txt`: fixes applied in the "fix" mode (you will not be using this)

## Proxy Servers

If your organisation uses an https proxy you can set the following Java
properties to instruct the validator to use them:

- https.proxyHost
- https.proxyPort

For example:

```
java -Dhttps.proxyHost=proxy.com -Dhttps.proxyPort=8080 -jar embl-api-validator-1.0.0.jar -r *.txt
```
