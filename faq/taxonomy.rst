===============
Sample Taxonomy
===============


Which Taxonomy Database Does ENA Use?
-------------------------------------

NCBI Taxonomy, which classifies the source organism of every INSDC record and is browsable through the
`ENA browser <https://www.ebi.ac.uk/ena/browser/view/Taxon:9606>`_.
ENA works alongside taxonomists at NCBI so that all ENA records display the accepted organism name and classification
hierarchy.

It covers the complete tree of life, and also synthetic constructs and environmental samples.
It is not exhaustive, however: it only holds taxa for data represented in INSDC records, and a taxon is only displayed
once at least one associated ENA record exists.


Which Taxonomy Should I Use For My Samples?
-------------------------------------------

Submitted organism names must be at **species rank**.
This does not mean the name has to be a published binomen such as *Homo sapiens*: species is a rank, and its purpose
here is to distinguish the sequenced organism from another.
Unidentified strains of the same bacterial genus should therefore be kept as separate species rather than binned
together under the genus name.

.. tip::
   A `binomial <#how-do-i-check-whether-a-taxon-can-be-used>`_ taxon ID should be used in most cases, and is
   **required** when submitting a 'clone or isolate' genome assembly.
   If your sample has been identified to species rank but is not yet a published binomen, a
   `placeholder <../submit/samples/taxonomy-requests.html#unidentified-novel-organisms>`_ taxon ID may be requested,
   and counts as binomial for submission purposes.

If your sample cannot be identified to a binomial taxon, register it as an
`environmental sample <#what-taxonomy-should-i-use-for-environmental-samples>`_ instead.

When registering samples through the `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin>`_ you enter a valid
species-rank taxon in the template spreadsheet.
Programmatic submitters supply it in the sample XML:

.. code-block:: xml

    <SAMPLE_NAME>
      <TAXON_ID>450267</TAXON_ID>
      <SCIENTIFIC_NAME>Chlamyphorus truncatus</SCIENTIFIC_NAME>
      <COMMON_NAME>Pink fairy armadillo</COMMON_NAME>
    </SAMPLE_NAME>


How Do I Check Whether A Taxon Can Be Used?
-------------------------------------------

Look it up through the ENA taxonomy REST service, which reports whether a taxon is ``submittable`` and whether it is
``binomial``.

Four endpoints are available, depending on what you know:

- ``suggest-for-submission/`` — you have an idea of the name, including a common name such as 'dog'
- ``scientific-name/`` — you know the exact scientific name
- ``any-name/`` — you have any name, formal or informal
- ``tax-id/`` — you already have the taxon ID

For example:

.. code-block:: bash

   curl "https://www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/curry"

Only taxa returned as ``"submittable": "true"`` can be used to register a sample.

See `Programmatically Accessing Taxonomic Information <../retrieval/programmatic-access/taxon-api.html>`_ for the full
responses, the XML and lineage endpoints, and bulk download options.


What Taxonomy Should I Use For Environmental Samples?
-----------------------------------------------------

Every ENA sample must carry a taxonomic classification, and environmental material is covered by two distinct kinds of
taxon: **biome-level** and **organism-level**.

Which applies depends on what the sample represents.
A sample standing for a whole environment takes a biome-level taxon; a single organism identified from that environment
by homology alone takes an organism-level taxon.


Biome-level taxonomy
~~~~~~~~~~~~~~~~~~~~

Biome-level samples cannot be described by a single organism identifier, because they represent an environment
containing an unknown variety and number of organisms.
The taxonomy database holds entries used exclusively for these.

They are recognisable by the word **metagenome** in the scientific name, and are searchable through the same endpoints
as any other taxon:

.. code-block:: bash

   curl "https://www.ebi.ac.uk/ena/taxonomy/rest/suggest-for-submission/marsupial%20meta"

To see everything available, browse the
`"metagenomes" tax node <https://www.ebi.ac.uk/ena/browser/view/408169?show=tax-tree>`_ and expand the lineages:

.. image:: images/tax_p01.png
   :align: center

Note that new metagenome taxa are rarely added, particularly more granular ones.
Use the closest available choice even if it is less specific than you would like, and request a new term only if
nothing existing can be made to fit.


Organism-level taxonomy
~~~~~~~~~~~~~~~~~~~~~~~

Use an organism-level environmental taxon when you are submitting assembled or annotated sequences identified
taxonomically **from homology alone**, with no prior culturing or isolation — sequences produced by 16S amplification
of a metagenomic sample, for example, or a single genome assembled from a mixed DNA sample.

Organisms that can be reliably recovered from a diseased host, such as endosymbionts and phytoplasmas, and organisms
readily identifiable by other means, such as cyanobacteria, are **not** treated this way.

Identify the organism as granularly as you can, up to genus level.
A non-binomial genus-level name with a species epithet is acceptable:

::

    Escherichia sp.
    Bacillus sp.
    Thermococcus sp.

For fungi, the 'sp.' is dropped:

::

    uncultured <Rank>
    uncultured Glomus
    uncultured Saccharomycetes

Where no more granular identification is possible, a family- or order-level taxon may be used:

::

    Neisseriaceae bacterium  (taxid:2014784)
    Spirochaetaceae bacterium  (taxid:1898206)
    Pleosporales sp. enrichment culture  (taxid:1836897)
    Filobasidium mucilaginum  (taxid:2877763)

Alongside the organism-level sample, register a biome-level sample describing the environment that was sequenced, and
reference it from the organism-level sample using the 'sample derived from' attribute.
See `Metagenome Assembly Submissions <../submit/assembly/metagenome.html>`_ for how the two fit together.

If you are unsure whether your sample should be registered as environmental, contact the ENA
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_.


Do I Need To Request A New Taxon?
---------------------------------

Not if the name is already in the taxonomy database — use the existing taxon ID and continue with your submission.

This also applies where the name you want is recorded as a **synonym** of an existing entry rather than as its primary
name: the existing taxon ID covers it, and no new entry will be created.
Searching for your name in the taxonomy database returns the entry it is a synonym of.

Request a new taxon only where no existing entry covers your organism.
If an entry exists but is wrong, that is a correction rather than a new request.


My Organism Is Unidentified Or Only Known To Genus Level — What Do I Use?
-------------------------------------------------------------------------

A genome submission requires a submittable name at species rank.
Genus-level names such as ``Genus sp.`` on their own, and uncultured names which are not present in NCBI Taxonomy,
cannot be used for genome submissions.

Where the organism cannot be confidently assigned to an existing species, request a new taxon using an informal name of
the form ``<Genus> sp. <identifier>``, where the identifier is unique to the culture — a strain or voucher ID of at
least three characters, such as ``Bacillus sp. ABC123``.
The informal name can be updated to a formal one once the species is described and published.

Naming rules differ by organism category, with separate conventions for prokaryotes, eukaryotes, environmental samples,
cyanobacteria, synthetic sequences, viruses and endosymbionts.
See `naming rules for unidentified and novel organisms
<../submit/samples/taxonomy-requests.html#unidentified-novel-organisms>`_.


How Do I Request A New Taxon Name?
----------------------------------

Requests are made through the `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin>`_ using the 'Register taxonomy'
option, not by email to the helpdesk.
Enter names one at a time with the form, or use the spreadsheet option for many names at once.

Submit all your names as a **single** request: multiple separate requests may be rejected.
Once ENA has reviewed the request it goes to the taxonomy service, and after the names are added they are indexed in
the submission tools within two days.

For the full process and the naming rules for each organism category, see
`Requesting New Taxon IDs <../submit/samples/taxonomy-requests.html>`_.


An Existing Taxon Is Wrong — Can It Be Corrected?
-------------------------------------------------

Yes.
Where an entry already exists but is incorrect, request a correction rather than a new taxon.
This covers a misspelled or outdated scientific name, a synonym that should be recorded against an existing entry, two
entries describing the same organism that should be merged, and an incorrect lineage placement.

Send the request through the `Webin Portal <https://www.ebi.ac.uk/ena/submit/webin>`_ or the ENA
`helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_, and include:

- the taxon ID and current name of the affected entry;
- the change you are asking for, stated precisely;
- supporting references, where the change follows a published revision.

Corrections are reviewed by ENA staff and passed to the NCBI Taxonomy curators, who maintain the database on behalf of
all INSDC partners.
Because the change is made externally, corrections take longer than adding a new name, and the outcome is decided by
the taxonomy curators rather than by ENA.
