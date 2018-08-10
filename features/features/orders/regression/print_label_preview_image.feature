#AB_ORDERSAUTO_3518
@print_label_preview_image
Feature: Print label preview should have image for FCM Large Envelope/Flat

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: Validate image for each label type
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 8
    Then set order details ounces to 1
    Then set order details service to FCM Large Envelope/Flat
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then expect Print Modal Preview label is displayed
    Then set print modal print-on to Shipping Label - SDC-1200
    When Select Print Modal right-side label
    Then expect Print Modal Preview label is displayed
    Then set print modal print-on to Shipping Label - 5 x 8
    When Select Print Modal left-side label
    Then expect Print Modal Preview label is displayed
    Then close print modal
    Then sign out