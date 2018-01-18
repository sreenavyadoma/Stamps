#AB_ORDERSAUTO_3518
@print_label_preview_image
Feature: Print label preview should have image for FCM Large Envelope

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: Validate image for each label type
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 5 and 8
    Then set Order Details Ounces to 1
    Then set Order Details service to FCM Large Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then expect Print Modal Preview label is displayed
    Then set Print modal Print-On to Shipping Label - SDC-1200
    When Select Print Modal right-side label
    Then expect Print Modal Preview label is displayed
    Then set Print modal Print-On to Shipping Label - 5 x 8
    When Select Print Modal left-side label
    Then expect Print Modal Preview label is displayed
    Then Close Print Modal
    Then Sign out