# Updating a Sample Submission Programmatically

The main difference between programmatically creating new samples and updating existing ones
is that the `MODIFY` action should be used instead of the `ADD` action:

```
<WEBIN>
    <SUBMISSION_SET>
		<SUBMISSION>
			<ACTIONS>
				<ACTION>
					<MODIFY/>
				</ACTION>
			</ACTIONS>
		</SUBMISSION>
	</SUBMISSION_SET>
</WEBIN>
```

Please note that the sample XML/JSON must either contain the original alias or the 
assigned accession number for the correct sample to be updated.

## Releasing sample submissions programmatically

The `RELEASE` action can be used to release samples programmatically:

```
<WEBIN>
    <SUBMISSION_SET>
		<SUBMISSION>
			<ACTIONS>
				<ACTION>
					<RELEASE target="ERS1234"/>
				</ACTION>
				<ACTION>
					<RELEASE target="ERS4321"/>
				</ACTION>
			</ACTIONS>
		</SUBMISSION>
	</SUBMISSION_SET>
</WEBIN>
```

These XML files can be submitted using a cURL command:

```
curl -u username:password -X POST 'https://www.ebi.ac.uk/ena/submit/webin-v2/submit' \
-H 'Accept: application/xml' \
-H 'Content-Type: application/xml' \
-T 'submission file name'
```

Detailed advice on how to programmatically update samples using XML or JSON format 
including instructions for retrieving previously submitted samples can be 
found in [Programmatic Submission Options](../../submit/general-guide/programmatic.rst).
Sample XMLs can also be manually edited using the 
[Webin Portal](../../submit/general-guide/submissions-portal.rst).
