
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper

  Scenario: Print single or multiple at once CN22 and CP72 labels (for both int'l and APO/FPO/etc... addresses)
    And I Add a new order
    * Set Ship From to default
    * Set Ship-To country to United States
    * Set Ship-To address to APO Address
    * Open Customs Form
    * Set Customs Form Package Contents to Merchandise
    * Set Customs Form Weight(oz) to 1
	
    * Add or Edit Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Set Service to First-Class Mail International Large Envelope
	
    * Edit row 1 on the order grid
    * Edit row 2 on the order grid

    * Print