================
Umbrella Studies
================

Umbrella Studies are study objects in the ENA which provide a hierarchal grouping of other studies.
This is useful for grouping together any separate-but-related data you have, especially where the datasets will have different release dates.
The release dates of the umbrella and its children are independent of each other.

Please note that umbrella studies can only be created and updated from the command line, by using curl to submit XML files you have created.

Decide which of the following scenarios best describes your need and follow the relevant guidance:

- I have existing studies I would like to group together under an umbrella: `Grouping Studies Under An Umbrella`_
- I have an umbrella already and would like to add child studies to it: `Adding Children To An Umbrella`_

In either case, you will need to create two XML files, then submit them to us with a curl command.
If you wish to test your submission, specify the URL of the test service in your curl command: https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/


Grouping Studies Under An Umbrella
==================================

To group your studies under an umbrella, you will need to create two XML files.

**submission.xml:**

.. code-block:: xml

    <SUBMISSION>
        <ACTIONS>
            <ACTION>
                <ADD/>
            </ACTION>
        </ACTIONS>
    </SUBMISSION>

**umbrella.xml:**

.. code-block:: xml

    <PROJECT_SET xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <PROJECT center_name="" alias="">
            <TITLE></TITLE>
            <DESCRIPTION></DESCRIPTION>
            <UMBRELLA_PROJECT/>
            <RELATED_PROJECTS>
              <RELATED_PROJECT>
                <CHILD_PROJECT accession=""/>
              </RELATED_PROJECT>
              <RELATED_PROJECT>
                <CHILD_PROJECT accession=""/>
              </RELATED_PROJECT>
            </RELATED_PROJECTS>
        </PROJECT>
    </PROJECT_SET>

Edit umbrella.xml to contain the following information:

- Centre name
- Alias (a unique, informative name for your project)
- Title
- Description
- Child project accessions

You can add more child projects by inserting more <RELATED_PROJECT> blocks, or you can remove a block if you only wish to add one project at this time.

When you are satisfied with the changes you have made to umbrella.xml you should run the following command from the directory in which both XML files are located:

.. code-block:: shell

    curl -u Username:Password -F "SUBMISSION=@submission.xml" -F "PROJECT=@umbrella.xml" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/"

| You must edit the command to include your Webin account ID and password.
  You can make a practice submission to our test server before your final submission if are unsure of the process.
  To do this, change the URL at the end to https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/ then run the command as normal.
| You will receive a receipt in XML form.
  You should note the 'success' attribute which will be true or false to indicate success or failure of your submission.
  If the submission was successful, the receipt will also contain the accessions of your project.
  These begin 'ERP' and 'PRJEB'.
  The receipt for a failed submission will contain error messages which will advise you on how to fix your submission.


Adding Children To An Umbrella
==============================

If you have already created an umbrella study and want to add child studies to it, create the following XML files.

**update.xml:**

.. code-block:: xml

    <SUBMISSION>
         <ACTIONS>
             <ACTION>
                 <MODIFY/>
             </ACTION>
        </ACTIONS>
    </SUBMISSION>

**umbrella_modified.xml:**

The file umbrella_modified.xml should be a copy of the XML already in existence for your umbrella study, except that it contains additional <CHILD_PROJECT> blocks to specify the accessions to be added.

When you are satisfied with the updates to your umbrella project XML file, submit via curl:

.. code-block:: shell

    curl -u Username:Password -F "SUBMISSION=@update.xml" -F "PROJECT=@umbrella_modified.xml" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/"

| Edit the command to include your Webin account ID and password.
  You can make a practice submission to our test server before you submit to the production server if you want to test your files.
  To do this, change the URL at the end of the command to https://wwwdev.ebi.ac.uk/ena/submit/drop-box/submit/ then run the command.
| You will receive a receipt in XML form.
  Note the 'success' attribute in this receipt, which will read true or false to indicate whether your submission was accepted.
  If the submission failed, there will be specific error messages to advise you of the problem.


Releasing Umbrella Studies
==========================

Umbrella studies do not appear in the list of studies shown in your Webin account.
Modifying the release date must therefore be done programmatically as well.

Create an XML with the HOLD action, specifying the new release date and project accession:

**hold_date.xml**

.. code-block:: xml

	<SUBMISSION>
		<ACTIONS>
			<ACTION>
				<RELEASE target="PRJEBxxxxxx" />
			</ACTION>
		</ACTIONS>
	</SUBMISSION>

Submit this XML to us using curl:

.. code-block:: shell

	curl -u Username:Password -F "SUBMISSION=@hold_date.xml" "https://www.ebi.ac.uk/ena/submit/drop-box/submit/"

You will be presented with an XML <RECEIPT> which contains an attribute 'success'.
This will indicate to you whether the update has been accepted or not.
