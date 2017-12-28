@print_label_preview_image
Feature: Print label preview should have image for FCM Large Envelope

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form Ounces to 1
    Then set Order Details form service to FCM Large Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then expect Print Modal Preview label is displayed
    Then set Print modal Print-On to Shipping Label - SDC-1200
    Then expect Print Modal Preview label is displayed
    Then set Print modal Print-On to Shipping Label - 5x8
    Then expect Print Modal Preview label is displayed
    Then Close Print Modal
    Then Sign out