Feature:  Mail BVT

  Background:
    Given Start test driver

  @multiple_contact_email_not_required
  Scenario: WEBAPPS-11803 Email Required Not Validating Correctly
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select from print form mail-to text area Person 1, Company 1
    Then click mail-to add button
    Then select from mail-to add address text area Person 2, Company 2
    Then click mail-to add button
    Then select from mail-to add address text area Person 3, Company 3
    Then click mail-to add button
    Then select from mail-to add address text area Person 4, Company 4
    Then select print form service PM Package
    Then show advanced options
    Then select advanced options extra services
    Then check extra services hold for pickup
    Then save extra services

