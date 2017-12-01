
@stores_shipstation_postupgrade
Feature: ShipStation Post Upgrade Path

  Background:
    Given a valid user is signed in to Web Apps

  @looking_for_shipstation_dialog
  Scenario: Looking for ShipStation? dialog

    Then expect Orders page Looking for ShipStation? dialog is present
    Then expect in Looking for ShipStation? dialog header contain Looks like you’ve taken advantage of our FREE 60-day upgrade to ShipStation.
    Then expect in Looking for ShipStation? dialog CheckBox is present
    Then expect in Looking for ShipStation? dialog Sign in to ShipStation Button exists
    Then expect in Looking for ShipStation? dialog Close Button exists
    Then click on close Button
    Then Refresh the browser
    Then expect Orders page Looking for ShipStation? dialog is present
    Then check Looking for ShipStation? dialog don't show checkbox
    Then un-check Looking for ShipStation? dialog don't show checkbox
    Then click on close Button

    # Validate Available in ShipStation Message in Marketplace
    Then click orders toolbar settings button
    Then click Order Settings Stores Add button
    Then search Marketplace for store name opencart
    Then expect Marketplace modal Available in ShipStation Message present in opencart

    Then Sign out