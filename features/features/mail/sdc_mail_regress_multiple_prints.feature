Feature:  Mail Multiple Prints

  Background:
    Given Start test driver
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

    Then sign out