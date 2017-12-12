Module 1: Submission Options
****************************


The majority of submissions to the ENA begin `here <https://www.ebi.ac.uk/ena/submit/sra/#home>`_.

.. image:: images/mod_01_p01.png


1. Log in and access “new submission” tab
2. If you have not already, create a study using this option. Complete this step BEFORE going on to step 3. Module 2_ describes this step in more detail.
3. If you have not already, create sample objects to represent your source material. Complete this step before going on to step 4. Module 3_ describes this step in more detail.
4. This step combines multiple steps from above but it is preferable to split the job up (so that you have already registered a study and some samples). During this step you will be registering NGS read files but before you can do this you must upload the NGS read files to your ENA ftp directory (you have one with your account). `Here <http://www.ebi.ac.uk/ena/about/sra_data_upload>`_ are your options for uploading the read files. After you have uploaded the NGS read files use this step to create run and experiment objects. Module 4_ describes this step in more detail. This step will link everything together under the project created in step 2 according to this metadata model:

Experiment and run objects associate read files to their source sample and a study so that all 4 object types are then connected. This means that sample objects do not belong to any studies until experiment objects are created.


.. image:: images/mod_01_p02.png
   :scale: 60
   :align: right

.. _2: mod_02.html
.. _3: mod_03.html
.. _4: mod_04.html
