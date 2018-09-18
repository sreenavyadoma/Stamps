Feature:  Mail defects from Sprint

  Background:
    Given Start test driver

  @shipping_labels_envelopes_extra_services
  Scenario: WEBAPPS-11798 Switching Envelope to Shipping Label does not Update Extra Services
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to address to Switching Envelope, Does not Update Extra Services, 1350 Market Street #2905, San Francisco CA 94102
    Then set print form email tracking
    Then click add address button on print form
    Then set address on add address modal to Add Address, Add Address Company, 1350 Market Street 2904, San Francisco CA 94102
    Then set email on add address modal
    Then click add button on add address modal
    Then expect selected contacts count is 2
    Then expect multiple contacts view include Switching Envelope, Add Address
    Then select print form service PM Package
    Then set print form ounces to 1

    Then click select extra services button on print form

    Then expect fragile on extra services modal is present
    Then check fragile on extra services modal
    Then expect fragile on extra services modal is checked
    Then expect fragile cost on extra services modal is greater than $0.00
    Then uncheck fragile on extra services modal
    Then expect fragile on extra services modal is unchecked

    Then expect return receipt for merchandise on extra services modal is present
    Then check return receipt for merchandise on extra services modal
    Then expect return receipt for merchandise on extra services modal is checked
    Then expect return receipt for merchandise cost on extra services modal is greater than $0.00
    Then expect form 3811 link is present
    Then uncheck return receipt for merchandise on extra services modal
    Then expect return receipt for merchandise on extra services modal is unchecked
    Then expect form 3811 link is not present

    Then expect non-rectangular on extra services modal is present
    Then check non-rectangular on extra services modal
    Then expect non-rectangular on extra services modal is checked
    Then uncheck non-rectangular on extra services modal
    Then expect non-rectangular on extra services modal is unchecked

    Then expect hold for pickup on extra services modal is present
    Then check hold for pickup on extra services modal
    Then expect hold for pickup on extra services modal is checked
    Then expect hold for pickup cost on extra services modal is $0.00
    Then uncheck hold for pickup on extra services modal
    Then expect hold for pickup on extra services modal is unchecked

    Then close extra services

    Then sign out

  @mail_print_button_labels
  Scenario: EBAPPS-11938 Label for printing stamps has incorrect text
    Then sign-in to mail
    Then select print on Stamps
    Then expect mail toolbar print button label is Print Stamps
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail toolbar print button label is Print Label
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then expect mail toolbar print button label is Print Envelope
    Then select print on Roll - 4" x 6" Shipping Label
    Then expect mail toolbar print button label is Print Label
    Then sign out

  @multiple_prints_wrong_cost
  Scenario: WEBAPPS-11799 Cost Shows Wrong Cost for Multiple Prints
            Precondition:
            Account used to sign-in must have 4 contacts listed below, all contacts must have valid email addresses
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect print form service cost is $0.00
    Then expect print form total amount is $0.00
    Then set print form mail-to to address to Wrong Cost, Multiple Prints, 1350 Market Street #2905, San Francisco CA 94102
    Then set print form email tracking
    Then select print form service PM Package
    Then set print form pounds to 57
    # Add 2nd contact
    Then click add address button on print form
    Then set address on add address modal to Add Address, Add Address Company, 1350 Market Street 2904, San Francisco CA 94102
    Then set email on add address modal rcruz@stamps.com
    Then click add button on add address modal
    Then expect selected contacts count is 2
    Then expect multiple contacts view include Wrong Cost, Add Address
    # Add 3rd contact
    Then click add address button on print form
    Then set address on add address modal to Third Contact, Some Company, 1350 Market Street 2906, San Francisco CA 94102
    Then set email on add address modal rcruz@stamps.com
    Then click add button on add address modal
    Then expect selected contacts count is 3
    Then expect multiple contacts view include Wrong Cost, Add Address, Third Contact
    Then expect print form service cost is greater than $50.00
    Then expect print form total amount is greater than $50.00

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


  @extra_services_cost_for_rrb_service
  Scenario: WEBAPPS-10539 Web Client Mail | Extra Services Not Updating Price Weight Zero
            Customer selects Fragile under Extra services and notices the price
            does not update on the Mail page but price is accurate if printed.
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking stamps@mailinator.com
    Then select print form service PM Regional Rate Box A
    Then set print form weight to lbs 0 oz 0
    Then show advanced options
    Then click select extra services button on print form
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



