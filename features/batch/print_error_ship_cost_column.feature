@regression
Feature:  B-01742 Show an Order's Most Recent GetRates(), CleanseAddress(), or CreateIndicium() Error in Ship Cost Column

  Background:
    * I am signed in as a batch shipper

  @ship_cost_indicium_error
  Scenario:  B-01742 Error in Ship Cost Column
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to B-01742 Invalid Address
    * Set Phone to 4157984533
    * Hide Ship-To text area
    * Print expecting error Invalid
    * Sign out
