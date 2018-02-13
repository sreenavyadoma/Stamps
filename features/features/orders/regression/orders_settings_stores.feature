@orders_settings
Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

  @orders_settings_stores
  Scenario: Orders Settings - Stores
    Then click orders toolbar settings button
    Then click Order Settings Stores Add button
    #Then select PayPal on Marketplace moda
    # Then select PayPal on Marketplace modal
    Then search Marketplace for store name PayPal
    Then expect Marketplace dataview count is greater than 0
    Then expect Marketplace dataview count is less than 2
    Then expect Marketplace dataview count is equal to 1

    Then connect Marketplace store PayPal
    Then set PayPal Email Address to qaclient@stamps.com



