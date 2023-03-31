=================================
Spatiotemporal Metadata Standards
=================================

The `International Sequence Database Collaboration (INSDC) <https://www.insdc.org/>`_ has announced `further details <>`_ on
the new standards being introduced for reporting spatiotemporal metadata as part of our aim to make sequence data more
findable, accessible, interoperable and reusable (FAIR). The ENA and its INSDC partners are set to introduce mandatory
spatio-temporal information for all new samples **by the end of May 2023** unless a valid exemption is declared.
We feel this is a sensible minimal measure that will improve the utility of INSDC sequence data that all submitters
should be able to provide and where this can not,
`suitable reporting options <https://www.insdc.org/submitting-standards/missing-value-reporting/>`_ are available.
We look forward to seeing the positive impact this has on incoming data.

Implementation plans are shared in the full `INSDC announcement <>`_ with ENA-specific details below.


Implementation in the ENA - with immediate effect
=================================================

All sample checklists now recommend the following fields for reporting spatiotemporal metadata.
Both fields are now included in sample checklist template spreadsheets by default but will not be mandated until
the end of May 2023:

+----------------------------------------------+----------------------------------------------------------+
| Field name                                   | Field description                                        |
+==============================================+==========================================================+
| **Geographic location (country and/or sea)** | The location the sample was collected from with the      |
|                                              | intention of sequencing as defined by the country or     |
|                                              | sea. Country or sea names should be chosen from the      |
|                                              | `INSDC controlled vocabulary`_.                          |
|                                              | `Missing value reporting`_ is also valid.                |
+----------------------------------------------+----------------------------------------------------------+
| **collection date**                          | The date the sample was collected with the intention of  |
|                                              | sequencing, either as an instance (single point in time) |
|                                              | or interval. In case no exact time is available, the     |
|                                              | date/time can be right truncated i.e. all of these are   |
|                                              | valid ISO8601 compliant times:                           |
|                                              | 2008-01-23T19:23:10+00:00; 2008-01-23T19:23:10;          |
|                                              | 2008-01-23; 2008-01; 2008. `Missing value reporting`_ is |
|                                              | also valid.                                              |
+----------------------------------------------+----------------------------------------------------------+

.. _`INSDC controlled vocabulary`: https://www.insdc.org/submitting-standards/country-qualifier-vocabulary/
.. _`Missing value reporting`: https://www.insdc.org/submitting-standards/missing-value-reporting/


In the interim before the new standards are implemented, we encourage users to already begin to submit spatiotemporal
metadata in these fields for all samples you register with the ENA. Where this isn’t possible, please use one of the
valid `INSDC missing values <https://www.insdc.org/submitting-standards/missing-value-reporting/>`_ to report your
sample as an exception and if you are unable to share these metadata but your exemption is not on the list, please
`contact us <ena-collaborations@ebi.ac.uk>`_.


.. admonition:: For users and submission brokers who submit regularly...

   All existing XMLs and templates will continue to be submittable until the end of May but we encourage transitioning
   to follow the new standards in advance of the change. Where existing checklists previously used different reporting
   terms other than **Geographic location (country and/or sea)** and collection date to capture country or
   **collection date**, we will continue to support these old terms as ‘aliases’ to the standard terms and they will
   continue to be valid even after the standard is introduced, though we do encourage transition to the standard terms.


Implementation in the ENA - by the end of May 2023
==================================================

After May 2023, for sample registration, all checklists including the default checklist will include
**Geographic location (country and/or sea) and collection date as mandatory to at least the nearest country or sea and year.**

Where you are unable to provide metadata to the nearest country and year, there are valid exceptions to this rule and
a valid missing value will need to be provided following the INSDC
`guidelines <https://www.insdc.org/submitting-standards/missing-value-reporting/>`_ for reporting missing metadata.

Please note that from this date, when submitting samples directly via BioSamples with the intention of linking these
to ENA data, please ensure you provide these metadata in the BioSample or use a valid ENA standard when registering.
Linking ENA data to BioSamples of any source will require the minimal spatiotemporal metadata from this date.


.. admonition:: As always, further granularity is encouraged

   Although it will become mandatory to provide the year of collection, where you can, please also provide specific
   date or time of collection within the collection date field. We also encourage use of additional spatiotemporal
   fields such as **Geographic location (latitude)**, **Geographic location (longitude)**,
   **Geographic location (region and locality)** where these are applicable.


Implementation in the ENA - looking beyond
==========================================

We are looking forward to seeing an increase in the richness of metadata provided to INSDC and to the increased ability
for our users to identify the source of sequences in time and space.

As part of our work to improve the quantity of spatiotemporal metadata in the archive, we are also working to improve
the consistency of reporting. With this in mind, in the long-term we may consider standardising all samples so only
**Geographic location (country and/or sea)** and **collection date** field names are valid and old terms will no
longer remain valid.

Additionally, in future, we may choose to remove the option of submitting lower-level INSDC missing value reporting
terms - ‘not collected’, ‘not provided’ and ‘restricted access’ in favour of the more granular reporting values.

**Users will be provided fair-warning before the ENA makes any backwards compatible changes.**

Frequently Asked Questions and Examples
=======================================

I do not feel I am able to report on my spatiotemporal metadata but my exemption reason is not on the list - what should I do?
------------------------------------------------------------------------------------------------------------------------------

If you feel unable to share these metadata but your exemption is not on the list, please `contact us <ena-collaborations@ebi.ac.uk>`_.


I have an ancient DNA sample - how do I provide the spatiotemporal information for my sample? Which location and date should be reported?
-----------------------------------------------------------------------------------------------------------------------------------------

For ancient DNA samples, the location and date reported depends on when the sample was collected with the
intention of sequencing.

If the sample was from a museum, the location of the museum and time of collection should be provided.
This indicates the sample collection event with the intention of sequencing. In this case, if known, the
**original geographic location** and **original collection date** can optionally also be provided.

If the sample was from an archaeological site, the location of the site and the time of that collection event should
be provided.


I collected my sample for sequencing from a species outside of its natural environment (e.g. zoo, botanic garden) - how do I provide the spatiotemporal information for my sample?
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

For species originating elsewhere to where the sample was physically collected for sequencing e.g. species in a museum,
zoo, aquaculture, botanic garden or farm, the collection location is still useful information and the **collection date**
and **geographic location (country and/or sea)** provided should reflect the collection event when the sample was
collected for sequencing purposes. This means that for these kinds of samples, the location of the museum, zoo,
aquaculture, botanic garden or farm should be provided. In these cases, if there is a known origin elsewhere,
users can optionally also report the origin of the sample with the fields **original geographic location** and
**original collection date**.


My sample was collected from the Arctic Ocean but the date was not recorded and I only know the year in which it was sampled was sometime in 2019 - how do I report this?
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The minimum requirement is the name of the ocean/sea (or country) of the collection event and date to the nearest year.
In this case, as you know the ocean and the year of collection, there is no reason that you can not share these metadata.
You would report:

**Geographic location (country and/or sea)** = Arctic Ocean
**collection date**  = 2019


As part of my consortium, we set up an agreement that the data would be submitted to INSDC but that all metadata would not be shared until after 2 years. This agreement was organised prior to the standards change so we can’t comply. How do I report this?
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This is considered a valid exemption as we recognise that some consortia will have agreements that pre-date the new
standard and you can report this as a reason that the metadata are missing.

In this case, during initial sample registration you would report:

**Geographic location (country and/or sea)**  = missing: data agreement-established pre-2023
**collection date** = missing: data agreement-established pre-2023

Where this complies with the agreement made (such as this example), submissions can be updated at a later date to
include the missing metadata.

My sample was collected in the Burgundy region of France at 17:22:05 on the 5th January 2023. How do I format this for submission?
----------------------------------------------------------------------------------------------------------------------------------

You should report the collection date in the format year-month-day followed by the time in ISO8601 standard format
including the timezone. You should report the country as required but can also include the region in an additional field.
For example:

**Geographic location (country and/or sea)** = France
**Geographic location (region and locality)** = Burgundy
**collection date**  = 2023-01-05T17:22:05Z+01


What do I do if I can submit one of the mandatory fields but not the other?
---------------------------------------------------------------------------

We recognise there may be valid exemptions for this which are included for missing value reporting. For example,
you may have collected a control sample from a collection instrument to sequence a negative control. In this case,
the location of where you collected that control is not applicable to report as it was prepared in a lab but you
could report the date in which you collected the control sample.

In this case, you would report:

**Geographic location (country and/or sea)** = missing: control sample
**collection date** = 2020-05-25



