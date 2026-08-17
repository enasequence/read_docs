=========================
Sample Metadata Standards
=========================



Which Sample Checklist Should I Use?
------------------------------------

Choose the checklist that matches the **biological material, organism or environment your samples came from**, not the
type of study or the sequencing you plan to do.
There is no separate checklist per study type — there is no dedicated 16S amplicon sheet, for example — and the fields
you are asked for depend entirely on the checklist you pick.

Use the **ENA default sample** checklist (ERC000011) only where nothing more specific applies.

See `Choosing a checklist <../submit/samples.html#choosing-a-checklist>`_ for worked examples, and browse the
`full range of checklists <https://www.ebi.ac.uk/ena/browser/checklists>`_ for more details.


What Spatiotemporal Metadata Is Mandatory?
------------------------------------------

All ENA sample checklists, including the default checklist, require **Geographic location (country and/or sea)** and
**collection date**, to at least the nearest country or sea and the nearest year.

+----------------------------+--------------------------------------------------------------------+
| Field name                 | Field description                                                  |
+============================+====================================================================+
| | **Geographic location**  | | The location the sample was collected from with the intention of |
| | **(country and/or sea)** | | sequencing as defined by the country or sea. Country or sea      |
|                            | | names should be chosen from the `INSDC controlled vocabulary`_.  |
|                            | | `Missing value reporting`_ is also valid.                        |
+----------------------------+--------------------------------------------------------------------+
| | **Collection date**      | | The date the sample was collected with the intention of          |
|                            | | sequencing, either as an instance (single point in time) or      |
|                            | | interval. In case no exact time is available, the date/time can  |
|                            | | be right truncated i.e. all of these are valid ISO8601 compliant |
|                            | | times: 2008-01-23T19:23:10+00:00; 2008-01-23T19:23:10;           |
|                            | | 2008-01-23; 2008-01; 2008. `Missing value reporting`_ is also    |
|                            | | valid.                                                           |
+----------------------------+--------------------------------------------------------------------+

.. _`INSDC controlled vocabulary`: https://www.insdc.org/submitting-standards/country-qualifier-vocabulary/
.. _`Missing value reporting`: https://www.insdc.org/submitting-standards/missing-value-reporting/

The requirement follows an
`INSDC standard <https://www.insdc.org/news/insdc-spatiotemporal-metadata-missing-values-update-03-04-2023/>`_ adopted
across the collaboration, intended to make sequence data more findable, accessible, interoperable and reusable (FAIR).

This also applies when you submit samples directly to BioSamples and intend to link them to ENA data: linking ENA data
to a BioSample of any source requires these minimal spatiotemporal metadata.

**Further granularity is encouraged.** Where you can, provide the specific date or time of collection rather than only the year, and use the additional fields Geographic location (latitude), Geographic location (longitude) and Geographic location (region and locality) where they apply.


My Checklist Uses Different Field Names For Location And Date — Are They Still Valid?
-------------------------------------------------------------------------------------

Yes.
Where a checklist previously captured country or collection date under a different term, those older terms are
supported as aliases of the standard terms and remain valid.
ENA encourages transitioning to **Geographic location (country and/or sea)** and **collection date**.

.. TODO: check with the team whether either of these prospective changes has since been made.

ENA is considering standardising on the two field names above so that older terms would no longer be accepted, and
separately may retire the coarser INSDC missing value terms — 'not collected', 'not provided' and 'restricted access' —
in favour of more granular reporting.
Neither change has been made.
Submitters will be given fair warning before any backwards-incompatible change.


How Do I Format A Precise Date And Location?
--------------------------------------------

Report the country in the mandatory field and put the region in the additional field.
Report the collection date as year-month-day followed by the time in ISO8601 format including the timezone.
For example:

**Geographic location (country and/or sea)** = France

**Geographic location (region and locality)** = Burgundy

**Collection date** = 2023-01-05T17:22:05Z+01


I Only Know The Year Of Collection — How Do I Report That?
----------------------------------------------------------

The minimum requirement is the country or sea and the date to the nearest year, so a known ocean and year fully satisfy
the standard and no missing value is needed:

**Geographic location (country and/or sea)** = Arctic Ocean

**Collection date** = 2019


Which Location And Date Apply To Ancient DNA Samples?
-----------------------------------------------------

The location and date reported are those of the collection event **made with the intention of sequencing**, not the
origin of the material.

If the sample came from a museum, report the location of the museum and the time it was collected for sequencing.
If it came from an archaeological site, report the site and the date of that collection event.

In both cases you can optionally also record the **original geographic location** and **original collection date** if
they are known.


What About Samples From A Zoo, Botanic Garden, Aquaculture Or Farm?
-------------------------------------------------------------------

The same principle applies: report the collection event when the sample was taken for sequencing.
For a species held outside its natural environment, that means the location of the museum, zoo, aquaculture facility,
botanic garden or farm.

Where the origin elsewhere is known, you can additionally report **original geographic location** and
**original collection date**.


What If I Cannot Provide One Of The Mandatory Fields?
-----------------------------------------------------

Report a valid
`INSDC missing value <https://www.insdc.org/submitting-standards/missing-value-reporting/>`_ in place of the value.
These terms record *why* the metadata are absent, so choose the one that describes your case.

You can supply one field and use a missing value for the other.
For example, a negative control prepared in a lab has no meaningful collection location, but does have a date:

**Geographic location (country and/or sea)** = missing: control sample

**collection date** = 2020-05-25

If you cannot share the metadata and no listed exemption describes your situation, please
`contact ENA <mailto:ena-collaborations@ebi.ac.uk>`_.


A Consortium Agreement Prevents Me Sharing These Metadata — How Do I Report It?
-------------------------------------------------------------------------------

Agreements that pre-date the standard (i.e. pre-2023) are a recognised exemption.
Report it as the reason the metadata are missing:

**Geographic location (country and/or sea)** = missing: data agreement-established pre-2023

**collection date** = missing: data agreement-established pre-2023

Where the agreement allows it, you can update the samples later to add the metadata.


My Spreadsheet Upload Fails With Missing Or Mismatched Fields
-------------------------------------------------------------

Save the file as tab-separated or, if that is not possible, comma-separated. Semicolons are not accepted as column separators and are a common cause of this error.

Then reopen the file in a spreadsheet program and check that every row has the same number of columns and that the values remain aligned with their column headers. A single misaligned row may be reported as missing or invalid metadata rather than as a formatting error.

See `Complete Template Spreadsheet <../submit/samples/interactive.html#step-2-complete-template-spreadsheet>`_ for the
full list of formatting rules.
