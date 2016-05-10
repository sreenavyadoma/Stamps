
Feature:  Paypal Store Management

  Background:
    Given I am signed in to Orders

    @paypal
    Scenario: PayPal Store Management
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add
      Then Marketplace: Select PayPal
      Then Paypal: Expect PayPal store modal is present
      Then PayPal: Set PayPal Email Address to qawebclient@stamps.com
      Then PayPal: Test Connection
      Then PayPal: Expect Email Verification Required modal is present
      Then PayPal: Send Email Verification
      Then PayPal: Expect Email Verification Sent modal is present
      Then PayPal: Expect Verification Email is sent to qawebclient@stamps.com
      Then Manage Stores: Close Modal
      Then Sign out




