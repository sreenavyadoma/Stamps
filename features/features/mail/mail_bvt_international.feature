Feature: International Shipping BVT

  Background:
    Given a user is signed in to Web Apps

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

    Then set Customs form Package Contents to Commercial Sample
    Then set Customs form License Number to a random string
    Then set Customs form Certificate Number to some random string
    Then set Customs form Invoice Number to a random string

    Then set Customs form Internal Transaction Number to Required
    Then set Customs form ITN Number to a random string

    Then add Customs form Associated Item 1, Description Item 1, Qty 1, Price 1, Made In Japan, Tariff 1
    Then expect Customs form Associated Item 1 Description is correct
    Then expect Customs form Associated Item 1 Quantity is correct
    Then expect Customs form Associated Item 1 Unit Price is correct
    Then expect Customs form Associated Item 1 Made In is correct
    Then expect Customs form Associated Item 1 Tariff is correct

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then Mail: Print International Postage
    Then Sign out


