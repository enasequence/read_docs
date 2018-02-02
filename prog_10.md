# Module 10: Webin reports service

Webin reports service is a collection of RESTful JSON endpoints used to retrieve information
about metadata objects and data files submitted through the Webin submission services.

The service can be used to retrieve information about:

* Submitted metadata objects
* Metadata object statuses
* Submitted data files
* Data file archival statuses
* Run processing statuses
* Analysis processing statuses
* Assigned accessions

The reports can also be conveniently explored using the [Webin programmatic submission portal](prog_11.md)

## Service URL

Production service URL:

<https://www.ebi.ac.uk/ena/submit/report>

Test service URL:

<ttps://wwwdev.ebi.ac.uk/ena/submit/report>

## Authentication

Authentication is done using basic HTTP authentication with Webin submission account credentials.

## Service endpoints

The service endpoints are documented using Swagger:

<https://www.ebi.ac.uk/ena/submit/report/swagger-ui.html>
