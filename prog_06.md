# Module 6: Update a Study

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
found in [Programmatic Submission Options](prog_01.html).
Study XMLs can also be manually edited using the 
[Webin XML and reports portal](prog_11.html).