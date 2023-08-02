=================
ENA Webin REST V2
=================

All 3 existing submission routes, interactive, programmatic and Webin-CLI, at the ENA use the WEBIN REST version 1 (V1) submission
service.  The Webin REST V1 submission endpoint may time out while the submission still is being processed. If this happens the submitter will not receive a submission receipt.

The Webin REST version 2 (V2) prevents this error and has a number of other improvements.

The Webin REST V2 API supports two types of submissions:

- synchronous submissions that use an endpoint that returns a submission receipt
- asynchronous submissions that use an endpoint that returns a submission accession that is used to poll for the submission receipt

The synchronous submission endpoint timeouts gracefully so that the submission processing is terminated if the submission processing takes more than 1 minute. The asynchronous submission endpoint supports larger submissions and gracefully terminated the submission if the processing takes more than 10 minutes.

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

========================
How to use Webin REST V2
========================

In contrast to Webin REST V1 where individual objects (submission, runs, samples, etc.) are submitted 
as separate files using multipart file upload, in Webin REST V2 they are submitted as a single file in the request body.
Additionally, Webin REST V2 supports both JSON and XML formats while Webin REST V1 only supports the XML format.

- The production service is available at: https://www.ebi.ac.uk/ena/submit/webin-v2/
- The test service is available at: https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/

The web API can be viewed and tested using the Swagger web interface accessible through the above links. Some users use cURL while others build their own API to access these endpoints.

Synchronous Endpoint
====================

The synchronous submission endpoint processes the submitted XML or JSON document right away and returns a receipt in either XML or JSON document. Submitters with large or high-volume submissions are advised to use the asynchronous endpoint explained below.

Below is an example of a submission to the Webin service using the synchronous endpoint in JSON and XML formats:

.. code-block:: bash

    curl -u username:password -X POST 'https://wwwdev.ebi.ac.uk/ena/dev/submit/webin-v2/submit' \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -T 'submission file name'

    curl -u username:password -X POST 'https://wwwdev.ebi.ac.uk/ena/dev/submit/webin-v2/submit' \
    -H 'Accept: application/xml' \
    -H 'Content-Type: application/xml' \
    -T 'submission file name'

The JSON or XML submission document is in the file named 'submission file name' above. The Accept and Content-Type headers must match the document format in the 'submission file name'. 

Asynchronous Endpoint
=====================

When a submission is made using the asynchronous endpoint, it enters a pending state in a queue of submissions.
This submission is processed once it reaches the front of this queue. The asynchronous submission endpoint supports
larger and a higher volume of submissions than the synchronous endpoint.

Below is an example of a sequence read data submission to the Webin service using the asynchronous endpoint:

.. code-block:: bash

  curl -u username:password -X POST 'https://wwwdev.ebi.ac.uk/ena/dev/submit/webin-v2/submit/queue' \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -T '{submission file name}'

    curl -u username:password -X POST 'https://wwwdev.ebi.ac.uk/ena/dev/submit/webin-v2/submit/queue' \
    -H 'Accept: application/xml' \
    -H 'Content-Type: application/xml' \
    -T '{submission file name}'

When the asynchronous endpoint is used, a JSON document is returned with a submission ID and a poll link:

.. code-block:: json

    {
      "submissionId": "ERA12944374",
      "submissionAccountId": "Webin-57176",
      "_links": {
        "poll": {
          "href": "https://wwwdev.ebi.ac.uk/ena/dev/submit/webin-v2/submit/poll/ERA12944374"
        }
      }
    }

The poll endpoint and submission ID are used to retrieve the state of the submission and the JSON or XML receipt once
the submission has been processed. If the submission is still in the queue, the endpoint returns HTTP status 202 without
a response body. Once the submission is processed, the endpoint returns HTTP status 200 and the receipt in either JSON
or XML format depending on the Accept header.

An example of the cURL command used for the poll endpoint to retrieve a receipt JSON is shown below:

.. code-block:: bash

    curl -u username:password "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA16500666"

    or

    curl -u username:password "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA16500666" \
    -H 'Accept: application/json'


An example of the cURL command used for the poll endpoint to retrieve a receipt XML is shown below:

.. code-block:: bash

    curl -u username:password "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA16500666" \
    -H 'Accept: application/xml'

=====================
Submission JSON
=====================

The JSON is submitted in the request body as a single document.

For example, a submission with one sample object could be submitted like this:


.. code-block:: json

    {
    "submission":{
        "actions":[
            {
                "type":"ADD"
            },
            {
                "type":"HOLD",
                "holdUntilDate":"2022-01-01"
            }
        ]
    },
    "samples":[
        {
            "alias":"test-sample-1",
            "title":"test",
            "organism":{
                "taxonId":"1284369"
            },
            "attributes":[
                {
                "tag":"test",
                "value":"value"
                }
            ]
        }
    ]
    }

=====================
Submission XML
=====================

The XML is submitted in the request body as a single document that must conform to the `Webin XML format <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/ENA.webin.xsd>`_.

The XMLs are enclosed within the ``<WEBIN>...</WEBIN>`` tag.

For example, a submission with one sample object could be submitted like this:

.. code-block:: xml

    <WEBIN>
      <SUBMISSION_SET>
        <SUBMISSION>
	  <ACTIONS>
	    <ACTION>
	      <ADD/>
	    </ACTION>
            <ACTION>
              <HOLD HoldUntilDate="2022-01-01"/>
	    </ACTION>
	  </ACTIONS>
	</SUBMISSION>
      </SUBMISSION_SET>
      <SAMPLE_SET>
        <SAMPLE alias="test-sample-1">
	  <TITLE>test</TITLE>
	  <SAMPLE_NAME>
	    <TAXON_ID>1284369</TAXON_ID>
	    <SCIENTIFIC_NAME>stomach metagenome</SCIENTIFIC_NAME>
	  </SAMPLE_NAME>
	  <SAMPLE_ATTRIBUTES>
	    <SAMPLE_ATTRIBUTE>
	      <TAG>test</TAG>
	      <VALUE>value</VALUE>
	    </SAMPLE_ATTRIBUTE>
	  </SAMPLE_ATTRIBUTES>
	</SAMPLE>
      </SAMPLE_SET>
    </WEBIN>


===========
Receipt XML
===========

The ``success`` attribute in the RECEIPT element is ``true`` if the submission was successful and ``false`` if the submission was not successful.

The receipt also contains the accession numbers of the objects that you have submitted.

An example of a successful sample submission is shown below:

.. code-block:: xml

    <RECEIPT receiptDate="2022-07-27T09:54:37.869+01:00" submissionFile="submission-EMBL-EBI_1658912077869.xml" success="true">
         <SAMPLE accession="ERS12520704" alias="gut-microbiota" status="PRIVATE" holdUntilDate="2024-07-12+01:00">
              <EXT_ID accession="SAMEA110422334" type="biosample"/>
         </SAMPLE>
         <SUBMISSION accession="ERA16500666" alias="SUBMISSION-27-07-2022-09:54:36:278"/>
         <MESSAGES>
              <INFO>All objects in this submission are set to private status (HOLD).</INFO>
         </MESSAGES>
         <ACTIONS>ADD</ACTIONS>
         <ACTIONS>HOLD</ACTIONS>
    </RECEIPT>

If the submission is not successful the ``success`` attribute in the RECEIPT element is ``false`` and the error messages are available in the MESSAGES block:

.. code-block:: xml

    <RECEIPT receiptDate="2022-07-22T12:05:05.951+01:00" success="false">
         <MESSAGES>
              <ERROR>Error message displayed here.</ERROR>
         </MESSAGES>
    </RECEIPT>
