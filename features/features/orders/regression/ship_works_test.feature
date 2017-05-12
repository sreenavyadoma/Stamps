
Feature: Verify Ship Works Integration

  Background:
    Given a valid user is signed in to Web Apps

  @ship_works
  Scenario:  Order Details Form
    Then add new order
    Then expect Order Details form Ship-From Textbox is enabled
    Then expect Order Details form Ship-From drop-down be enabled
    Then expect Order Details form Ship-To Textbox is enabled
    Then expect Order Details form Ship-To drop-down is enabled
    Then expect Order Details form Ship-To text area is enabled
    Then expect Order Details form Phone Textbox is enabled
    Then expect Order Details form Email Textbox is enabled
    Then expect Order Details form Pounds Textbox is enabled
    Then expect Order Details form Ounces Textbox is enabled
    Then expect Order Details form service Textbox is enabled
    Then expect Order Details form service drop-down is enabled
    Then expect Order Details form Insure-For Textbox is enabled
    Then Expect Order Detials Form Tracking Textbox is enabled
    Then expect Order Details form Tracking drop-down is enabled
    Then Sign out








