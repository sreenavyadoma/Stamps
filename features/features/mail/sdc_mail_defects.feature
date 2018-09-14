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
    Then select address from print form mail-to Person 1, Company 1
#    Then click mail-to add button
    Then select address from add address modal Person 2, Company 2
#
#    Then expect invalid contact selected modal is present
#    Then expect error message on invalid contact selected modal is Contacts with an address that requires a customs form cannot be batch printed.
#    Then click close button on invalid contact selected modal
#    Then click cancel on add address modal

    #Then select address from add address modal Person 2, Company 2
#    Then click mail-to add button
#    Then select address from add address modal Person 3, Company 3
#    Then click mail-to add button
#    Then select address from add address modal Person 4, Company 4
    Then select print form service PM Package
    Then set print form insure for to $10
    Then set print form tracking Signature Required
    Then show advanced options
    Then select advanced options extra services
    Then check hold for pickup on extra services modal
    Then save extra services
    Then expect print form service cost is greater than $0.00
    Then expect print form insure-for cost is greater than $0.00
    Then expect print form tracking cost is greater than $0.00
    Then expect print form extra services cost is $0.00
    Then click print label expecting no errors

  @multiple_contacts_incomplete_fields
  Scenario: WEBAPPS-11801 Email Validation is not Enforced For Add Address
    # setup: sign-in account must have 4 contacts listed below, all contacts must have valid email addresses
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click print label
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Ship To address is required
    Then expect error message on incomplete fields modal includes Service is required
    Then expect error message on incomplete fields modal includes Weight cannot be 0
    Then click close button on incomplete fields
    Then set print form mail-to to address to Email Validation, Not Enforced, 1350 Market Street #2905, San Francisco, CA
    Then blur out on print form
    Then pause for 1 seconds
    Then select print form service PM Package
    Then blur out on print form
    Then show advanced options
    Then pause for 1 seconds
    Then select advanced options extra services
    Then pause for 1 seconds
    Then check hold for pickup on extra services modal
    Then pause for 1 seconds
    Then save extra services
    Then blur out on print form
    Then click print label
    Then pause for 1 seconds
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Weight cannot be 0
    Then click close button on incomplete fields
    Then increment print form ounces by 1
    Then blur out on print form
    Then pause for 1 seconds
    #Then increment print form pounds by 1
    Then set print form tracking Signature Required
    Then blur out on print form
    Then pause for 1 seconds
    Then blur out on print form
    Then click print label
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Email is required.
    Then click close button on incomplete fields
    Then sign out


  @extra_services_cost_for_rrb_service
  Scenario: WEBAPPS-10539 Web Client Mail | Extra Services Not Updating Price Weight Zero
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking stamps@mailinator.com
    Then select print form service PM Regional Rate Box A
    Then set print form weight to lbs 0 oz 0
    Then show advanced options
    Then select advanced options extra services
    # Cost should not be $0
    Then check fragile on extra services modal
    Then expect fragile cost on extra services modal is $0.00
    #Then expect fragile cost on extra services modal is greater than $0
    Then pause for 1 seconds
    Then save extra services
    Then expect print form advanced options extra services button is present
    Then expect print form extra services cost is $0.00
#    Then expect print form extra services cost is greater than $0.00
    Then sign out















#    Then expect print form service cost is $0.00
    #Then expect print form service cost is greater than $0.00

#    Then expect print form insure-for cost is $0.00
#    Then expect print form insure-for cost is greater than $0.00
#
#    Then expect print form tracking cost is $0.00
#    Then expect print form tracking cost is greater than $0.00
#
#    Then expect print form extra services cost is $0.00
#    Then expect print form extra services cost is greater than $0.00

    #Then expect print form total amount is $6.55


#    Then uncheck fragile on extra services modal
#    Then check fragile on extra services modal
#    Then check hold for pickup on extra services modal
#    Then uncheck hold for pickup on extra services modal
#    Then check restricted delivery on extra services modal
#    Then uncheck restricted delivery on extra services modal
#    Then check return receipt on extra services modal
#    Then uncheck return receipt on extra services modal
