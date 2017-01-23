Feature: International Shipping BVT

  Background:
    Given I am signed in as Mail shipper

  @mail_bvt_international
  Scenario: International Shipping

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To to
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone   |
      | random | random  | random           | random            | random | random   | random      | Brazil | random  |
    Then Mail Shipping Labels: Select Service First-Class Mail International Package
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 3
    Then Mail Shipping Labels: Edit Customs Form
    #Then Mail Customs Form: Set Package Contents to Gift
    Then Mail Customs Form: Set Non-Delivery Options to "Treat as abandoned"
    Then Mail Customs Form: Set Internal Transaction Number Requirement to "Required"
    Then Mail Customs Form: Set ITN Number to "12345"
    Then Mail Customs Form: Set More Info to "WP BVT Intl Shipping"
    Then Mail Customs Form: Delete All Items
    Then Mail Customs Form: Add Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Origin Russia, Tariff 25
    Then Mail Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Mail Customs Form: Save
    Then Mail: Print International Postage
    Then Sign out


