@regression
Feature: Change Starting Label Position

  Background:
    Given I am signed in as a batch shipper auto20/password1

  @change_starting_label_position
  Scenario: B-01633 As a batch shipper, I want to be able to change the starting label position
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625 Print, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Open Print Window
    * Expect left pane selected
    * Select right pane
    * Expect right pane selected
	* Print Postage
    * Edit row 1 in the order grid
	* Open Print Window
	* Expect right pane selected
	* Select left pane
	* Print Postage
    * Sign out