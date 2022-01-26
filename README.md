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

### Install the OpenStack command-line Clients
```
$ sudo apt-get install python3-dev
$ sudo apt-get install python3-pip
$ sudo apt-get install python-virtualenv
$ virtualenv ~/venv
$ source ~/venv/bin/activate
$ pip3 install --upgrade setuptools
$ pip3 install python-openstackclient
```

### Download your openrc file

Log in to the OpenStack dashboard, choose the project for which you want to download the OpenStack RC file, and run the following commands:
```
$ source your-project-openrc.sh
Please enter your OpenStack Password for project PROJECT as user username:
```
### Openstack basic commands

This lists the images available to you.
```
$ openstack image list
```
This lists the volumes you have created.
```
$ openstack volume list
```
This lists the flavors available to you.
```
$ openstack flavor list
```

<b>Note</b>: please check those resources and replace the content in the variables.tf file.

### Usage

```
$ git clone https://github.com/cidgoh/MISO_LIMS_Cloud.git
$ cd MISO_LIMS_Cloud
$ terraform init
$ terraform plan
$ terraform apply
```

### Acknowledgement

- [Handsontable](https://handsontable.com/) was used to build the grid.  DataHarmonizer is configured to reference the "non-commercial-and-evaluation" handsontable license "for purposes not intended toward monetary compensation such as, but not limited to, teaching, academic research, evaluation, testing and experimentation"; if this application is used for commercial purposes, this should be revised as per https://handsontable.com/docs/license-key/
- [SheetJS](https://sheetjs.com/) was used to open and save local files. The community edition was used under the [Apache 2.0](https://github.com/SheetJS/sheetjs/blob/master/LICENSE) license.

## Support

If you have any problems running the scripts, [please open an issue for discussion][1].

[1]: https://github.com/cidgoh/MISO_LIMS_Cloud/issues
or email to duanjun1981@gmail.com
