Feature: Sudan Internal Transaction Number Required

  Background:
    Given I am signed in to Orders

      # Sudan Internal Transaction Number Required
  @international_rogue_countries @international_rules_engine
  Scenario: Sudan Internal Transaction Number Required
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"

    #Then Order Details - Set Service to "First-Class Mail International Large Envelope/Flat"
    And Open Customs Form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Customs Form - Add Item 1 - Description random, Qty 1, Price 3000, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set ITN# to "random"
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    And Sign out
