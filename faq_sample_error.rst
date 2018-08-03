===============================
Common Sample Submission Errors
===============================

Samples are objects in the ENA database which describe biological material used in sequencing experiments.
Common errors experienced when attempting to submit samples are discussed here.


Error: Object Being Added Already Exists In Submission Account
==============================================================

| This error indicates that a sample alias in your submission has previously been used.
  The sample alias must uniquely identify the sample among all samples submitted in your Webin account.
  Locate the alias in line 3 of this Sample XML: `ERS2513358 <https://www.ebi.ac.uk/ena/data/view/ERS2513358&display=xml>`_.
| During interactive submissions, the alias is referred to as the 'Unique Name': if nothing is entered here, samples are automatically given numerical values starting at 1.
  This means that if the field is ignored on two separate submissions, the second submission will result in this error.

.. image:: images/faq_sample_error_p01.png

| Enter an informative name here, as you may need to use the alias in the future and it cannot be changed after submission.

| Note that if you register a sample and then have it deleted, the alias still cannot be reused.
