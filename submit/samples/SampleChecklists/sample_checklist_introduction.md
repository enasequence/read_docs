# Introduction 

Sample checklists are used to ensure that both the minimum core metadata and metadata specific to different sample types are submitted to ENA. Please see: [background to sample checklists in ENA](https://ena-browser-docs.readthedocs.io/en/latest/browser/sample-checklists.html) and the available [ENA sample checklists](https://www.ebi.ac.uk/ena/browser/checklists).

The [Genome Standards Consortium(GSC)](http://www.gensc.org//pages/projects/mixs-gsc-project.html) works with many communities to generate the _“Minimum Information about any (X) Sequence” (MIxS) specifications_. ENA and other INSDC members implement the MIxS standards. Essentially these consist of:
* Community specific checklists, but with each having a core of shared metadata terms.
* Metadata terms of a specific name and definition.
* Sometimes a required pattern for the value, ranging from an integer to free text.

## Working together on Improving Standards
As outline above, ENA collaborates with [GSC](http://www.gensc.org//pages/projects/mixs-gsc-project.html), [INSDC](https://www.insdc.org/) and other standards bodies to help meet our increasingly diverse user needs and increase interoperability. The sequence technologies continue to evolve at pace and scientists apply them to help investigate basic biology, disease and biodiversity.

There are some considerations with these standards especially in that the actual implementation varies in different organisations. Generally we try to minimise the differences to increase interoperability. Here are some examples:
* In ENA, we use the **long term name**(called "title" in GSC MIxS) rather than the **short term name**. This is because some of the short names are ambiguous abbreviations, so the longer names provide more clarity. 
* In MIxS, many of the checklists are called **combinations**; these consist of **core** terms and **extension** terms. In ENA, a small subset of these terms(e.g. taxonomy) will not be in the sample checklist as they are handled separately. 
* In ENA, some terms have broader concepts than the MIxS  e.g. we use **depth** term more generally rather than just **soil depth** we also use the same term to cover **depth below sea level**
* There are several MIxS terms such as **miscellaneous attribute**, which are not used in the ENA checklists, as they are ambiguous and not interoperable.
We do regularly mutually share suggested changes to definitions, term naming or additional terms.

## Time Scales of Updates
We try to get the balance of being stable and predictable, whilst still being responsive enough to meet the needs of communities.
* Generally ENA and other INSDC members commit to checklist updates following the major MIxS releases e.g. 4.0, 5.0, 6.0, 7.0. These are typically every 2 to 3 years.
  * Updates, even with much automation can take many weeks of full time equivalent work to add and quality control. 
  * Sometimes terms change names and then change back again between sub-releases.
* If important terms, improved term definitions or even checklists are needed by ENA's user communities, we often promptly add those in.
