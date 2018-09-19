Feature:  Mail Envelopes

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

    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then expect multiple contacts view include Switching Envelope, Add Address

    Then expect fragile on extra services modal is not present
    Then expect return receipt for merchandise on extra services modal is not present
    Then expect non-rectangular on extra services modal is not present
    Then expect hold for pickup on extra services modal is not present
    Then sign out