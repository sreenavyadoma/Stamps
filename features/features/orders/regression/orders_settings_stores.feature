@orders_settings
Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

  @orders_settings_stores
  Scenario: Orders Settings - Stores
    Then add new order
    Then set order details form ship-to country to American Samoa
    Then set order details form ship-to country to United States
    Then set order details form ship-to country to Brazil
    Then set order details form ship-to country to United States
    Then set order details form ship-to country to Japan
    Then set order details form ship-to country to United States
    #Then Open Orders Settings
    #Then Open Orders Stores Settings
    #Then click Order Settings Stores Add button