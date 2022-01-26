# MISO_LIMS_Cloud

The MISO_LIMS_Cloud is designed to be easily deployed for MISO on Compute Canada Cloud like Cedar (https://cedar.cloud.computecanada.ca/). By using the template, you can deploy MISO on a single OpenStack instance using Terraform.

### Install Terraform:

```
$ wget -P /tmp/ https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip
--
$ unzip /tmp/terraform_0.12.6_linux_amd64.zip
$ sudo mv terraform /usr/local/bin/
$ terraform --version
```

Log in to the OpenStack dashboard, choose the project for which you want to download the OpenStack RC file, and run the following commands:
```
$ source your-project-openrc.sh
Please enter your OpenStack Password for project PROJECT as user username:
```
