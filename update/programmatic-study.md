# Updating a Study Submission Programmatically

The main difference between programmatically creating new studies and updating existing ones
is that the `MODIFY` action should be used instead of the `ADD` action:

```
<SUBMISSION>
     <ACTIONS>
         <ACTION>
             <MODIFY/>
         </ACTION>
    </ACTIONS>
</SUBMISSION>
```

Please note that the new study XML must either contain the original alias or the 
assigned accession number for the correct study to be updated.

Detailed advice on how to programmatically update studies using XML 
including instructions for retrieving previously submitted Study XMLs can be 
found in [Programmatic Submission Options](general-guide/programmatic.html).
Study XMLs can also be manually edited using the 
[Webin submissions portal](general-guide/submissions-portal.html).