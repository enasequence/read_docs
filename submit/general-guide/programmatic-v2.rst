=================
ENA Webin REST V2
=================

All 3 existing submission routes, interactive, programmatic and Webin-CLI, at the ENA utilise the WEBIN REST submission
service. This can sometimes result in timeout errors during submission.

To address such issues and improve the ENA submission services, the ENA WEBIN REST V2 service has been developed.
The V2 service runs through the programmatic submission route and has 3 endpoints:
2 submission endpoints (one synchronous and one asynchronous) and 1 polling endpoint to retrieve the submission receipt.

These endpoints are further explained below:

Service URL: https://www.ebi.ac.uk/ena/submit/webin-v2/

+------------------------+--------------------------------------------------------------------------------------------------+
| API Mapping            | Use                                                                                              |
+========================+==================================================================================================+
| /submit                | | Processes submitted XMLs and returns the submission result. This method supports               |
|                        | | XML files of up to 15 MB. If the submission processing takes more than 1 minute,               |
|                        | | the submission will failwith a timeout error and will not be persisted in ENA.                 |
+------------------------+--------------------------------------------------------------------------------------------------+
| /submit/queue          | | Queues submitted XMLs for processing and returns a submission ID and submission                |
|                        | | polling links. The submission processing status and the receipt for the                        |
|                        | | submission ID can be retrieved using the poll method. This method supports XML                 |
|                        | | files of up to 100 MB and allows submissions to bemade without the risk of                     |
|                        | | timeout errors. Asynchronous submission processing runs behind the scenes to                   |
|                        | | process the submissions.                                                                       |
+------------------------+--------------------------------------------------------------------------------------------------+
| /submit/poll           | | Returns the submission processing status and receipt (if available) for a queued               |
|                        | | submission.                                                                                    |
+------------------------+--------------------------------------------------------------------------------------------------+

=====================
Submission XML Format
=====================

In contrast to the Webin REST V1 where individual data objects (submission, runs, samples, etc.)
are submitted as separate files, in the V2 endpoint they are submitted as a single file in the request body. This file 
must conform to the `Webin XML format <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/ENA.webin.xsd>`_.
In practise, the XMLs are enclosed within the ``<WEBIN>...</WEBIN>`` tag.

For example, a ``PROJECT`` and ``SAMPLE`` object are submitted like this:

.. code-block:: xml

    <WEBIN>
      <SUBMISSION_SET>
        <SUBMISSION>
	  <ACTIONS>
	    <ACTION>
	      <ADD/>
	    </ACTION>
	  </ACTIONS>
	</SUBMISSION>
      </SUBMISSION_SET>
      <PROJECT_SET>
        <PROJECT alias="gut_2022">
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

======================
How to use the new API
======================

| The production service is available at - https://www.ebi.ac.uk/ena/submit/webin-v2/
| The test service is available at - https://wwwdev.ebi.ac.uk/ena/submit/webin-v2/
|
To submit XML files using this API, curl or ENA's swagger UI in the above links can be used. Users can also choose to
build a client that can consume these services.

Synchronous Endpoint
====================

The synchronous submission route processes the submitted XML files right away and returns a `Receipt XML`_.
This route is appropriate for small-scale submissions.

Below is an example of a submission to the Webin service using the synchronous endpoint:

.. code-block:: bash

    curl -u username:password -F "file=@ENA_objects.xml" "https://www.ebi.ac.uk/ena/submit/webin-v2/submit"

If submission attempts using the synchronous route do return timeout errors, then your submission might be too large
and can instead be queued for submission using the asynchronous endpoint.

Asynchronous Endpoint
=====================

When a submission is made using the asynchronous endpoint, it enters a pending state in a queue of submissions.
This submission is then accepted and processed for accessions when it reaches first in the queue.

The asynchronous submission route is catered for users with large-scale submissions or automated pipelines for
submissions, such as brokers.

Below is an example of a sequence read data submission to the Webin service using the asynchronous endpoint:

.. code-block:: bash

    curl -u username:password -F "file=@ENA_objects.xml" "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/queue"

When the asynchronous endpoint is used, the submission returns a submission ID:

.. code-block:: xml

    {
     "submissionId": "ERA16500607",
     "submissionAccountId": "Webin-12345",
     "links": [
       {
         "rel": "poll-json",
         "href": "http://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA16500607?mediaType=json"
       },
       {
         "rel": "poll-xml",
         "href": "http://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA16500607?mediaType = xml"
       }
     ]
    }

The ‘polling’ endpoint and submission ID can then be used to retrieve a receipt XML containing the relevant object
accessions when the submission is complete.

An example of the cURL command used for the polling endpoint to retrieve a receipt XML is shown below:

.. code-block:: bash

    curl -u username:password "https://www.ebi.ac.uk/ena/submit/webin-v2/submit/poll/ERA16500666"

If the submission is still in the queue, it will return an HTTP status of 202, if successful it will return a status of
200 and the receipt XML.

===========
Receipt XML
===========

Once a submission has been processed a receipt XML is returned either immediately (synchronous endpoint) or
after polling (asynchronous endpoint).

The ``success`` attribute in the first line of the receipt block will equal ``true`` if the submission is successful
and ``false`` if the submission is not successful.

The receipt will also contain the accession numbers of the objects that you have submitted.

An example of a successful sequence read data submission together with a project, sample and experiment object:

.. code-block:: xml

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

If the submission is not successful the Receipt XML will contain the error messages within the MESSAGES block:

.. code-block:: xml

    <RECEIPT receiptDate="2022-07-22T12:05:05.951+01:00" success="false">
         <MESSAGES>
              <ERROR>Error message displayed here.</ERROR>
         </MESSAGES>
    </RECEIPT>
