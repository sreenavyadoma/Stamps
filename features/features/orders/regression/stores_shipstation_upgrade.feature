
@stores_shipstation_upgrade
Feature:  Shipstation Upgrade Path

  Background:
    Given a valid user is signed in to Web Apps

  @looking_for_shipstation_dialog
  Scenario: Looking for shipstation? dialog

    Then expect Orders page Looking for ShipStation? dialog is present
    Then expect in Looking for ShipStation? dialog header contain "Looks like you've taken advantage of our FREE 60-day upgrade to ShipStation.
    Then expect in Looking for ShipStation? dialog CheckBox is present
    Then expect in Looking for ShipStation? dialog Sign in to ShipStation Button exists
    Then expect in Looking for ShipStation? dialog Close Button exists
    Then click on close Button
    Then Refresh the browser
    Then check Looking for ShipStation? dialog don't show checkbox
    Then un-check Looking for ShipStation? dialog don't show checkbox
    Then check Looking for ShipStation? dialog don't show checkbox
    Then click on Sign in to ShipStation Button
    Then click on close Button

    Then Sign out

  @add_advanced_shipping_features
  Scenario: Add advanced shipping features dialog

    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores

    # Add Store
    Then Manage Stores: Add
    Then Marketplace: Select 3dcart

    #Add advanced shipping feature dialog
    Then expect Orders page Add Advanced Shipping Features! dialog is present
    Then expect in Add Advanced Shipping Features! dialog ShipStation logo exists
    Then expect in Add Advanced Shipping Features! dialog body contain Free 60-day upgrade
    Then expect in Add Advanced Shipping Features! dialog Add Features Now Button exists
    Then click Add Features Now Button

    #Activate your new features
    Then expect Orders page Activate Your New Features dialog is present
    Then expect in Activate Your New Features dialog body contain Simply log in to ShipStation using your Stamps.com Username and Password.
    Then expect in Activate Your New Features dialog username exists
    Then expect in Activate Your New Features dialog password exists
    Then expect in Activate Your New Features dialog terms and conditions checkbox exists
    Then expect in Activate Your New Features dialog login Button exists
    Then set in Activate Your New Features dialog username to random
    Then expect in Activate Your New Features dialog username is correct
    Then set in Activate Your New Features dialog password to random
    Then expect in Activate Your New Features dialog password is correct
    Then check in Activate Your New Features dialog terms and conditions checkbox
    Then expect in Activate Your New Features dialog terms and conditions is checked
    Then click on login Button
    Then close Activate Your New Features dialog