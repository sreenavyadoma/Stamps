Feature: Add Missing Field Validation

  Background:
    Given I am signed in as a batch shipper

  @validate_international @ray_test
  Scenario: Order Details Form  International Shipping fields and Customs Information fields validation
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail International Package"

    Then Expect Order Details Form International Address fields are visible
    Then Expect Order Details Form Domestic Ship-To fields are hidden
    Then Expect Order Details Form Customs Restrictions button is visible
    Then Expect Order Details Form Customs Edit Form button is visible

    Then Add Order Details Form Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Expect Customs Form License# to be visible
    Then Expect Customs Form Certificate# to be visible
    Then Expect Customs Form Invoice# to be visible

    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Set customs form License# to "random"
    Then Set customs form Certificate Number to "random"
    Then Set customs form Invoice Number to "random"

    Then Set customs form Non-Delivery Options to "Treat as abandoned"
    Then Set customs form Non-Delivery Options to "Return to sender"

    Then Set customs form Internal Transaction Number to "Required"
    Then Expect Customs Form ITN# to be enabled

    Then Set customs form Internal Transaction Number to "Not required"
    Then Expect Customs Form ITN# to be disabled

    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form ITN# to "random"

    Then Set customs form I agree to true
    Then Close customs form
    Then Set Order Details Form Service to "First-Class Mail International Large Envelope/Flat"
    And Sign out

  @international_internal_transaction_2500 @international
  Scenario: Customs Form - Internal Transaction # Required for total over $2500

    # Internal Transaction # Required for total over $2500
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail International Package"

    Then Add Order Details Form Item - Quantity 1, ID random, Description random
    Then Set Order Details Form Service to "First-Class Mail International Large Envelope/Flat"
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 1, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Not required"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 2501, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out
