@bvt
Feature:  BVT International Shipping

  Background:
    Given I am signed in to Orders

  @bvt_international_shipping
  Scenario: International Shipping

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    And Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Not required"
    Then Customs Form: Set More Info to "BVT International Shipping"
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Sign out
