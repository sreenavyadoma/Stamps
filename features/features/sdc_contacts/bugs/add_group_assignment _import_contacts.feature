Feature: Mail Contacts Modal Bugs

  Background:
    Given Start test driver

  @bug_add_group_assignment_import_contacts
  Scenario: BUG WEBAPPS-12139 :  Duplicate contact created after printing
    Then sign-in to orders
    Then navigate to Contacts
    Then click import button of contacts toolbar
    Then expect import contacts modal is present
    #iframe - page objects have to be identified for below -
    Then expect assign contacts to group drop down on import contacts modal is present
    Then expect default value of assign contacts to group drop down on import contacts modal is None