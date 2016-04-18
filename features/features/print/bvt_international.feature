Feature: International Shipping BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_international
  Scenario: International Shipping

    Then Postage: Select Shipping Label 5 x 8
    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To to
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone   |
      | random | random  | random           | random            | random | random   | random      | Brazil | random  |

    Then Postage Shipping Labels: Select Service First-Class Mail International Package
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 3

    Then Postage Shipping Labels: Edit Customs Form
    Then Postage Customs: Set Package Contents to "Gift"
    Then Postage Customs: Set Non-Delivery Options to "Treat as abandoned"
    Then Postage Customs: Set Internal Transaction Number Requirement to "Required"
    Then Postage Customs: Set ITN Number to "12345"
    Then Postage Customs: Set More Info to "WP BVT Intl Shipping"
    Then Postage Customs: Delete All Items
    Then Postage Customs: Add Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Origin Russia, Tariff 25
    Then Postage Customs: Check I agree to the USPS Privacy Act Statement
    Then Postage Customs: Save
    Then Footer: Print International Postage
    Then Sign out


