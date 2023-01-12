=====================
Brokering Data to ENA
=====================

Data brokering is the act of submitting data to ENA on behalf of another person/institute. In many cases a centralised national brokering facility is the most efficient means of data management at large scale.

In order to become a data broker, you must apply for brokering permissions to be added to your account. For more information, or to request a broker account, contact our `helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_, providing:

* some background: how you came to be a broker and who you are brokering on behalf of
* expected data volume: how much and how frequently you expect to submit
* broker names (both short, e.g. acryonym, and long): this will appear in our databases and your data files

Regular Accounts vs Broker Accounts
===================================

Submitting via a regular account results in affiliations linked to your Webin account being propagated into submitted objects. You can update your webin account settings through the Webin Submissions Portal.

As we expect that brokers will submit on behalf of others, having a broker account opens up some extra options to define the center name on a per-object basis:

* interactive submission: a new 'center name' tab become available 
* programmatic submission: define `center_name=` in each element of the submission (hint: wherever alias can be defined, center name can be defined). e.g. `<SAMPLE alias="sample_alias" center_name="centre_name">`
* Webin-CLI and Webin-CLI-REST: 'authors' and 'address' fields can now be used. The author list can be a comma-separated list. Example:

.. code-block:: bash

    AUTHORS Bloggs J., Doe J., Claus S.
    ADDRESS Nowhereville, US
 

.. note::
    Center names are free text and are not validated on the ENA side. There is no need to pre-register each center.

The difference between the two submission account types is most apparent in our sample display:

***Sample Display : regular account***

`SAMEA8697319 on the ENA Browser <https://www.ebi.ac.uk/ena/browser/view/SAMEA8697319>`_

.. image:: images/sample.non-broker.png

***Sample Display : broker account***

`SAMEA9079967 on the ENA Browser <https://www.ebi.ac.uk/ena/browser/view/SAMEA9079967>`_

.. image:: images/sample.broker.png


Authorship
==========

.. note::
    Whoever owns the account (normal or broker), has the ability to add contacts to the account. This refers to other individuals who will have access to the account. 

The list of account contacts, along with the owner of the account, will be defined as ‘authors’ for assemblies, and will be converted and added to the `RA` lines of EMBL files. If you have a broker account, and you wish to submit assemblies, you must provide the author list within the manifest files/JSON document. If not provided, then it is automatically retrieved from the Webin account.

Location
========
The address provided within the Webin account is used to populate the `RL` lines within EMBL files, during assembly submission. Again if you have a broker account, you can specify the address by providing this in the manifest files. If not provided, then it is automatically retrieved from the Webin account.

Broker Responsibility
=====================
Since data brokers submit data on behalf of data owners, they have certain responsibilities that need to be taken into account:

* Maintaining data and metadata records
* Maintaining the release date of data

Data brokers cannot suppress data once it has been publicly released. This is because data at this point has been exchanged with INSDC partners who need to be notified of any suppressions. Suppression/cancellation requests also need to be assessed by the ENA and should have valid reasons. For any data suppression/cancellation requests, please contact the `ENA helpdesk <https://www.ebi.ac.uk/ena/browser/support>`_. 
