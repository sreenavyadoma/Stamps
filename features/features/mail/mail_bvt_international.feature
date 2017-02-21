Feature: International Shipping BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_international
  Scenario: International Shipping

    Then select Print On Shipping Label - 5 x 8 on Print form
    Then set Print form Mail From to default
    Then on Print form, set Ship-To to
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone   |
      | random | random  | random           | random            | random | random   | random      | Brazil | random  |
    Then on Print form, select service First-Class Mail International Package
    Then set Print form Pounds to 0
    Then on Print form, set Ounces to 3
    Then on Shipping Label Print form, Edit Customs Form
    #Then Mail on Customs form, set Package Contents to Gift
    Then Mail on Customs form, set Non-Delivery Options to "Treat as abandoned"
    Then Mail on Customs form, set Internal Transaction Number Requirement to "Required"
    Then Mail on Customs form, set ITN Number to "12345"
    Then Mail on Customs form, set More Info to "WP BVT Intl Shipping"
    Then Mail on Customs form, Delete All Items
    Then Mail on Customs form, add Associated Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Made In Russia, Tariff 25
    Then Mail on Customs form, check I agree to the USPS Privacy Act Statement
    Then Mail on Customs form, Save
    Then Mail: Print International Postage
    Then Sign out


