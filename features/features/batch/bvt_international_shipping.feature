@bvt
Feature:  BVT International Shipping

  Background:
    Given I am signed in as a batch shipper

  @bvt_international_shipping
  Scenario: International Shipping

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Not required"
    Then Set customs form More Info to "BVT International Shipping"
    Then Set customs form I agree to true
    Then Close customs form
    Then Set Order Form Service to "First-Class Mail International Large Envelope/Flat"
    Then Sign out
