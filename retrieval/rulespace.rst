=========
Rulespace
=========

Introduction
============

The Rulespace component supports the persistence of user-controlled sets of rules and user provided
metadata relating to these rules that can be used to define, through discovery
services beyond Rulespace, such as the ENA Discovery API. Rules include metadata filters,
expressed in an appropriate query language and inclusion/exclusion lists of accessions.
Inclusion/exclusion lists accommodate accessions within our hosted namespaces (e.g.
ENA). Metadata relating to rules include annotations that allow a user to assert, for example,
additional facts relating to the basis of a rule (and/or rule set) and any provenance and
confidence information. For an item declared in an inclusion/exclusion list, facts might be
links to external resources or identifiers from alternative namespaces.

Services offered by RS will include a write interface - an API in which users can maintain
their rules. A GUI is available in the ENA Browser that allows users to edit rules with
some assistance and choose from pre-selected rules. This GUI integrates with the ENA discovery
interface web GUI, by allowing users to capture the search expression that they have created.
Read access will be supported via an API around which consumer services (such as Tag&flag or the ENA Browser)
will draw content from RS.

Authentication
==============

Login Types
-----------
The Rulespace system can be accessed and managed using

1. **AAP Account**
    The Authentication, Authorisation and Profile service (AAP) provides a central identity and role management function
    for different services at EMBL-EBI and can be used by other services and organisations as required. The service
    allows the management of permissions and attributes through domains (or groups) to be coordinated in a single point
    across a range of services.

2. **Elixir Account**
    The ELIXIR Authentication and Authorisation Infrastructure (AAI) enables researchers to use their home organisation
    credentials or community or commercial identities (e.g. ORCID, LinkedIn) to sign in and access data and services
    they need.

How Do I Register with AAP ?
----------------------------
Create an AAP account by registering at |AAP| and fill out the user form.

.. |AAP| raw:: html

    <a href="https://aai.ebi.ac.uk/registerUser" target="_blank">AAP</a>

.. image:: images/aap-form.png

How Do I Create an Elixir Account ?
-----------------------------------
Create an ELIXIR ID that you can use to access services across ELIXIR. You can register with an account you already use, like your institution account, ORCID or Google account.

Steps to register with Elixir

1.  Visit |ELIXIR| register page.

.. |ELIXIR| raw:: html

    <a href="https://elixir-europe.org/register" target="_blank">ELIXIR</a>

2.  Select your preferred identity providers.

.. image:: images/elixir-form.png

3.  Sign-in to your selected identity provider e.g. using your Google account

4.  Enter your username.

.. image:: images/google-user.png

4.  Enter your password and grant permissions.

.. image:: images/google-password.png

5.  You are now registered with Elixir.
