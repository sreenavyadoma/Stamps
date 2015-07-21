@regression
Feature:  B-01742 Show an Order's Most Recent GetRates(), CleanseAddress(), or CreateIndicium() Error in Ship Cost Column

  Background:
    * I am signed in as a batch shipper

  @ship_cost_indicium_error @printing_errors
  Scenario:  B-01742 Error in Ship Cost Column
    * Add new order
    * Print
    * Edit row 1 in the order grid
    * Print and expect error createLabelIndicium Error.
    * Set Recipient Address to B-01742
    * Print
    * Edit row 1 in the order grid
    * Print and expect error Invalid Address: The USPS address matching system was unable to find an exact match
    * Set Recipient Address to B-01636-2, Error in Ship Cost Column, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Print
    * Edit row 1 in the order grid
    * Print and expect error createLabelIndicium Error.
    * Sign out
