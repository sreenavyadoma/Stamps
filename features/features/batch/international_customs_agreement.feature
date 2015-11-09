
Feature: As a batch shipper, I want to be able to permanently agree to international customs privacy policy and restrictions [B-01830]

  Background:
    Given I am signed in as a batch shipper gc/autosuggest/password1


  @usps_terms
  Scenario: User Accepts Permanent USPS Terms Agreement

    #Print an Int'l order with Auto-Confirm turned off

    When Open Settings Modal
    Then Uncheck USPS Terms in Settings Modal
    Then Save Settings changes

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Form Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10

    Then Close customs form

    Then Set Order Form Service to "First-Class Mail International Large Envelope/Flat"

    And Open Print Modal

    Then Expect USPS Terms modal appears
    Then Click Cancel on USPS Terms modal
    Then Open Print Modal
    And Click I Agree on USPS Terms modal
    Then Print

    #Print an Int'l order and turn Auto-Confirm on

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Form Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10

    Then Close customs form

    Then Set Order Form Service to "First-Class Mail International Large Envelope/Flat"

    And Open Print Modal

    Then Expect USPS Terms modal appears
    Then Check Do Not Show Again checkbox in USPS Terms modal
    And Click I Agree on USPS Terms modal
    Then Print

    When Open Settings Modal
    Then Expect USPS Terms Checked in Settings Modal
    Then Save Settings changes

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Form Ounces to 2


    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10

    Then Close customs form

    Then Set Order Form Service to "First-Class Mail International Large Envelope/Flat"

    And Print

    #Turn off auto Confirm and manually check USPS Restrictions box in Customs Modal

    When Open Settings Modal
    Then Expect USPS Terms Checked in Settings Modal
    Then Uncheck USPS Terms in Settings Modal
    Then Save Settings changes

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Form Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Set customs form I agree to true
    Then Close customs form
    Then Set Order Form Service to "First-Class Mail International Large Envelope/Flat"

    And Print

    #Turn on auto Confirm from Settings modal and print Int'l postage

    When Open Settings Modal
    Then Expect USPS Terms Unchecked in Settings Modal
    Then Check USPS Terms in Settings Modal
    Then Save Settings changes

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Australia | random  | random  |

    Then Set Order Form Ounces to 2

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Set customs form I agree to true
    Then Close customs form

    Then Set Order Form Service to "First-Class Mail International Large Envelope/Flat"

    And Print
    And Sign out



