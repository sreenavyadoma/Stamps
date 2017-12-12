@stores
Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @paypal_workflow
    Scenario: PayPal Workflow
      Then click orders toolbar settings button
      Then click Order Settings Stores Add button
      Then search Marketplace for store name Paypal
      Then expect Marketplace dataview count is equal to 1
      Then connect Marketplace store Paypal
      Then set PayPal Email Address to qaclient@stamps.com
      Then click Paypal verify email button
      #need a valid paypal email to make this work
      Then set Paypal orders number option to use the Paypal transaction ID
      Then set Paypal orders number option to use the invoice number
      Then set PayPal Email Address restriction to qaclient@stamps.com
      Then set Paypal import option to import all transactions
      Then set Paypal import option to only import the following transaction types
      Then Check Integral Evolution as a Paypal transaction type
      Then Uncheck Integral Evolution as a Paypal transaction type
      Then Check Express Checkout as a Paypal transaction type
      #Then Connect to Paypal Store
      #Then Set Paypal store nickname to My Store
      #Then Add new Paypal service mapping
      #Then Set Store Nickname to random
      #Then Set store service Mapping (\d+), Requested Services (.*), Shipping service (.*)
      #Then Paypal: Expect Help article is present
      #Then Paypal: Open Paypal link
      #Then Paypal: Expect Paypal site is present
      #Then PayPal: Set PayPal Email Address to xxxxxxxx
      #Then Paypal: Expect error icon appears next to Email address field
      #Then Paypal: Close modal
      #Then Orders Settings: Click Done
      #Then Sign out


