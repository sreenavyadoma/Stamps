Feature:  Mail Print Form Field Validation

  Background:
    Given Start test driver

  @add_address_email_validation
  Scenario: WEBAPPS-11803 Email Required Not Validating Correctly
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to address to Invalid Email, On Add Address Modal, 1350 Market Street #2905, San Francisco CA 94102
    Then click add address button on print form
    Then set address on add address modal to Bad Email, Invalid Email Address, 1350 Market Street #2905, San Francisco CA 94102
    Then set email on add address modal argh!
    Then click add button on add address modal
    Then expect add address modal is present
    Then expect add address email error message is Please enter a valid email address
    Then click cancel button on add address modal
    Then sign out


  @print_form_incomplete_fields
  Scenario: WEBAPPS-11801 Email Validation is not Enforced For Add Address
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click print label
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Ship To address is required
    Then expect error message on incomplete fields modal includes Service is required
    Then expect error message on incomplete fields modal includes Weight cannot be 0
    Then click close button on incomplete fields
    Then set print form mail-to to address to Email Validation, Not Enforced, 1350 Market Street #2905, San Francisco CA 94102
    Then blur out on print form
    Then pause for 1 second
    Then select print form service PM Package
    Then blur out on print form
    Then show advanced options
    Then pause for 1 second
    Then click select extra services button on print form
    Then pause for 1 second
    Then check hold for pickup on extra services modal
    Then pause for 1 seconds
    Then save extra services
    Then blur out on print form
    Then click print label
    Then pause for 1 second
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Weight cannot be 0
    Then click close button on incomplete fields
    Then increment print form ounces by 1
    Then blur out on print form
    Then pause for 1 second
    Then set print form tracking Signature Required
    Then blur out on print form
    Then pause for 1 second
    Then blur out on print form
    Then click print label
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Email is required.
    Then click close button on incomplete fields
    Then sign out