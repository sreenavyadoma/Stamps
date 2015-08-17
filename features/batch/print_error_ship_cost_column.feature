@regression
Feature:  B-01742 Show an Order's Most Recent GetRates(), CleanseAddress(), or CreateIndicium() Error in Ship Cost Column

  Background:
    * I am signed in as a batch shipper

  @ship_cost_indicium_error
  Scenario:  B-01742 Error in Ship Cost Column
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to B-01742 Invalid Address
    * Collapse Ship-To Address
    * Print expecting error Invalid
    * Set Ship-To address to random
    * Set Service to Priority Mail Large Package
    * Sign out
