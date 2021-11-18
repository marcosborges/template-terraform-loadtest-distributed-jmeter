# Template For Terraform Loadtest Distributed With JMeter

The repository goal is to provide an uncomplicated way to start a distributed load testing project using Jmeter as the executor and Terraform as the IaS provisioning.

---

## Anatomy

The project is divided into 3 parts: iac, plan and .github.

Inside the iac folder you will find the terraform scripts for the provision of the infrastructure needed to run the distributed load test.

Under the plans folder are the load plans created for jmeter.

In the .github folder you find the workflows for continuous deployment based on the main branch changes. It also finds workflows for manual and individual execution of planning, applying and destroying the provisioned infrastructure.

---

## How to use?

1. After creating a fork of this repository, go to settings and define it as a template.

2. Create a new repository using the forked template

3. Create the following secrets with their respective values ​​in your project settings:

    - AWS_ACCESS_KEY_ID

    - AWS_SECRET_ACCESS_KEY

    - TF_STATE_BUCKET_NAME

4. Create the following environments in the repository settings:

    - plan

    - apply

    - destroy

    *Enable the approval feature (protection rules) for both apply and destroy environments.*    

5. You can run the `01-manual-s3-bucket-tfstate` manual workflow to create the bucket that will store the terraform state file.

6. Put your jmx load scripts in the plans folder.

7. Set the name of script file plan script and subnet in the provisioning module at `iac/main.tf`;

8. Run manual workflow `02-manual-terraform-plan` to visualize the plan result.

9. Run manual workflow `03-manual-terraform-apply` to apply provision.

10. Run manual workflow `04-manual-terraform-destroy` to destroy provision.

---

## More information

- [Terraform loadtest module](https://registry.terraform.io/modules/marcosborges/loadtest-distribuited/aws/latest)

