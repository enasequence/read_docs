===========================
Sample Checklist Versioning
===========================

Use the latest published version of the ENA sample checklist that fits your
sample type when preparing a new submission. If you already have a spreadsheet
or a submission script, check the current checklist before reusing it.

What a checklist version means
==============================

A sample checklist defines which metadata fields you can provide and which
values ENA accepts. An accession such as ``ERC000014`` identifies the checklist.
A version identifies a particular revision of its fields and validation rules.
A new version may add fields, change which fields are mandatory, or change the
formats or values accepted for a field.

ENA retains previous checklist versions so existing submissions remain valid
when the checklist changes. If you need to correct an existing sample, follow
the :doc:`sample update instructions </update/metadata>` and use its existing
sample accession.

Find the current checklist
==========================

1. Open the `ENA sample checklist catalogue
   <https://www.ebi.ac.uk/ena/browser/checklists>`_.
2. Find your checklist by name or accession and open its record. For example,
   open the `GSC MIxS human-associated checklist (ERC000014)
   <https://www.ebi.ac.uk/ena/browser/view/ERC000014>`_.
3. Review the current field definitions, including which fields are mandatory,
   their accepted values or formats, and any units. If you need a versioned
   schema for local validation or reproducibility, see the
   `JSON Schema Store API documentation
   <https://github.com/EBIBioSamples/json-schema-store#apis-and-usage>`_.
   The Schema Store documents separate lookups for the latest schema by
   accession and a specific revision by accession and version.

Use the current checklist for a new submission
==============================================

In Webin Portal
---------------

1. Sign in to `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/>`_,
   choose **Register Samples**, and select your checklist.
2. Download a fresh spreadsheet template. If you have an older spreadsheet,
   transfer your data into the matching fields in the new template. Keep the
   template's header and instruction rows and complete any newly required
   fields.
3. Upload the completed spreadsheet for validation. Correct any reported
   errors before submitting. See :doc:`interactive` for the full workflow.

In a submission script
----------------------

1. Retrieve the checklist definition through the ENA Browser API. For example,
   `download the ERC000014 checklist as XML
   <https://www.ebi.ac.uk/ena/browser/api/xml/ERC000014>`_.
2. Update your field mappings and values to match the published definition.
   Use the checklist accession in the sample's ``ENA-CHECKLIST`` attribute in
   XML or the ``ena-checklist`` attribute in JSON, as shown in the
   :doc:`programmatic submission examples </submit/general-guide/programmatic>`.
3. Run a representative submission against the Webin test service before
   sending your batch to production. Keep a copy of the checklist definition
   used to prepare the batch and record its version if available.
