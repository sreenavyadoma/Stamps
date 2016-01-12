
Feature: As a batch shipper, I want to be able to permanently agree to international customs privacy policy and restrictions [B-01830]

  Background:
    Given I am signed in to Orders as gc/autosuggest/password1


  @usps_terms
  Scenario: User Accepts Permanent USPS Terms Agreement

    #Print an Int'l order with Auto-Confirm turned off

    When Open Settings Modal
    Then Uncheck USPS Terms in Settings Modal
    Then Save Settings changes

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Details Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked

    Then Close Customs Form

    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And Click Print Button

    Then Expect USPS Terms modal appears
    Then Click Cancel on USPS Terms modal
    Then Click Print Button
    And Click I Agree on USPS Terms modal
    Then Click Print Modal - Print button

    #Print an Int'l order and turn Auto-Confirm on

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Details Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked

    Then Close Customs Form

    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And Click Print Button

    Then Expect USPS Terms modal appears
    Then Check Do Not Show Again checkbox in USPS Terms modal
    And Click I Agree on USPS Terms modal
    Then Click Print Modal - Print button

    When Open Settings Modal
    Then Expect USPS Terms Checked in Settings Modal
    Then Save Settings changes

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Details Ounces to 2


    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Close Customs Form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    And Print

    #Turn off auto Confirm and manually check USPS Restrictions box in Customs Modal

    When Open Settings Modal
    Then Expect USPS Terms Checked in Settings Modal
    Then Uncheck USPS Terms in Settings Modal
    Then Save Settings changes

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Details Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And Print

    #Turn on auto Confirm from Settings modal and print Int'l postage

    When Open Settings Modal
    Then Expect USPS Terms Unchecked in Settings Modal
    Then Check USPS Terms in Settings Modal
    Then Save Settings changes

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Details Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form

    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And Print
    And Sign out



