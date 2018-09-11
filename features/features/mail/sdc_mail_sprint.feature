Feature:  Mail defects from Sprint

  Background:
    Given Start test driver

  @multiple_contacts_email_not_required
  Scenario: WEBAPPS-11803 Email Required Not Validating Correctly
    # setup: sign-in account must have 4 contacts listed below, all contacts must have valid email addresses
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
    Then click print label
    Then expect incomplete fields modal is not present

  @multiple_contacts_email_validation
  Scenario: WEBAPPS-11801 Email Validation is not Enforced For Add Address
    # setup: sign-in account must have 4 contacts listed below, all contacts must have valid email addresses
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select from print form mail-to text area Person 1, Company 1
    Then click mail-to add button
    Then set mail-to add address text area to random name, random company, 1350 Market Street #2905, San Francisco, CA

    Then set mail-to add address email to rcruz@stamps.com

    # expect an error, maybe modal won't close?

    Then select print form service PM Package
    Then show advanced options
    Then select advanced options extra services
    Then check extra services hold for pickup
    Then save extra services
    Then click print label
    Then expect incomplete fields modal is not present
