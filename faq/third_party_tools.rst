=================
Third Party Tools
=================

Members of the user community produce software to assist in the preparation 
and submission of files to ENA. Some go on to make these more widely available 
to other users.

The following are tools which are openly available. Please note that we are not
responsible for the creation or maintenance of these tools and if you have 
queries about their use you should contact the creators directly. While we had 
no hand in their production and have not thoroughly reviewed them, we have 
heard from users of them that they have been valuable. 


`EMBLmyGFF3 <https://github.com/NBISweden/EMBLmyGFF3>`_
  A creation of staff at NBI Sweden, this tool can be used to convert an assembly in
  FASTA format along with associated annotation in GFF3 format into the EMBL
  flat file format which is the required format for submitting annotated
  assemblies to us. More information available in their paper:
  https://doi.org/10.1186/s13104-018-3686-x

`Artemis Comparison Tool (ACT) <http://sanger-pathogens.github.io/Artemis/ACT/>`_
  A part of the Artemis Software developed at the Sanger Institute. Among
  other things, it can output your file in EMBL flat file format.

`EMBOSS Seqret <https://www.ebi.ac.uk/Tools/sfc/emboss_seqret/>`_
  A tool developed by colleagues at EBI. It can convert between many different
  formats for various different molecules.

`annonex2embl <https://github.com/michaelgruenstaeudl/annonex2embl>`_
  Available for the conversion of annotated DNA multi-sequence alignments in
  NEXUS format to an EMBL flat file suitable for submission via Webin-CLI. This
  was developed by Michael Gruenstaeudl and a paper is available with additional
  detail. DOI: https://doi.org/10.1093/bioinformatics/btaa209

`ENA upload cli <https://github.com/usegalaxy-eu/ena-upload-cli>`_
  This command line tool (CLI) allows easy submission of data and respective 
  metadata to the European Nucleotide Archive (ENA) using tabular files or an 
  excel spreadsheet. The tool allows programatic submission of all ENA objects 
  (study, sample, run and experiment) without the need of logging in to the 
  Webin interface. This also includes client side validation using ENA checklists 
  and releasing the ENA objects. 
