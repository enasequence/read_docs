# Module 1: Submission Options

## Introduction

Submissions to ENA can be made using the interactive Webin submission service, programmatic Webin submission
service and the Webin command line submission service. This module gives an introduction to the
programmatic Webin submission service.

Submissions of different types can be made using XML through the programmatic
Webin submission service.

A receipt XML with accession numbers is provided upon successful submission. Any
validation or other errors will be written in the receipt XML as well.

## Registration

If you have not submitted to Webin before please [register a submission account](reg_01.html).

## Production and test services

There are two programmatic Webin submission services. One for test submissions
and another for production submissions:

- Test service URL: https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit
- Production service URL: https://www.ebi.ac.uk/ena/submit/drop-box/submit

The test service is recreated from the full content of the production service every day at
03.00 GMT/BST. Therefore, any submissions made to the test service will be removed
by the following day.

When you are using the test service the receipt XML will contain the following message:

```xml
<INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
```

It is advisable to first test your submissions using the Webin test service before
establising an automated submission pipeline.

## Upload data files

Data files must be uploaded into a submitter specific private Webin file upload area
before they can be submitted. Always keep a local copy of the uploaded files
until the files have been successfully submitted and archived. The Webin file
upload area is a temporary transit area which is not backed up and subject to
a fair use policy. 

Once uploaded, data files are submitted by referring to them from Run XML or Analysis XML. 
Run XML is used for used for sequence read submissions while Analysis XML is used 
for other types of submissions (e.g. genome assemblies).

More information of uploading data files and our the fair use policy is available [here](upload_01.html).

## Submission protocol

Submissions are made through the secure HTTPS protocol using POST multipart/form-data
according to RFC1867.

## Authentication method

Webin user name and password must be provided using basic HTTP authentication.

When using curl the user name and password are provided using the `-u` option:

```
curl -u username:password
```

## Types of XML

The type of each submitted XML file must be specified at time of submission.

When using curl each XML file is submitted using the '-F' option:

```
-F "XMLTYPE=@FILENAME"
```

where the `XMLTYPE` is one of:

- `SUBMISSION` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.submission.xsd))
- `STUDY` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.study.xsd))
- `SAMPLE` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.sample.xsd))
- `EXPERIMENT` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.experiment.xsd))
- `RUN` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.run.xsd))
- `ANALYSIS` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.analysis.xsd))
- `DAC` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/EGA.dac.xsd))
- `POLICY` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/EGA.policy.xsd))
- `DATASET` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/EGA.dataset.xsd))
- `PROJECT` ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/ENA.project.xsd))

Below is an example of a sequence read data submission to the Webin test service:

```
curl -u username:password -F "SUBMISSION=@submission.xml" -F "EXPERIMENT=@experiment.xml" -F "RUN=@run.xml" "https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/"
```

## Metadata model

Each XML type corresponds to a equivalent meta data object.
The full metadata model is described in [Metadata model](meta_01.html).

## Identifying objects

Each submitted object is uniquely identified within a submission account using the `alias` attribute. 
Once an object has been submitted no other object of the same type can use the same alias within the 
submission account. Objects can refer to other objects within a submission account by either alias or 
the assigned accession number.

## Identifying submitters

The `center_name` attribute defines the submitting institution. The center name is automatically
assigned from submission account details except for broker accounts. Brokers
should provide a center name which reflects the institute where the data was generated. For brokers,
the `broker_name` field is automatically assigned at time of submission.

## Submission XML

Each submission should contain a submission XML file which defines the submission actions.
The most commonly used submission actions are listed below.

### Submission XML: submit new objects

The `ADD` action is used when submitting new objects. A corresponding submission XML
will look like:

```
<SUBMISSION>
     <ACTIONS>
         <ACTION>
             <ADD/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

### Submission XML: submit studies with release date

If no release date is provided then submitted studies and any associated objects
will be publicly released two years after the date of study submission.

A release date can be provided for studies by using the `HOLD` action together with the `ADD` action: 

```
<SUBMISSION>
    <ACTIONS>
        <ACTION>
            <ADD/>
        </ACTION>
        <ACTION>
            <HOLD HoldUntilDate="TODO: release date"/>
        </ACTION>                            
    </ACTIONS>
</SUBMISSION>
```

The `HoldUntilDate` specifies the public release date of any studies submitted within the submission. 
This can be at most two years in the future.

### Submission XML: make study public

A study can be made immediately public by using `RELEASE` action with the study accession number:

```
<SUBMISSION>
    <ACTIONS>
         <ACTION>
              <RELEASE target="TODO: study accession number"/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

### Submission XML: update existing object

The `MODIFY` action is used when updating existing objects. A corresponding submission XML
will look like:

```
<SUBMISSION>
     <ACTIONS>
         <ACTION>
             <MODIFY/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

### Submission XML: validate objects

The `VALIDATE` action is used when validating a submission without actually creating or
updating any objects. It can be used together with the `ADD` action (default):

```
<SUBMISSION>
     <ACTIONS>
         <ACTION>
             <ADD/>
         </ACTION>
         <ACTION>
             <VALIDATE/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

Or with the `MODIFY` action:

```
<SUBMISSION>
     <ACTIONS>
         <ACTION>
             <MODIFY/>
         </ACTION>
         <ACTION>
             <VALIDATE/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

## Receipt XML

Once a submission has been processed a receipt XML ([XML Schema](ftp://ftp.sra.ebi.ac.uk/meta/xsd/sra_1_5/SRA.receipt.xsd))
is returned. 

To know if the submission was successful look in the first line of the `<RECEIPT>` block. 

The attribute `success` will have value `true` or `false`. If the value 
is false then the submission did not succeed. In this case check the rest of 
the receipt for error messages and after making corrections, try the submission again. 

If the success attribute is true then the submission was successful. The receipt will 
contain the accession numbers of the objects that you have submitted. In the case of 
a study submission this is likely to be the accession that you will be including in a 
publication.

An example of a successful run submission:

```
<RECEIPT receiptDate="2014-12-02T16:06:20.871Z" success="true">
    <RUN accession="ERR049536" alias="run_1" status="PRIVATE"/>
    <SUBMISSION accession="ERA390457" alias="submission_1"/>
    <ACTIONS>ADD</ACTIONS>
</RECEIPT>
```

Above, the assigned run accession number `ERR049536` is provided in the `accession` attribute 
within the `RUN` block.  

If the submission was not successful the Receipt XML will contain the error messages within
the `MESSAGES` block:

```
<RECEIPT receiptDate="2014-12-02T16:06:20.871Z" success="false">
   ...
   <MESSAGES>
      <ERROR>This is an error message.</ERROR>
   </MESSAGES>
   ...
</RECEIPT>
```

### Test and production services

When using the test submission service the following message is included into the receipt:

```xml
<INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>
```

It is advisable to first test your submissions using the Webin test service where changes are not 
permanent and are erased every 24 hours. 

Once you are happy with the result of the submission you can use production service. 
Simply change the part in the URL from `wwwdev.ebi.ac.uk` to `www.ebi.ac.uk`.
