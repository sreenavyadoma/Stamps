@bugs_single_order_details_form
Feature: Single Order Details form Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_single_order_details_form
  Scenario: ORDERSAUTO-3351 New Sprint 11/24/17 WEBAPPS-6838 User get on Print modal without Ship to Address

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then set Order Details form service to PMI Flat Rate Envelope
    Then set Order Details form Pounds to 0
    Then set Order Details form Ounces to 3
    Then click Order Details form Customs Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 100.50, Made In Zimbabwe, Tariff 100
    Then expect Customs form Total Value is 100.50
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then set Order Details form Ship-To Country to United States
    Then set Order Details form service to PM Package
    Then Print expecting error This order is not ready for printing:\nShip To address is required




