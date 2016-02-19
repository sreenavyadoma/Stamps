Feature: Internal Transaction # Not Required

  Background:
    Given I am signed in to Orders

  @international_rules_engine
  Scenario: Internal Transaction # Not Required
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    Then Order Details: Set Ounces to 5
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Order Details: Set Ounces to 5
    Then Open Customs Form
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs Form: Set ITN# to "random"
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Sign out
