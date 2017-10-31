@orders_settings
Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

  @orders_settings_stores
  Scenario: Orders Settings - Stores
    Then click orders toolbar settings button
    Then click Order Settings Stores Add button
    Then select Paypal on Marketplace modal
    Then set PayPal Email Address to qaclient@stamps.com
    #Then Open Orders Settings
    #Then click orders toolbar settings button
    #Then click Order Settings Stores Add button