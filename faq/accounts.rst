==========================
Accounts and Collaboration
==========================



How Do I Get An Account To Submit Data?
---------------------------------------

Register a Webin submission account through the
`Webin Portal <https://www.ebi.ac.uk/ena/submit/webin/login>`_ and add at least one contact to it.
Your centre name is applied to every submission you make from the account, so check it is correct before you submit
anything.

See `Register a Submission Account <../submit/general-guide/registration.html>`_ for the full process.


Can Several People In My Group Submit Under The Same Account?
-------------------------------------------------------------

Yes.
Add the people involved as contacts on the account, under 'Home' > 'Manage Account'.
The owner and the added contacts are listed as contacts on public submissions, and the helpdesk will only act on certain
requests (e.g. data suppression) when they come from a named account contact.

Note that access cannot be divided within an account: everyone who can use it can see and edit all of its submissions,
and permissions cannot be restricted to particular studies.
ENA does not provide general-purpose group accounts.
Where different people need access to different data, register a separate account for each group.

See `Collaborating on submissions <../submit/general-guide/registration.html#collaborating-on-submissions>`_.


How Do Independent Labs Collaborate On One Study?
-------------------------------------------------

An **umbrella study** is a study object that groups other studies together, rather than holding data of its own.
It gives a set of related studies a single accession and a single public page, while each child study keeps its own
data, its own owner and its own release date.

This is the usual arrangement for a multi-lab collaboration: each lab keeps its own Webin account and its own studies,
and the related studies are grouped under one umbrella managed from a single account.

Umbrella links are added from the parent downwards: the owner of the umbrella can add public child studies owned by
other accounts, but the owner of a child study cannot attach it to someone else's umbrella.
Release dates stay independent — releasing the umbrella does not release its children, and vice versa.

See `Umbrella Studies <../submit/study/umbrella.html#create-an-umbrella-study>`_ for more information.


Can I Remove A Study From An Umbrella?
--------------------------------------

Not yourself.
The ``MODIFY`` action only adds child studies, so links cannot be removed by resubmitting the umbrella XML.

Contact the ENA `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_ with the accessions of both studies and say which
relationship should be removed, being explicit about which is the parent.
Where the link involves a study owned by another submitter, or one held at another INSDC archive, ENA may need to
confirm the change with them first.


Should I Request A Broker Account?
----------------------------------

Broker accounts are for institutions and organisations submitting data **on behalf of other people** — multiple users,
labs or studies that are not your own. Public data submitted by broker accounts list both the broker name (data broker) and 
centre name (data owner) associated with the submission.
If your group is submitting its own data, you do not need one: adding contacts to a regular account covers a single
group (see `Can Several People In My Group Submit Under The Same Account?`_), and an umbrella study covers a
collaboration across labs (see `How Do Independent Labs Collaborate On One Study?`_).

Note that brokers cannot suppress data once it has been publicly released, because those data have already been
exchanged with the INSDC partners.

See `Brokering Data to ENA <../submit/general-guide/data-brokering.html>`_ for how to request broker permissions,
and `Broker Responsibility <../submit/general-guide/data-brokering.html#broker-responsibility>`_ for what a broker
undertakes.


How Do I Get Credit For My ENA Records?
---------------------------------------

You can claim your studies, samples, experiments, assemblies and sequences to your ORCID iD through the EBI Search
service, after which they appear on your ORCID record.

See `How to claim a record <../submit/general-guide/orcid-claiming.html#how-to-claim-a-record>`_ for the steps.

Note that the account contacts named on a submission are included in certain record types, including those processed
into EMBL flat file format.
Make sure your contacts are correct before submitting if authorship matters for your records.
