@stores
Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps



    @paypal_workflow
    Scenario: PayPal Workflow

      Then click orders toolbar settings button
      Then click Order Settings Stores Add button
      Then search Marketplace for store name PayPal
      Then expect Marketplace dataview count is equal to 1
      Then connect Marketplace store Paypal
      Then expect PayPal store modal present
      Then expect PayPal logo present

      ##PayPal Email Verification
      Then set PayPal Email Address to qaclient@stamps.com
      Then click PayPal verify email button

      ## PayPal Settings
      Then set PayPal orders number option to use the PayPal transaction ID
      Then set PayPal orders number option to use the invoice number
      Then set PayPal Email Address restriction to qaclient@stamps.com
      Then set PayPal import option to import all transactions
      Then set PayPal import option to only import the following transaction types
      Then Check Cart as a PayPal transaction type
      Then Check Web Accept as a PayPal transaction type
      Then Check Express Checkout as a PayPal transaction type
      Then Check Send Money as a PayPal transaction type
      Then Check Virtual Terminal as a PayPal transaction type
      Then Check Subscription Payment as a PayPal transaction type
      Then Check Merchant Payment as a PayPal transaction type
      Then Check Mass Payment as a PayPal transaction type
      Then Check Integral Evolution as a PayPal transaction type
      Then Check Website Payments Pro Hosted as a PayPal transaction type
      Then Check Website Payments Pro API as a PayPal transaction type
      Then Expect Cart is checked as a PayPal transaction type
      Then Expect Web Accept is checked as a PayPal transaction type
      Then Expect Express Checkout is checked as a PayPal transaction type
      Then Expect Send Money is checked as a PayPal transaction type
      Then Expect Virtual Terminal is checked as a PayPal transaction type
      Then Expect Subscription Payment is checked as a PayPal transaction type
      Then Expect Merchant Payment is checked as a PayPal transaction type
      Then Expect Mass Payment is checked as a PayPal transaction type
      Then Expect Integral Evolution is checked as a PayPal transaction type
      Then Expect Website Payments Pro Hosted is checked as a PayPal transaction type
      Then Expect Website Payments Pro API is checked as a PayPal transaction type
      Then Uncheck Cart as a PayPal transaction type
      Then Uncheck Web Accept as a PayPal transaction type
      Then Uncheck Express Checkout as a PayPal transaction type
      Then Uncheck Send Money as a PayPal transaction type
      Then Uncheck Virtual Terminal as a PayPal transaction type
      Then Uncheck Subscription Payment as a PayPal transaction type
      Then Uncheck Merchant Payment as a PayPal transaction type
      Then Uncheck Mass Payment as a PayPal transaction type
      Then Uncheck Integral Evolution as a PayPal transaction type
      Then Uncheck Website Payments Pro Hosted as a PayPal transaction type
      Then Uncheck Website Payments Pro API as a PayPal transaction type
      Then Expect Cart is unchecked as a PayPal transaction type
      Then Expect Web Accept is unchecked as a PayPal transaction type
      Then Expect Express Checkout is unchecked as a PayPal transaction type
      Then Expect Send Money is unchecked as a PayPal transaction type
      Then Expect Virtual Terminal is unchecked as a PayPal transaction type
      Then Expect Subscription Payment is unchecked as a PayPal transaction type
      Then Expect Merchant Payment is unchecked as a PayPal transaction type
      Then Expect Mass Payment is unchecked as a PayPal transaction type
      Then Expect Integral Evolution is unchecked as a PayPal transaction type
      Then Expect Website Payments Pro Hosted is unchecked as a PayPal transaction type
      Then Expect Website Payments Pro API is unchecked as a PayPal transaction type

      Then Connect to PayPal Store

      ## Store Settings
      Then expect store settings PayPal modal is present
      Then set store settings store nickname to random
      Then expect Settings dialog store import new orders is checked
      Then Uncheck Settings dialog store import new orders
      Then expect Settings dialog store import new orders is Unchecked
      Then check Settings dialog store import new orders

      ## Service Mapping
      Then add store service Mapping 1, Requested Services service 1, Shipping service FCM Large Envelope/Flat
      Then add store service Mapping 2, Requested Services service 5, Shipping service PM Package

      ##Products Settings
      Then Check Store Settings dialog Automatically add new products to the Products page
      Then Expect Store Settings dialog Automatically add new products to the Products page is checked
      Then Uncheck Store Settings dialog Automatically add new products to the Products page
      Then Expect Store Settings dialog Automatically add new products to the Products page is unchecked
      Then Select Uniquely Identify Products by SKU
      Then Select Uniquely Identify Products by Product Listing Name
      Then Click Save in Store Settings modal

      ##Edit Sore Settings
      Then pause for 2 seconds
      Then select saved order settings store
      Then click order settings stores edit button
      Then expect store settings PayPal modal is present
      Then set store settings store nickname to random
      Then expect Settings dialog store import new orders is checked
      Then Uncheck Settings dialog store import new orders
      Then expect Settings dialog store import new orders is Unchecked
      Then check Settings dialog store import new orders
      Then add store service Mapping 3, Requested Services service 8, Shipping service PM Small Flat Rate Box
      Then Click Save in Store Settings modal

      ##Delete Store
      Then select saved order settings store
      Then click order settings stores Delete button
      Then click order settings stores Delete confirmation button
      Then expect orders settings store saved nickname is not present in list
      Then click Done in orders settings store tab
      Then sign out

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
      Then Click Save in Store Settings modal
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
      Then Click Save in Store Settings modal
      Then sign out

