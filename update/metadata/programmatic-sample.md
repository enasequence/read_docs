# Updating a Sample Submission Programmatically

The main difference between programmatically creating new samples and updating existing ones
is that the `MODIFY` action should be used instead of the `ADD` action:

```xml
<SUBMISSION>
     <ACTIONS>
         <ACTION>
             <MODIFY/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

Please note that the new sample XML must either contain the original alias or the 
assigned accession number for the correct sample to be updated.

Detailed advice on how to programmatically update samples using XML 
including instructions for retrieving previously submitted Sample XMLs can be 
found in [Programmatic Submission Options](../../submit/general-guide/programmatic.html).
Sample XMLs can also be manually edited using the 
[Webin Portal](../../submit/general-guide/submissions-portal.html).
