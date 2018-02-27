# Module 11: Webin XML and reports portal

Webin XML and reports portal is a simple interactive web interface which supports:

* Submission of XML metadata objects
* Update of XML metadata objects
* Reports from the [Webin reports service](prog_10.html)

## Service URL

Production service URL:

<https://www.ebi.ac.uk/ena/submit/webin/>

Test service URL:

<https://wwwdev.ebi.ac.uk/ena/submit/webin/>

## Authentication

Please use your Webin submission account credentials to login into the service.

![Webin XML and reports portal](images/webin_portal_login.png) 

## Submit XMLs

Once you have logged in you can use the default page to submit XMLs to Webin.

In the example below, one or more studies are being submitted using a project XML (`project.xml`) and a 
submission XML (`sub.xml`). The project XML contains the study details while the submission XML 
defines the submission actions. 
 
![Webin XML and reports portal](images/webin_portal_study.png) 

To submit, simply browse to the `project.xml` and `sub.xml` files and click submit. 

You can see the receipt in the browser window either in a tabular format:

![Webin XML and reports portal](images/webin_portal_study2.png)

or you can look at the receipt XML:

![Webin XML and reports portal](images/webin_portal_study3.png)
