
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper

  Scenario: User Prints International Address
    And I Add a new order
    * Set Ship From to default
    * Set Ship-To country to Canada
    * Set International Ship-To Name to random
    * Set International Ship-To Company to random
    * Set International Ship-To Address 1 to random
    * Set International Ship-To Address 2 to random
    * Set International Ship-To City to random
    * Set International Ship-To Province to random
    * Set International Ship-To Postal Code to random
    * Set International Ship-To Phone to random
    * Set International Ship-To Email to random
    * Open Customs Form
    * Set Customs Form Package Contents to Merchandise
    * Set Customs Form Weight(oz) to 1
    * Add or Edit Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Set Service to First-Class Mail International Large Envelope
    * Print
