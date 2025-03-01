# t_kyn_bish_the_test
Public Test

A module will be created to test various functions.

* Objectives
  * In recent years, businesses have been required to undergo transformation.
  * One aspect of this is the increasing number of companies pushing for DX (Digital Transformation) strategies.
  * Alongside personal skill development in areas of expertise, there is a need to relearn new knowledge.
  * Speed up the trial-and-error process of system development.

* Preconditions
  * Personal information is prohibited from being uploaded.
  * Data will be either open data or generated using Faker.
  * The goal is to rapidly create systems as ideas come up.
  * If not using Github Actions:

* Content Being Developed
  * 1) Django Application Development
    * Operation Flow
      * Develop Django applications using Visual Studio Code.
      * Commit and upload to a Github repository.
      * Perform functionality checks on Google Colaboratory.
      * The flow for rapid development will be: Visual Studio Code → Github → Google Colaboratory.
      * Specific file used on Google Colaboratory:
        * django_hogehogehogeeeeeeeeee.ipynb
    * Applications
      * Utilizing open data (under consideration).

  * 2) Web Hosting Development
    * Functionality checks for HTML, CSS, and JavaScript.
    * Use as an album server (**Currently working on acclaim**)
        * content/t_kyn_test_app/django_preinstall.sh
          * pip install django
        * python content/t_kyn_test_app/manage_t_kyn.py runserver
          * execute the python applications.

  * 3) Testing New Features in Github Actions
    * Trial development of features that may incur costs in private repositories.

* Notes
  * There are many possibilities:
    * Running LocalStack with Github Actions.
      https://qiita.com/damepo9696/items/fcf2af605b45bdf07b1a
    * Running LocalStack with Github Actions + Terraform.
      https://medium.com/@robbiedouglas/using-localstack-and-github-actions-to-test-terraform-aws-deployments-0a119dcff7c2
