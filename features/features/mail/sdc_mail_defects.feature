Feature:  Mail defects from Sprint

  Background:
    Given Start test driver

    # setup: sign-in account must have 4 contacts listed below, all contacts must have valid email addresses
  @multiple_contacts_email_not_required
  Scenario: WEBAPPS-11803 Email Required Not Validating Correctly
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form weight to lbs 0 oz 1
    Then show advanced options
    Then expect print form service cost is $0.00
    Then expect print form insure-for cost is $0.00
    Then expect print form tracking cost is $0.00
    Then expect print form extra services cost is $0.00
    Then select from print form mail-to text area Person 1, Company 1
    Then click mail-to add button

    Then set email on add address modal to rcruz@stamps.com
    Then set address on add address modal to random name, random company, 1350 Market Street #2905, San Francisco, CA
    Then expect invalid contact selected modal is present
    Then expect error message on invalid contact selected modal is Contacts with an address that requires a customs form cannot be batch printed.
    Then click close button on invalid contact selected modal
    Then click cancel on add address modal

    #Then select from mail-to add address text area Person 2, Company 2
#    Then click mail-to add button
#    Then select from mail-to add address text area Person 3, Company 3
#    Then click mail-to add button
#    Then select from mail-to add address text area Person 4, Company 4
    Then select print form service PM Package
    Then set print form insure for to $10
    Then set print form tracking Signature Required
    Then show advanced options
    Then select advanced options extra services
    Then check extra services hold for pickup
    Then save extra services
    Then expect print form service cost is greater than $0.00
    Then expect print form insure-for cost is greater than $0.00
    Then expect print form tracking cost is greater than $0.00
    Then expect print form extra services cost is $0.00
    Then click print label expecting no errors

  @multiple_contacts_email_validation
  Scenario: WEBAPPS-11801 Email Validation is not Enforced For Add Address
    # setup: sign-in account must have 4 contacts listed below, all contacts must have valid email addresses
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select from print form mail-to text area Person 1, Company 1
    Then click mail-to add button
    Then set mail-to add address text area to random name, random company, 1350 Market Street #2905, San Francisco, CA

    Then set email to rcruz@stamps.com in add address modal

    # expect an error, maybe modal won't close?

    Then select print form service PM Package
    Then show advanced options
    Then select advanced options extra services
    Then check extra services hold for pickup
    Then save extra services
    Then click print label
    Then expect incomplete fields modal is not present

  @extra_services_not_updating_cost
  Scenario: WEBAPPS-10539 Web Client Mail | Extra Services Not Updating Price Weight Zero
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking stamps@mailinator.com
    Then select print form service PM Package
    Then set print form weight to lbs 1 oz 1
    Then show advanced options
    Then select advanced options extra services
    Then expect extra services fragile cost to be $0.00
    Then check extra services fragile
    Then expect extra services fragile cost is greater than $0
    Then save extra services
    Then expect print form advanced options extra services button is present

    Then expect print form service cost is $0.00
    Then expect print form service cost is greater than $0.00

    Then expect print form insure-for cost is $0.00
    Then expect print form insure-for cost is greater than $0.00

    Then expect print form tracking cost is $0.00
    Then expect print form tracking cost is greater than $0.00

    Then expect print form extra services cost is $0.00
    Then expect print form extra services cost is greater than $0.00

    #Then expect print form total amount is $6.55