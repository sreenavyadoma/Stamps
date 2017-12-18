Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @store_settings
    Scenario: Store Settings
      Then click orders toolbar settings button
      Then select order settings store qaclient@stamps.com
      Then click order settings stores edit button
      Then expect store settings PayPal modal is present
      Then set store settings store nickname to qaclient@stamps.com