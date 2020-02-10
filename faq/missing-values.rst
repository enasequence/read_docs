=======================
Missing value reporting
=======================

The International Nucleotide Database Collaboration (INSDC) have a standardised missing/null value reporting
language to be used where a value of an expected format for sample metadata reporting **can not** be provided.

The controlled vocabulary takes into account different type of constraints. Submitters are **strongly** encouraged
to always provide true values. However, if missing/null value reporting is required, and only when it is required,
submitters are asked to use a term with the finest granularity for their situation. See the table below for
accepted missing value reporting terms.

INSDC missing value reporting terms
===================================

+----------------------------+------------------------------+-----------------------------------------------+
| **INSDC term (top level)** | **INSDC term (lower level)** | **Definition**                                |
+----------------------------+------------------------------+-----------------------------------------------+
| not applicable             |                              | | information is inappropriate to report, can |
|                            |                              | | indicate that the standard itself fails to  |
|                            |                              | | model or represent the information          |
|                            |                              | | appropriately                               |
+----------------------------+------------------------------+-----------------------------------------------+
| missing                    | not collected                | | information of an expected format was not   |
|                            |                              | | given because it has not been collected     |
|                            +------------------------------+-----------------------------------------------+
|                            | not provided                 | | information of an expected format was not   |
|                            |                              | | given, a value may be given at the later    |
|                            |                              | | stage                                       |
|                            +------------------------------+-----------------------------------------------+
|                            | restricted access            | | information exists but can not be released  |
|                            |                              | | openly because of privacy concerns          |
+----------------------------+------------------------------+-----------------------------------------------+

Usage of INSDC missing value reporting terms
============================================

Please use the above standardised missing value vocabulary **only if a true value of an expected format for a**
**mandatory field is missing**. If a true value is missing for a **recommended** or an **optional** field, then these fields
should not be used for reporting at all (leave these blank). For any use cases we discourage the usage of the top level term 'missing'
and encourage to use a lower level term with a higher granularity to declare the reason for the absence of a true
value.

Example of usage:

Checklist: `GSC MIxS host associated <https://www.ebi.ac.uk/ena/browser/view/ERC000013>`_

host sex: not provided

geographic location (country and/or sea): restricted access
