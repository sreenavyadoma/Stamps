
Feature: Single Order Details form Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_single_order_details_form
  Scenario: ORDERSAUTO-3351 New Sprint 11/24/17 WEBAPPS-6838 User get on Print modal without Ship to Address

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then set order details service to PMI Flat Rate Envelope
    Then set order details pounds to 0
    Then set order details ounces to 3
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 100.50, Made In Zimbabwe, Tariff 100
    Then expect Customs Total Value is 100.50
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then set order details domestic ship-to country to United States
    Then set order details service to PM Package
    Then Print Order expecting error This order is not ready for printing:\nShip To address is required




