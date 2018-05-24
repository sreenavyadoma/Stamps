# encoding: utf-8
Feature: Print 1 Intl CN22 label on 5.5x8.5 for EDD country - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_5x8
  Scenario: Print 1 Intl CN22 label for EDD country on 5.5 x 8.5 label
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI SFRB | 5.5x8.5  | random           | random           | random | random  | random      | Netherlands | random  | random  |
    Then set order details service to PMI Small Flat Rate Box
    Then set order details ounces to 1

    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button
    Then sign out
