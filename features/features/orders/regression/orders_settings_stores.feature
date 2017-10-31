@orders_settings
Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

  @orders_settings_stores
  Scenario: Orders Settings - Stores
    Then Open Orders Settings
    Then Open Orders Stores Settings
    Then click Order Settings Stores Add button
    Then select Paypal on Marketplace modal
    Then set PayPal Email Address to qaclient@stamps.com
    #Then Open Orders Settings
    #Then Open Orders Stores Settings
    #Then click Order Settings Stores Add button