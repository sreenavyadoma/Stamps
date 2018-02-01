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
      Then expect Paypal store modal present
      Then expect Paypal logo present
      #Connecting to Paypal

      Then set PayPal Email Address to qaclient@stamps.com
      Then click Paypal verify email button
      Then set Paypal orders number option to use the Paypal transaction ID
      Then set Paypal orders number option to use the invoice number
      Then set PayPal Email Address restriction to qaclient@stamps.com
      Then set Paypal import option to import all transactions
      Then set Paypal import option to only import the following transaction types
      Then Check Integral Evolution as a Paypal transaction type
      Then Uncheck Integral Evolution as a Paypal transaction type
      Then Check Express Checkout as a Paypal transaction type
      Then Uncheck Express Checkout as a Paypal transaction type
      Then Connect to Paypal Store

      # Settings Modal
      Then expect store settings PayPal modal is present
      # General Settings
      Then set store settings store nickname to StampsQA
      Then expect Settings dialog store import new orders is checked
      Then Uncheck Settings dialog store import new orders
      Then expect Settings dialog store import new orders is Unchecked
      Then check Settings dialog store import new orders
      # Service Mapping
      Then select store settings requested service to service 1
      Then select store settings shipping service to FCM Large Envelope/Flat
      Then Store Settings: click Save

      # Paypal Settings Modal
      Then pause for 2 seconds
      Then select order settings store StampsQA
      Then click order settings stores edit button
      Then expect store settings PayPal modal is present
      # General Settings
      Then set store settings store nickname to StampsQA
      Then expect Settings dialog store import new orders is checked
      Then Uncheck Settings dialog store import new orders
      Then expect Settings dialog store import new orders is Unchecked
      Then check Settings dialog store import new orders
      # Service Mapping
      Then select store settings requested service to service 2
      Then select store settings shipping service to FCM Large Envelope/Flat
      Then Store Settings: click Save

      Then click order settings stores Delete button
      Then Sign out

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
      Then expect store settings modal is present
      # General Settings
      Then set store settings store nickname to StampsQA
      Then expect Settings dialog store import new orders is checked
      Then Uncheck Settings dialog store import new orders
      Then expect Settings dialog store import new orders is Unchecked
      Then check Settings dialog store import new orders
      # Service Mapping
      Then select store settings requested service to service 1
      Then select store settings shipping service to FCM Large Envelope
      Then Store Settings: click Save

      # Square Settings Modal
      Then pause for 2 seconds
      Then select order settings store StampsQA
      Then click order settings stores edit button
      Then expect store settings Square modal is present
      # General Settings
      Then set store settings store nickname to StampsQA
      Then expect Settings dialog store import new orders is checked
      Then Uncheck Settings dialog store import new orders
      Then expect Settings dialog store import new orders is Unchecked
      Then check Settings dialog store import new orders
      # Service Mapping
      Then select store settings requested service to service 2
      Then select store settings shipping service to FCM Large Envelope
      Then Store Settings: click Save
      Then Sign out

