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


    @square_workflow
    Scenario: Square Store Workflow

      Then click orders toolbar settings button
      Then click Order Settings Stores Add button
      Then search Marketplace for store name square
      Then expect Marketplace dataview count is equal to 2
      Then connect Marketplace store square
      Then expect Square store modal present
      Then expect Square logo present
      Then expect Square Authorize Button present
      Then click Square Authorize Button

      # External sites Square Login page ##https://squareup.com/login?
      Then expect external site square email text box is present
      Then set external site square email is webapps@stamps.com
      Then set external site square password is password1
      Then click external site square Sign In button

      # Settings Modal
      Then expect Square Settings dialog is present
      # General Settings
      Then expect Settings dialog General Settings is present
      Then set store settings store nickname to qaclient@stamps.com
      Then expect Settings dialog store import new orders is checked
      Then Uncheck Settings dialog store import new orders
      Then expect Settings dialog store import new orders is Unchecked
      Then check Settings dialog store import new orders
      # Service Mapping
      Then select store settings shipping service to FCM Large Envelope

