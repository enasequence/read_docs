=================
ENA Webin REST V1
=================

All 3 existing submission routes, interactive, programmatic (V1) and Webin-CLI, at the ENA use the WEBIN REST version 1 (V1)
submission service. XML submissions of different types can be made programmatically using the Webin V1 API. If you are
trying to submit a large file, Webin REST V1 submission endpoint may time out while the submission still is being
processed. If this happens, you are recommended to use `Webin REST version 2 (V2) <programmatic.html>`_
which prevents this error and has a number of other improvements.

Production and test services
============================

There are two programmatic Webin submission services. One for test submissions and another for production submissions:

- Test service URL: https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit
- Production service URL: https://www.ebi.ac.uk/ena/submit/drop-box/submit

The test service is recreated from the full content of the production service every day at 03.00 GMT/BST.
Therefore, any submissions made to the test service will be removed by the following day.

When you are using the test service the receipt XML will contain the following message:

.. code-block:: xml

    <INFO>This submission is a TEST submission and will be discarded within 24 hours</INFO>

It is advisable to first test your submissions using the Webin test service before establising an automated
submission pipeline.

Types of XML
============

The type of each submitted XML file must be specified at time of submission.

When using curl each XML file is submitted using the ‘-F’ option:

.. code-block:: xml

    -F "XMLTYPE=@FILENAME"

where the ``XMLTYPE`` is one of the following POST parameters:

- ```SUBMISSION`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.submission.xsd>`_
- ```STUDY`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.study.xsd>`_
- ```SAMPLE`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.sample.xsd>`_
- ```EXPERIMENT`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.experiment.xsd>`_
- ```RUN`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.run.xsd>`_
- ```ANALYSIS`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.analysis.xsd>`_
- ```PROJECT`` <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/ENA.project.xsd>`_

You can include multiple records of the same type in the same submission as part of a SET.
For example, by grouping SAMPLE records in a <SAMPLE_SET></SAMPLE_SET>.

The maximum allowed size of a submitted XML file is 15MB.
If your XML exceeds this size, please split your records into smaller XMLs and submit them across multiple submissions
or use the `Webin V2 API <programmatic.html>`_.

Below is an example of a sequence read data submission to the Webin test service:

.. code-block:: xml

    curl -u username:password -F "SUBMISSION=@submission.xml" -F "EXPERIMENT=@experiment.xml" -F "RUN=@run.xml" "https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/"

Submission XML
==============

Each submission should contain a submission XML file which defines the submission actions. The most commonly used
submission actions are listed below.

Submission XML: submit new objects
==================================

The ``ADD`` action is used when submitting new objects. A corresponding submission XML will look like:

.. code-block:: xml

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

The HoldUntilDate specifies the public release date of any studies submitted within the submission.
This can be at most two years in the future.

Submission XML: update existing objects
=======================================

The ``MODIFY`` action is used when updating existing objects. A corresponding submission XML will look like:

.. code-block:: xml

    <SUBMISSION>
        <ACTIONS>
            <ACTION>
                <MODIFY/>
            </ACTION>
        </ACTIONS>
    </SUBMISSION>

Checklist for preparing an object for update:

- The new XML for the object must either contain the original alias or the assigned accession.
- If you provide an alias then it must be given exactly as in the initial submission.
- If you provide an accession then it must be the accession number assigned to the object in the initial submission.
- Run XML objects can’t be updated to point to different data files.
- Analysis XML objects can’t be updated to point to different data files.

Below is an extract of an study XML which contains an accession number:

.. code-block:: xml

    <STUDY accession="ERP000011">
        ...
    </STUDY>

Below is an extract of an study XML which contains an alias:

.. code-block:: xml

    <STUDY alias="study1">
        ...
    </STUDY>

Submission XML: validate objects
================================

The VALIDATE action is used when validating a submission without actually creating or updating any objects.
It can be used together with the ``ADD`` action (default) or with the ``MODIFY`` action:

.. tabs::

   .. tab:: ADD action

      .. code:: none

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

   .. tab:: MODIFY action

      .. code:: none

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

Submission XML: cancel objects
==============================

Pre-publication private objects (with the exception of assemblies) can be cancelled by all submitters.

To cancel objects, you must use the ``CANCEL`` action in the submission XML.

The ``CANCEL`` action should point to the object that is being cancelled. Please note that the ``CANCEL`` action will be
propagated from studies to all associated experiments and analyses, and from experiments to all associated runs.

Below is an example of a submission XML used to cancel objects:

.. code-block:: xml

    <SUBMISSION>
        <ACTIONS>
            <ACTION>
                <CANCEL target="TODO: object accession number"/>
            </ACTION>
        </ACTIONS>
    </SUBMISSION>

Submission XML: request a receipt XML
=====================================

The ``RECEIPT`` action can be used to request a receipt XML issued as a result of an ``ADD`` action that contains all the
issued accession numbers. This is especially useful in cases where the submission request times out before it has
completed. The submission process will continue nevertheless and the issued accession numbers can be later requested
using the ``RECEIPT`` action.

.. code-block:: xml

    <SUBMISSION_SET>
        <SUBMISSION>
            <ACTIONS>
                <ACTION>
                    <RECEIPT target="submission alias or accessions"/>
                </ACTION>
            </ACTIONS>
        </SUBMISSION>
    </SUBMISSION_SET>

Submission actions without submission XML
=========================================

Some submission actions can be defined using the ACTION POST parameter. If the ACTION parameter is provided then the submission XML will be ignored.

You can use the following actions in place of submission XML:

- ``ACTION=ADD``: create new objects in the archive
- ``ACTION=MODIFY``: update existing objects in the archive
- ``ACTION=VALIDATE`` (same as ``ACTION=VALIDATE,ADD``)
- ``ACTION=VALIDATE,ADD``: validate new objects without creating them
- ``ACTION=VALIDATE,MODIFY``: validate update of existing objects without updating them

In addition, you can use the following POST parameters with the ``ACTION`` parameter:

- ``HOLD_DATE``: set the public release date for a new study or sample
- ``CENTER_NAME``: set the submitting center name (mandatory for brokers)

For example, submit a new analysis:

.. code-block:: xml

    curl -u username:password -F "ACTION=ADD" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/" -F "ANALYSIS=@analysis.xml"

or submit a new study with a public release date:

.. code-block:: xml

    curl -u username:password -F "HOLD_DATE=31-11-2019"  -F "ACTION=ADD" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/" -F "PROJECT=@project.xml"

Receipt XML
===========

Once a submission has been processed a receipt XML (`XML Schema <https://ftp.ebi.ac.uk/pub/databases/ena/doc/xsd/sra_1_5/SRA.receipt.xsd>`_) is returned.

To know if the submission was successful look in the first line of the ``<RECEIPT>`` block.

The attribute ``success`` will have value ``true`` or ``false``. If the value is false then the submission did not succeed.
In this case check the rest of the receipt for error messages and after making corrections, try the submission again.

If the ``success`` attribute is ``true`` then the submission was successful. The receipt will contain the accession numbers
of the objects that you have submitted. In the case of a study submission this is likely to be the accession that you
will be including in a publication.

An example of a successful run submission:

.. code-block:: xml

    <RECEIPT receiptDate="2014-12-02T16:06:20.871Z" success="true">
        <RUN accession="ERR049536" alias="run_1" status="PRIVATE"/>
        <SUBMISSION accession="ERA390457" alias="submission_1"/>
        <ACTIONS>ADD</ACTIONS>
    </RECEIPT>

Above, the assigned run accession number ``ERR049536`` is provided in the ``accession`` attribute within the RUN block.

If the submission was not successful the Receipt XML will contain the error messages within the ``MESSAGES`` block:

.. code-block:: xml

    <RECEIPT receiptDate="2014-12-02T16:06:20.871Z" success="false">
        ...
        <MESSAGES>
            <ERROR>This is an error message.</ERROR>
        </MESSAGES>
        ...
    </RECEIPT>

Retrieving submitted XMLs
=========================

Submitted XMLs can be retrieved from the submission service using the assigned accession numbers.
This can be a helpful, for example, as a starting point for making modifications to the submitted objects.

Please substitute ``<accession>`` with the assigned accession number in the URLs below:

- Project XML: ``https://www.ebi.ac.uk/ena/submit/drop-box/projects/<accession>``
- Study XML: ``https://www.ebi.ac.uk/ena/submit/drop-box/studies/<accession>``
- Sample XML: ``https://www.ebi.ac.uk/ena/submit/drop-box/samples/<accession>``
- Run XML: ``https://www.ebi.ac.uk/ena/submit/drop-box/runs/<accession>``
- Experiment XML: ``https://www.ebi.ac.uk/ena/submit/drop-box/experiments/<accession>``
- Analysis XML: ``https://www.ebi.ac.uk/ena/submit/drop-box/analyses/<accession>``











