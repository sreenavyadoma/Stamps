Feature: Internal Transaction # Not Required

  Background:
    Given I am signed in to Orders

  @rules_international
  Scenario: Internal Transaction # Not Required
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    Then Details: Set Ounces to 5
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Set Ounces to 5
    Then Open Customs Form
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Set ITN# to "random"
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Sign out
