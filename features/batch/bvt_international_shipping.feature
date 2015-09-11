@bvt
Feature:  BVT International Shipping

  Background:
    Given I am signed in as a batch shipper

  @bvt_international_shipping
  Scenario: International Shipping

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    And Open Customs Form
    Then Set Customs Form Package Contents = Merchandise
    Then Set Customs Form Non-Delivery Options = Return to sender
    Then Set Customs Form Internal Transaction # = Not required
    Then Set Customs Form More Info = BVT International Shipping
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope
    Then Sign out
