=============================
Sample Checklist Introduction
=============================

------------
Introduction
------------

Sample checklists are used to ensure that both the minimum core metadata and metadata specific to different sample types are submitted to ENA.
Please see: `background to sample checklists in ENA <https://ena-browser-docs.readthedocs.io/en/latest/browser/sample-checklists.html>`_
and the available `ENA sample checklists <https://www.ebi.ac.uk/ena/browser/checklists>`_.

ENA has many different sample checklists (about 40). The most basic is the generic checklist which can be useful for any sample. However please try to pick
the sample sheet most appropriate to your sample type, as the metadata being collected is likely to be most relevant and makes your data more useful to the scientific community.
Sample checklists typically created where a community needs one focused on their needs.

The `Genome Standards Consortium(GSC) <http://www.gensc.org//pages/projects/mixs-gsc-project.html>`_
works with many communities to generate the _“Minimum Information about any (X) Sequence” (MIxS) specifications. ENA and other INSDC members implement the MIxS standards. Essentially these consist of:

* Community specific checklists, but with each having a core of shared metadata terms.
* A metadata term(field) has a specific name and definition.
* Sometimes there is either:

  * a controlled list of values
  * or required pattern for the value, for example an integer.

---------------------------------------
Working together on Improving Standards
---------------------------------------

As outlined above, ENA collaborates with
`GSC <http://www.gensc.org//pages/projects/mixs-gsc-project.html>`_, `INSDC <https://www.insdc.org/>`_ and other standards bodies to help meet our increasingly diverse user needs and increase interoperability. The sequence technologies continue to evolve at pace and scientists apply them to help investigate basic biology, disease and biodiversity.

There are some considerations with these standards especially in that the actual implementation varies in different organisations. Generally we try to minimise the differences to increase interoperability. Here are some examples:

* In ENA, we use the **"long" term name** (called "title" in GSC MIxS) rather than the **"short" term name** . This is because some of the short names are ambiguous abbreviations, so the longer names provide more clarity.
* In MIxS, many of the checklists are called **combinations**; these consist of **core** terms and **extension** terms. In ENA, a small subset of these terms(e.g. taxonomy) will not be in the sample checklist as they are handled separately. 
* In ENA, some terms have broader concepts than the MIxS  e.g. we use **depth** term more generally rather than just **soil depth** we also use the same term to cover **depth below sea level**
* There are several MIxS terms such as **miscellaneous attribute**, which are not used in the ENA checklists, as they are ambiguous and not interoperable.
We do regularly mutually share suggested changes to definitions, term(field) naming or additional terms.

----------------------------------
Time Scales of of GSC MIxS Updates
----------------------------------

We try to get the balance of being stable and predictable, whilst still being responsive enough to meet the needs of communities.

* Generally ENA and other INSDC members commit to checklist updates following the major MIxS releases e.g. 4.0, 5.0, 6.0, 7.0. These are typically every 2 to 3 years.

  * Updates, even with much automation can take many weeks of full time equivalent work to add and quality control.
  * Sometimes terms(fields) change names and then change back again between sub-releases.
* If important terms, improved term definitions or even checklists are needed by ENA's user communities, we often promptly add those in.
