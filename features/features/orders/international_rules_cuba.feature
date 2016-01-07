Feature: Cuba Internal Transaction Number Required

  Background:
    Given I am signed in to Orders

  @international_rules_engine @international_rules_engine_cuba
  Scenario: Cuba Internal Transaction Number Required
    Then I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to Cuba
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"
    Then Open customs form
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    Then Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Sign out