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
    Then Mail Shipping Labels: Select service First-Class Mail International Package
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 3
    Then Mail Shipping Labels: Edit Customs Form
    #Then Mail on Customs form, set Package Contents to Gift
    Then Mail on Customs form, set Non-Delivery Options to "Treat as abandoned"
    Then Mail on Customs form, set Internal Transaction Number Requirement to "Required"
    Then Mail on Customs form, set ITN Number to "12345"
    Then Mail on Customs form, set More Info to "WP BVT Intl Shipping"
    Then Mail on Customs form, Delete All Items
    Then Mail on Customs form, add Associated Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Origin Russia, Tariff 25
    Then Mail on Customs form, check I agree to the USPS Privacy Act Statement
    Then Mail on Customs form, Save
    Then Mail: Print International Postage
    Then Sign out


