
Feature: Verify Ship Works Integration

  Background:
    Given a valid user is signed in to Web Apps

  @ship_works
  Scenario:  Order Details Form
    Then add new order
    Then expect Order Details Ship-From Textbox is enabled
    Then expect Order Details Ship-From drop-down be enabled
    Then expect Order Details Ship-To Textbox is enabled
    Then expect Order Details Ship-To drop-down is enabled
    Then expect Order Details Ship-To text area is enabled
    Then expect Order Details Phone Textbox is enabled
    Then expect Order Details Email Textbox is enabled
    Then expect Order Details Pounds Textbox is enabled
    Then expect Order Details Ounces Textbox is enabled
    Then expect Order Details service Textbox is enabled
    Then expect Order Details service drop-down is enabled
    Then expect Order Details Insure-For Textbox is enabled
    Then Expect Order Detials Form Tracking Textbox is enabled
    Then expect Order Details Tracking drop-down is enabled
    Then Sign out








