===============================
Sample Checklist Infrastructure
===============================


DRAFT!

------------
Introduction
------------


In late 2024/early 2025 ENA implementing modernisation of the underlying ENA checklist systems architecture.

---------------------------------------------------
Why we moved to using Versioning Sample Checklists?
---------------------------------------------------
It will allow ENA to more rapidly update checklists (e.g. when new GSC MIxS releases) and also use ontologies for terms.

What it has meant is that checklists will all have versions and you will need to pull down the latest one after submission.
Changes that need a new version could be as simple as the required pattern changing.

------
High Level Infrastructural Changes
It makes the system more maintenance friendly.

--------------------------------------------------------
Technical Endpoints to Computationally Access Checklists
--------------------------------------------------------

Endpoints, you can use here, (TO BE UPDATED TO PROD instances)
Paginate over all versioned schemas.
Schema and metadata (JSON Schema is embedded here)
Just a summary of schema
Paginate over latest schemas (same as above 'a', with latest=true query param)
Get JSON Schema of the latest version of a given checklist  (eg. ERC000022)
