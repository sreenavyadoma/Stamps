Feature: International Shipping BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_international
  Scenario: International Shipping
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Label form Ship-To to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Label form Mail-To to address to Address Cleansing, BVT, 1350 Market Street, San Francisco, CA

    Then set Label form Mail-To to address to random, random, 1350 Market Street, San Francisco, CA

    Then set Label form Mail-To to address to Address Cleansing, BVT, 1350 Market Street, San Francisco, CA

    Then set Label form Mail-To Country to Brazil
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Label form Mail-To Country to Canada
    Then set Label form Mail-To Country to Japan
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To Country to Italy
    Then set Label form Ship-To to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone   |
      | random | random  | random           | random            | random | random   | random      | Brazil | random  |
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Label form Ship-To to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone   |
      | random | random  | random           | random            | random | random   | random      | Brazil | random  |
    Then select Print form service FCMI Package
    Then set Print form Ounces to 3
    Then click Label form Edit Customs Form button
    Then Mail set Customs form Non-Delivery Options to "Treat as abandoned"
    Then Mail set Customs form Internal Transaction Number Requirement to "Required"
    Then Mail set Customs form ITN Number to 12345
    Then Mail set Customs form More Info to "WP BVT Intl Shipping"
    Then Mail on Customs form, Delete All Items
    Then Mail add Customs form Associated Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Made In is Russia, Tariff 25
    Then Mail on Customs form, check I agree to the USPS Privacy Act Statement
    Then Mail on Customs form, Save
    Then Mail: Print International Postage
    Then Sign out


