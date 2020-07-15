========================================
Forthcoming changes to the Feature Table
========================================

All planned changes to the Feature Table will be detailed here.

Forthcoming changes (annotated/assembled sequences)
===================================================

With effect of Feature Table document version 10.9 (December 2019) the following changes will be applied:

1. Value "contamination" added to ``/gap_type`` in the assembly_gap definition mandatory qualifiers

::
   Feature Key           assembly_gap

   Definition            gap between two components of a genome or transcriptome assembly;

   Mandatory qualifiers  /estimated_length=unknown or <integer>
              	         /gap_type="TYPE"
                         /linkage_evidence="TYPE" (Note: Mandatory only if the
                         /gap_type is "within scaffold", "repeat within scaffold" or
                          "contamination".


2. Value "contamination" added to  ``/gap_type`` in ``/linkage_evidence`` definition

::
   Qualifier       /linkage_evidence

   Definition      type of evidence establishing linkage across an
                   assembly_gap. Only allowed to be used with assembly_gap features
                   that have a /gap_type value of "within scaffold", "repeat within scaffold" or
                   "contamination"; Please note if /gap-type="contamination", /linkage_evidence must
                   be used and the value of /linkage_evidence must be "unspecified".


3. "proximity ligation" added to the allowed values for ``/linkage_evidence`` qualifier
