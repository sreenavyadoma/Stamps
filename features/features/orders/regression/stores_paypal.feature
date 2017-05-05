
Feature:  Paypal Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @paypal
    Scenario: PayPal Store Management
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add
      Then Marketplace: Select PayPal
      Then PayPal: Expect PayPal store modal is present
      Then PayPal: Set PayPal Email Address to qawebclient@stamps.com
      Then PayPal: Test Connection
      Then PayPal Email Verification Required: Expect modal is present
      Then PayPal Email Verification Required: Close modal
      Then PayPal: Close modal
      Then Manage Stores: Close Modal

      Then Manage Stores: Open Modal
      Then Manage Stores: Add
      Then Marketplace: Select PayPal
      Then PayPal: Expect PayPal store modal is present
      Then PayPal: Set PayPal Email Address to qawebclient@stamps.com
      Then PayPal: Test Connection
      Then PayPal Email Verification Required: Expect modal is present

      Then PayPal Email Verification Required: Send Email Verification
      Then PayPal: Expect Email Verification Sent modal is present
      Then PayPal: Expect Verification Email is sent to qawebclient@stamps.com
      Then PayPal: Close modal
      Then Manage Stores: Close Modal
      Then Sign out




