Feature: International Shipping BVT

  Background:
    Given I am signed in as Mail shipper

  @wp_bvt
  @wp_bvt_international
  Scenario: International Shipping

    Then Mail: Select Shipping Label 5 x 8
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To to
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone   |
      | random | random  | random           | random            | random | random   | random      | Brazil | random  |
    Then Mail Shipping Labels: Select Service First-Class Mail International Package
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 3
    Then Mail Shipping Labels: Edit Customs Form
    Then Mail Customs: Set Package Contents to "Gift"
    Then Mail Customs: Set Non-Delivery Options to "Treat as abandoned"
    Then Mail Customs: Set Internal Transaction Number Requirement to "Required"
    Then Mail Customs: Set ITN Number to "12345"
    Then Mail Customs: Set More Info to "WP BVT Intl Shipping"
    Then Mail Customs: Delete All Items
    Then Mail Customs: Add Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Origin Russia, Tariff 25
    Then Mail Customs: Check I agree to the USPS Privacy Act Statement
    Then Mail Customs: Save
    Then Mail: Print International Postage
    Then Sign out


