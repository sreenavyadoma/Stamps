
Feature: Verify Ship Works Integration

  Background:
    Given a valid user is signed in to Web Apps

  @ship_works
  Scenario:  Order Details Form
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Ship-From Textbox is enabled
    Then On Order Details form, expect Ship-From drop-down be enabled
    Then On Order Details form, expect Ship-To Textbox is enabled
    Then On Order Details form, expect Ship-To drop-down is enabled
    Then On Order Details form, expect Ship-To text area is enabled
    Then On Order Details form, expect Phone Textbox is enabled
    Then On Order Details form, expect Email Textbox is enabled
    Then On Order Details form, expect Pounds Textbox is enabled
    Then On Order Details form, expect Ounces Textbox is enabled
    Then On Order Details form, expect service Textbox is enabled
    Then On Order Details form, expect service drop-down is enabled
    Then On Order Details form, expect Insure-For Textbox is enabled
    Then Expect Order Detials Form Tracking Textbox is enabled
    Then On Order Details form, expect Tracking drop-down is enabled
    Then Sign out








