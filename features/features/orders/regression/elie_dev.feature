

@details_order
Feature: All details tests for order

  Background:
    Given a valid user is signed in to Web Apps

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions

    Then Open Orders Settings
    Then Open Stores Settings
    Then Store Settings: Add
    Then Marketplace: Select PayPal
    Then PayPal: Expect PayPal store modal is present
    Then PayPal: Set PayPal Email Address to qawebclient@stamps.com
    Then Paypal: Verify Email
    Then Paypal: Send Email Verificaiton
    Then Paypal: Enter email verification code
    Then Paypal: Set Connection Order number choice to USe the Paypal Transaction ID
    Then Paypal: Set IMport Option to Import All Transactions
    Then Paypal: Connect
    Then Expect Paypal Sotre name XXX appears in Store Settings list
    Then Orders Settings: Click Done
    Then Sign out



