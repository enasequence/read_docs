# Metadata Model

Submissions made through Webin are represented using a number of different metadata objects. 
Before submitting data to ENA, it is important to familiarise yourself with the ENA metadata model 
and what parts of your research project can be represented by which metadata objects. This will determine 
what you need to submit.

For example, a publication is typically associated with a `study (project)`, sequenced
source material is represented using `samples`, and sequencing experiment details
are captured by the `experiment` object.

Note that data files are also submitted by
associating them with metadata objects. Sequence read data is associated with run
objects while other data files are associated with analysis objects. The full
metadata model with relationships between the different types of objects is illustrated below.

## Metadata Model

![Webin medata model](images/webin_data_model_full.png)

- **Submission**: A submission contains submission actions to be performed by the archive. A submission can add more objects to the
archive, update already submitted objects or make objects publicly available.
- **Study**: A study (project) groups together data submitted to the archive. A study accession is typically used
when citing data submitted to ENA. Note that all associated data and other objects are made public when the study is released.
- **Sample**: A sample contains information about the sequenced source material. Samples are typically associated with
checklists, which define the fields used to annotate the samples.
- **Experiment**: An experiment contain information about a sequencing experiment including library and
instrument details.
- **Run**: A run is part of an experiment and refers to data files containing sequence reads.
- **Analysis**: An analysis contains secondary analysis results derived from sequence reads (e.g. a genome assembly),
- **EGA DAC**: An European Genome-phenome Archive (EGA) data access committee (DAC) is required for authorized access submissions.
- **EGA Policy**: An European Genome-phenome Archive (EGA) data access policy is required for authorized access submissions.
- **EGA Dataset**: An European Genome-phenome Archive (EGA) data set is required for authorized access submissions.
