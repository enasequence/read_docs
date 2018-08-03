# Module 7: Update a Sample

The main difference between programmatically creating new samples and updating existing ones
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

Please note that the new sample XML must either contain the original alias or the 
assigned accession number for the correct sample to be updated.

Detailed advice on how to programmatically update samples using XML 
including instructions for retrieving previously submitted Sample XMLs can be 
found in [Programmatic Submission Options](prog_01.html).
Sample XMLs can also be manually edited using the 
[Webin submissions portal](prog_11.html).
