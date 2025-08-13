=======================
Programmatic Submission
=======================

Introduction
============

Submissions of different data objects can be made programmatically using XML or JSON file formats.

A receipt XML/JSON with accession numbers is provided upon successful submission. Any
validation or other errors will be written in the receipt as well.

Production and test services
============================

There are two programmatic Webin submission services. One for test submissions
and another for production submissions:

- Test service URL: https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit
- Production service URL: https://www.ebi.ac.uk/ena/submit/drop-box/submit

The test service is recreated from the full content of the production service every day at
03.00 GMT/BST. Therefore, any submissions made to the test service will be removed
by the following day.

When you are using the test service the receipt XML will contain the following message:

.. code-block:: xml

    This submission is a TEST submission and will be discarded within 24 hours.

It is advisable to first test your submissions using the Webin test service before
establising an automated submission pipeline.

Upload data files
=================

Data files must be uploaded into a submitter specific private Webin file upload area
before they can be submitted. Always keep a local copy of the uploaded files
until the files have been successfully submitted and archived. The Webin file
upload area is a temporary transit area which is not backed up and subject to
a fair use policy.

Once uploaded, data files are submitted by referring to them from Run JSON/XML or Analysis JSON/XML.
Run JSON/XML is used for used for sequence read submissions while Analysis JSON/XML is used
for other types of submissions (e.g. genome assemblies).

More information of uploading data files and our the fair use policy is available `here <../fileprep/upload.html>`_.

Submission protocol
===================

Submissions are made through the secure HTTPS protocol using POST multipart/form-data
according to RFC1867.

Authentication method
=====================

Webin username and password must be provided using basic HTTP authentication.

When using curl the username and password are provided using the `-u` option:

.. code-block:: xml

    curl -u username:password

Webin REST V2 API
=================

Programmatic submissions can be made using the Webin Rest V2 service. This has been developed
to address issues such as timeout errors during submissions. The `Webin REST V1 <webin-v1.html>`_ submission
endpoint may time out while the submission still is being processed. If this happens the submitter will not
receive a submission receipt.The Webin REST version 2 (V2) prevents this error and has a number of
other improvements.

The Webin REST V2 API supports two types of submissions:

- synchronous submissions that use an endpoint that returns a submission receipt
- asynchronous submissions that use an endpoint that returns a submission accession that is used to poll for the submission receipt

The synchronous submission endpoint timeouts gracefully so that the submission processing is terminated if the
submission processing takes more than 1 minute. The asynchronous submission endpoint supports larger submissions
and gracefully terminated the submission if the processing takes more than 10 minutes.

These endpoints are further explained below:

Service URL: https://www.ebi.ac.uk/ena/submit/webin-v2/

+------------------------+--------------------------------------------------------------------------------------------------+
| API Mapping            | Use                                                                                              |
+========================+==================================================================================================+
| /submit                | | Processes submissions and returns the submission receipt. This method supports                 |
|                        | | XML or JSON documents of up to 15 MB. If the submission processing takes more than 1 minute    |
|                        | | then the submission processing is gracefully terminated with a timeout error.                  |
+------------------------+--------------------------------------------------------------------------------------------------+
| /submit/queue          | | Queues submissions for processing and returns a submission ID and a submission polling         |
|                        | | link. The submission processing status and the receipt are retrieved for the submission ID     |
|                        | | using the poll link. If the submission processing takes more than 10 minutes                   |
|                        | | then the submission processing is gracefully terminated with a timeout error.                  |
+------------------------+--------------------------------------------------------------------------------------------------+
| /submit/poll           | | Returns the submission processing status and receipt (if available) for a queued               |
|                        | | submission.                                                                                    |
+------------------------+--------------------------------------------------------------------------------------------------+

How to use Webin REST V2
========================

In contrast to Webin REST V1 where individual objects (submission, runs, samples, etc.) are submitted as separate files
using multipart file upload, in Webin REST V2 they are submitted as a single file in the request body.
Additionally, Webin REST V2 supports both JSON and XML formats while Webin REST V1 only supports the XML format.
Please refer to the `Webin Rest V1 documentation <webin-v1.html>`_ to find out more.

Webin REST V2 accepts submissions to the production and test servers.

- The production service is available at: https://www.ebi.ac.uk/ena/submit/webin-v2/
- The test service is available at: https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/

The web API can be viewed and tested using the Swagger web interface accessible through the above links.
Some users use cURL while others build their own API to access these endpoints.

Submission Format
=================

The type of each submitted JSON/XML file must be specified at time of submission.

When using curl, each JSON/XML file is submitted using the `-T` option:

.. code-block:: xml

    -T "file=@FILENAME"

where the file referenced can contain a combination of the datatypes documented below:

- ```SUBMISSION`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.submission.xsd>`_
- ```STUDY`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.study.xsd>`_
- ```SAMPLE`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.sample.xsd>`_
- ```EXPERIMENT`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.experiment.xsd>`_
- ```RUN`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.run.xsd>`_
- ```ANALYSIS`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.analysis.xsd>`_
- ```PROJECT`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/ENA.project.xsd>`_

The JSON or XML file can be submitted in the request body as a single document.
For example, a ``PROJECT`` and ``SAMPLE`` object can be submitted like this:

.. tabs::

   .. tab:: JSON

      .. code:: none

         {
            "submission": {
              "alias": "submissionAliasName",
              "accession": "",
              "actions": [
                  {
                        "type": "ADD"
                  },
                  {
                        "type": "HOLD",
                        "holdUntilDate": "2025-01-12"
                    }
                ],
                "attributes": [
                    {
                        "tag": "test_tag",
                        "value": "test_val"
                    },
                    {
                        "tag": "test_tag_1",
                        "value": "test_val_1"
                    }
                ]
            },
            "projects": [
                {
		    "alias": "comparative-analysis",
                    "name": "Human Gut Microbiota Study",
                    "title": "Exploration of the diversity human gastric microbiota",
                    "description": "The genome sequences of gut microbes were obtained using...",
                    "sequencingProject": {},
                    "attributes": [
                        {
                            "tag": "testTag",
                            "value": "testValue"
                        }
                    ],
                    "project_links": [
                        {
                            "xrefLink": {
                                "db": "PUBMED",
                                "id": "25035323"
                            }
                        }
                    ]
                }
            ],
            "samples": [
                {
                    "alias": "stomach_microbiota",
                    "title": "human gastric microbiota, mucosal",
                    "organism": {
                        "taxonId": "1284369"
                    },
                    "attributes": [
                        {
                            "tag": "investigation type",
                            "value": "mimarks-survey"
                        },
                        {
                            "tag": "sequencing method",
                            "value": "pyrosequencing"
                        },
                        {
                            "tag": "collection date",
                            "value": "2010-01-20"
                        },
                        {
                            "tag": "host body site",
                            "value": "Mucosa of stomach"
                        },
                        {
                            "tag": "human-associated environmental package",
                            "value": "human-associated"
                        },
                        {
                            "tag": "geographic location (latitude)",
                            "value": "1.81",
                            "unit": "DD"
                        },
                        {
                            "tag": "geographic location (longitude)",
                            "value": "-78.76",
                            "unit": "DD"
                        },
                        {
                            "tag": "geographic location (country and/or sea)",
                            "value": "Colombia"
                        },
                        {
                            "tag": "geographic location (region and locality)",
                            "value": "Tumaco"
                        },
                        {
                            "tag": "environment (biome)",
                            "value": "coast"
                        },
                        {
                        "tag": "environment (feature)",
                        "value": "human-associated habitat"
                        },
                        {
                            "tag": "project name",
                            "value": "Human microbiota"
                        },
                        {
                            "tag": "environment (material)",
                            "value": "gastric biopsy"
                        },
                        {
                            "tag": "ena-checklist",
                            "value": "ERC000014"
                        }
                    ]
                }
            ]
        }

   .. tab:: XML

      .. code:: none

        <WEBIN>
            <SUBMISSION_SET>
                <SUBMISSION>
                    <ACTIONS>
                        <ACTION>
                            <ADD/>
                        </ACTION>
                        <ACTION>
                            <HOLD HoldUntilDate="2025-01-12"/>
                        </ACTION>
                    </ACTIONS>
                </SUBMISSION>
            </SUBMISSION_SET>
            <PROJECT_SET>
                <PROJECT alias="comparative-analysis">
                <NAME>Human Gut Microbiota Study</NAME>
                <TITLE>Exploration of the diversity human gastric microbiota</TITLE>
                <DESCRIPTION>The genome sequences of gut microbes were obtained using... </DESCRIPTION>
                <SUBMISSION_PROJECT>
                    <SEQUENCING_PROJECT/>
                </SUBMISSION_PROJECT>
                <PROJECT_LINKS>
                    <PROJECT_LINK>
                        <XREF_LINK>
                            <DB>PUBMED</DB>
                            <ID>25035323</ID>
                        </XREF_LINK>
                    </PROJECT_LINK>
                </PROJECT_LINKS>
                </PROJECT>
            </PROJECT_SET>
            <SAMPLE_SET>
                <SAMPLE alias="stomach_microbiota" center_name="">
                <TITLE>human gastric microbiota, mucosal</TITLE>
                <SAMPLE_NAME>
                    <TAXON_ID>1284369</TAXON_ID>
                    <SCIENTIFIC_NAME>stomach metagenome</SCIENTIFIC_NAME>
                    <COMMON_NAME></COMMON_NAME>
                </SAMPLE_NAME>
                <SAMPLE_ATTRIBUTES>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>investigation type</TAG>
                      <VALUE>mimarks-survey</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>sequencing method</TAG>
                      <VALUE>pyrosequencing</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>collection date</TAG>
                      <VALUE>2010</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>host body site</TAG>
                      <VALUE>Mucosa of stomach</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>human-associated environmental package</TAG>
                      <VALUE>human-associated</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>geographic location (latitude)</TAG>
                      <VALUE>1.81</VALUE>
                      <UNITS>DD</UNITS>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>geographic location (longitude)</TAG>
                      <VALUE>-78.76</VALUE>
                      <UNITS>DD</UNITS>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>geographic location (country and/or sea)</TAG>
                      <VALUE>Colombia</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>geographic location (region and locality)</TAG>
                      <VALUE>Tumaco</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>environment (biome)</TAG>
                      <VALUE>coast</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>environment (feature)</TAG>
                      <VALUE>human-associated habitat</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>project name</TAG>
                      <VALUE>Human microbiota</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>environment (material)</TAG>
                      <VALUE>gastric biopsy</VALUE>
                    </SAMPLE_ATTRIBUTE>
                    <SAMPLE_ATTRIBUTE>
                      <TAG>ENA-CHECKLIST</TAG>
                      <VALUE>ERC000014</VALUE>
                    </SAMPLE_ATTRIBUTE>
                </SAMPLE_ATTRIBUTES>
                </SAMPLE>
            </SAMPLE_SET>
        </WEBIN>

Release date for data objects
=============================

When the ``HOLD`` action is provided with a date then all submitted studies, projects and samples will become immediately
public on that date. Run, experiment and analysis objects will become public on the date when studies or projects
they refer to are made public.

A release date can be provided for studies by using the ``HOLD`` action together with the ``ADD`` action:

.. tabs::

   .. tab:: JSON

      .. code:: none

         "submission":{
         "alias":"submissionAliasName",
         "accession":"",
         "actions":[
            {
                "type":"ADD"
            },
            {
                "type":"HOLD",
                "holdUntilDate":"TODO: release date"
            }
        ],
        "attributes":[
            {
                "tag":"test",
                "value":"test_val"
            },
            {
                "tag":"test_1",
                "value":"test_val_1"
            }
          ]
         }

   .. tab:: XML

      .. code:: none

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

The ``HoldUntilDate`` specifies the public release date of any studies submitted within the submission.
This can be at most two years in the future.

If the ``HOLD`` action is used without a date then the submitted studies, projects and samples will become public
in two years time.

You can also update the release date of a study, project or sample by using the HOLD action with a new release date:

.. tabs::

   .. tab:: JSON

      .. code:: none

         "submission":{
         "alias":"submissionAliasName",
         "accession":"",
         "actions":[
            {
                "type":"HOLD",
                "target":"TODO: study accession number",
                "holdUntilDate":"TODO: YYYY-MM-DD"
            }
        ],
        }

   .. tab:: XML

      .. code:: none

        <SUBMISSION>
            <ACTIONS>
                <ACTION>
                    <HOLD target="TODO: study accession number" HoldUntilDate="TODO: YYYY-MM-DD"/>
                </ACTION>
            </ACTIONS>
        </SUBMISSION>

This applies only to non-public studies. It is not possible to suppress a public study by this method.

The new release date must be not more than two years in the future.

Identifying objects
===================

Each submitted object is uniquely identified within a submission account using the alias attribute.
Once an object has been submitted no other object of the same type can use the same alias within the submission account.
Objects can refer to other objects within a submission account by either alias or the assigned accession number.

Identifying submitters
======================

The center_name attribute defines the submitting institution. The center name is automatically assigned from submission
account details except for broker accounts. Brokers should provide a center name which reflects the institute where the
data was generated. For brokers, the broker_name field is automatically assigned at time of submission.

Synchronous Endpoint
====================

The synchronous submission endpoint processes the submitted JSON/XML document right away and returns a receipt
in either JSON/XML document. This route is appropriate for small-scale submissions. Submitters with large or
high-volume submissions are advised to use the asynchronous endpoint explained below.

Below is an example of a submission to the Webin service using the synchronous endpoint:

.. tabs::

   .. tab:: JSON

      .. code:: none

         curl -u username:password -X POST 'https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/submit' \
         -H 'Accept: application/json' \
         -H 'Content-Type: application/json' \
         -T 'submission file name'

   .. tab:: XML

      .. code:: none

         curl -u username:password -X POST 'https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/submit' \
         -H 'Accept: application/xml' \
         -H 'Content-Type: application/xml' \
         -T 'submission file name'

The JSON/XML submission document file name should be included in the field -T ‘submision file name’.
The Accept and Content-Type headers must match the document format in the ‘submission file name’.

Asynchronous Endpoint
=====================

When a submission is made using the asynchronous endpoint, it enters a pending state in a queue of submissions.
This submission is processed once it reaches the front of this queue. The asynchronous submission endpoint supports
larger and a higher volume of submissions than the synchronous endpoint.

Below is an example of a sequence read data submission to the Webin service using the asynchronous endpoint:

.. tabs::

   .. tab:: JSON

      .. code:: none

         curl -u username:password -X POST ''https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/submit/queue' \
         -H 'Accept: application/json' \
         -H 'Content-Type: application/json' \
         -T 'submission file name'

   .. tab:: XML

      .. code:: none

         curl -u username:password -X POST ''https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/submit/queue' \
         -H 'Accept: application/xml' \
         -H 'Content-Type: application/xml' \
         -T 'submission file name'

When the asynchronous endpoint is used, a JSON document is returned with a submission ID and a poll link:

.. code-block:: xml

    {
    "submissionId": "ERA12944374",
    "submissionAccountId": "Webin-xxxx",
    "_links": {
        "poll": {
        "href": "https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA12944374"
        }
     }
    }

The poll endpoint and submission ID are used to retrieve the state of the submission and the JSON/XML receipt
once the submission has been processed.

An example of the cURL command used for the poll endpoint to retrieve a receipt is shown below:

.. tabs::

   .. tab:: JSON

      .. code:: none

         curl -u username:password "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA12944374"

      or

      .. code:: none

         curl -u username:password "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA12944374" \
         -H 'Accept: application/json'


   .. tab:: XML

      .. code:: none

         curl -u username:password "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA16500666" \
         -H 'Accept: application/xml'

Submission Receipt
==================

Once a submission has been processed a receipt is returned either immediately (synchronous endpoint) or
after polling (asynchronous endpoint).
The ``success`` attribute in the receipt is ``true`` if the submission was successful and ``false`` if the submission
was not successful.
The receipt also contains the accession numbers of the objects that you have submitted.
An example of a successful sequence read data submission together with a project, sample and experiment object:

.. tabs::

   .. tab:: JSON

      .. code:: none

        {
          "success" : true,
          "receiptDate" : "2023-11-16T10:44:41.618Z",
          "experiments" : [ {
            "alias" : "illumina-hiSeq",
            "accession" : "ERX9223136",
            "status" : "PRIVATE"
          } ],
          "runs" : [ {
            "alias" : "paired-data",
            "accession" : "ERR9669128",
            "status" : "PRIVATE"
          } ],
          "success" : true,
          "receiptDate" : "2023-11-16T10:20:02.982Z",
          "samples" : [ {
            "alias" : "stomach_microbiota",
            "accession" : "ERS27605861",
            "status" : "PRIVATE",
            "holdUntilDate" : "2023-01-01Z",
            "externalAccession" : {
              "id" : "SAMEA130793922",
              "db" : "biosample"
            }
          } ],
          "projects" : [ {
            "alias" : "comparative-analysis",
            "accession" : "PRJEB101337",
            "status" : "PRIVATE",
            "holdUntilDate" : "2023-01-01Z",
            "externalAccession" : {
              "id" : "ERP201886",
              "db" : "study"
            }
          } ],
          "submission" : {
            "alias" : "SUBMISSION-27-07-2022-09:54:36:278",
            "accession" : "ERA12956757"
          },
          "messages" : {
            "info" : [ "All objects in this submission are set to private status (HOLD)." ]
          },
          "actions" : [ "ADD", "HOLD" ]
        }


   .. tab:: XML

      .. code:: none

         <RECEIPT receiptDate="2022-07-27T09:54:37.869+01:00" submissionFile="submission-EMBL-EBI_1658912077869.xml" success="true">
             <EXPERIMENT accession="ERX9535365" alias="illumina-hiSeq" status="PRIVATE"/>
             <RUN accession="ERR9994219" alias="paired-data" status="PRIVATE"/>
             <SAMPLE accession="ERS12520704" alias="gut-microbiota" status="PRIVATE" holdUntilDate="2024-07-12+01:00">
                 <EXT_ID accession="SAMEA110422334" type="biosample"/>
             </SAMPLE>
             <PROJECT accession="PRJEB55033" alias="comparative-analysis" status="PRIVATE" holdUntilDate="2024-07-12+01:00">
                 <EXT_ID accession="ERP139895" type="study"/>
             </PROJECT>
             <SUBMISSION accession="ERA16500666" alias="SUBMISSION-27-07-2022-09:54:36:278"/>
             <MESSAGES>
                 <INFO>All objects in this submission are set to private status (HOLD).</INFO>
             </MESSAGES>
             <ACTIONS>ADD</ACTIONS>
             <ACTIONS>HOLD</ACTIONS>
         </RECEIPT>

If the submission is not successful the ``success`` attribute in the RECEIPT element is ``false`` and the
error messages are available in the MESSAGES block:

.. tabs::

   .. tab:: JSON

      .. code:: none

         {
         "success" : false,
         "receiptDate" : "2022-01-01T17:05:01.114+01:00",
         "messages" : {
         "error": [ "Error message displayed here" ]
          }
         }


   .. tab:: XML

      .. code:: none

         <RECEIPT receiptDate="2022-01-01T17:05:01.114+01:00" success="false">
             <MESSAGES>
                 <ERROR>Error message displayed here</ERROR>
             </MESSAGES>
         </RECEIPT>
