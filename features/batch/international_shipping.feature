
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    * I am signed in as a batch shipper


  Scenario:  Field Behavior and Validation Rules
    * Add new order
    * Set Ship-To country to Canada
    * Set International Ship-To recipient to random
    * Add Item 1. Quantity 2, ID random, Description random
    * Add Item 2. Quantity 3, ID random, Description random

    * Open Customs Form

    * Expect Customs Form Checkbox "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions" is visible
    * Expect Customs Form Add Item tooltip to be "Add another item"
    * Expect Customs Form Package Contents to be Merchandise
    * Expect Customs Form Non-Delivery Options to be Return to Sender
    * Expect Customs Form Weight(lbs) to be 0
    * Expect Customs Form Total Value to be 0.00

    * Set Customs Form Weight(lbs) to 0
    * Increment Customs Form Weight(lbs) by 2
    * Decrement Customs Form Weight(lbs) by 1
    * Expect Customs Form Weight(lbs) to be 1

    * Set Customs Form Weight(oz) to 0
    * Increment Customs Form Weight(oz) by 2
    * Decrement Customs Form Weight(oz) by 1
    * Expect Customs Form Weight(oz ) to be 1

    * Set Customs Form Package Contents to Merchandise
    * Expect Customs Form Package Contents to be Merchandise
    * Set Customs Form Package Contents to Document
    * Expect Customs Form Package Contents to be Document
    * Set Customs Form Package Contents to Gift
    * Expect Customs Form Package Contents to be Gift
    * Set Customs Form Package Contents to Humanitarian Donation
    * Expect Customs Form Package Contents to be Humanitarian Donation
    * Set Customs Form Package Contents to Returned Goods
    * Expect Customs Form Package Contents to be Returned Goods
    * Set Customs Form Package Contents to Other
    * Expect Customs Form Package Contents to be Other
    * Set Customs Form Package Contents to Merchandise

    * Set Customs Form More Info to random

    * Set Customs Form Non-Delivery Options to Return To Sender
    * Expect Customs Form Non-Delivery Options to be Return To Sender
    * Set Customs Form Non-Delivery Options to Treat as abandoned
    * Expect Customs Form Non-Delivery Options to be Treat as abandoned

    * Set Customs Form Internal Transaction # to Not Required
    * Expect Customs Form Internal Transaction # to be Not Required
    * Set Customs Form Internal Transaction # to Required
    * Expect Customs Form Internal Transaction # to be Required

    * Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Add Customs Form Item 2 to Description=random, Qty 1, Unit Price 10, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Add Customs Form Item 3 to Description=random, Qty 1, Unit Price 10, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10

    * Expect Customs Form Weight(lbs) to be correct
    * Expect Customs Form Total Value to be correct

    * Expect Customs Form Internal Transaction # to be Required
    * Delete Customs Form Item 2
    * Delete Customs Form Item 1
    * Expect Customs Form Internal Transaction # to be Not Required

    * Close Customs Information Modal
    * Expect Customs Information Modal to be present

    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Collapse Ship-To Address

  Scenario:  1 User Enters International Address, User Changes Ship-To Country, Ship-To Country is NOT United States, ser Edits Component Int'l Address Fields, Field Attributes
    * Add new order
    * Set Ship-To country to Canada
    * Expect Single Order Form International Address fields are visible
    * Expect Single Order Form Tracking field is hidden
    * Expect Single Order Form Dimensions field is hidden
    * Expect Single Order Form Ship To field is hidden

    * Expect International Ship-To Name Field Attributes are correct
    * Expect International Ship-To Company Field Attributes are correct
    * Expect International Ship-To Address 1 Field Attributes are correct
    * Expect International Ship-To Address 2 Field Attributes are correct
    * Expect International Ship-To City Field Attributes are correct
    * Expect International Ship-To Province Field Attributes are correct
    * Expect International Ship-To Postal Code Field Attributes are correct
    * Expect International Ship-To Phone Field Attributes are correct
    * Expect International Ship-To Email Field Attributes are correct

    * Open Customs Form

    * Expect Customs Form field Package Contents behavior is correct
    * Expect Customs Form field Non-Delivery Options behavior is correct
    * Expect Customs Form field Internal Transaction # behavior is correct
    * Expect Customs Form field ITN# behavior is correct
    * Expect Customs Form field More Info behavior is correct
    * Expect Customs Form field License # behavior is correct
    * Expect Customs Form field Certificate # behavior is correct
    * Expect Customs Form field Invoice # behavior is correct
    * Expect Customs Form field Privacy Act Statement Checkbox behavior is correct
    * Expect Customs Form field Item Description behavior is correct
    * Expect Customs Form field Qty. behavior is correct
    * Expect Customs Form field Unit Price behavior is correct
    * Expect Customs Form field Unit Weight (lbs.) behavior is correct
    * Expect Customs Form field Unit Weight (oz.) behavior is correct
    * Expect Customs Form field HS Tariff behavior is correct
    * Expect Customs Form field Origin behavior is correct
    * Expect Customs Form field Total Weight behavior is correct
    * Expect Customs Form field Total Value behavior is correct

    * Set International Ship-To Name to random
    * Set International Ship-To Company to random
    * Set International Ship-To Address 1 to random
    * Set International Ship-To Address 2 to random
    * Set International Ship-To City to random
    * Set International Ship-To Province to random
    * Set International Ship-To Postal Code to random
    * Set International Ship-To Phone to random
    * Set International Ship-To Email to random

  Scenario: User Prints International Address
    * Add new order
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
    * Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Set Service to First-Class Mail International Large Envelope
    * Print

  Scenario:  User Prints APO Address
    * Add new order
    * Set Ship From to default
    * Set Ship-To country to United States
    * Set Ship-To address to APO Address
    * Open Customs Form
    * Set Customs Form Package Contents to Merchandise
    * Set Customs Form Weight(oz) to 1
    * Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Set Service to First-Class Mail International Large Envelope
    * Print

  Scenario:  User Prints APO Address
    * Add new order
    * Set Ship From to default
    * Set Ship-To country to United States
    * Set Ship-To address to APO Address
    * Open Customs Form
    * Set Customs Form Package Contents to Merchandise
    * Set Customs Form Weight(oz) to 1
    * Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Set Service to First-Class Mail International Large Envelope
    * Print

  Scenario:  User Prints FPO Address
    * Add new order
    * Set Ship From to default
    * Set Ship-To country to United States
    * Set Ship-To address to FPO address
    * Open Customs Form
    * Set Customs Form Package Contents to Merchandise
    * Set Customs Form Weight(oz) to 1
    * Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Set Service to First-Class Mail International Large Envelope
    * Print

  Scenario: Print single or multiple at once CN22 and CP72 labels (for both int'l and APO/FPO/etc... addresses)
    * Add new order
    * Set Ship From to default
    * Set Ship-To country to United States
    * Set Ship-To address to APO Address
    * Open Customs Form
    * Set Customs Form Package Contents to Merchandise
    * Set Customs Form Weight(oz) to 1

    * Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    * Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    * Close Customs Information Modal
    * Set Service to First-Class Mail International Large Envelope

    * Edit row 1 on the order grid
    * Edit row 2 on the order grid

    * Print

  Scenario: Total Value:  If Total Value > $400 AND Int'l Service is Any First-Class Mail International service or Priority Mail International Flat Rate Envelope, Padded Flat Rate Envelope, Legal Flat Rate Envelope, and Small Flat Rate Box: Show Warning icon with the following hover over content:
  Total value cannot exceed $400 for this USPS service.  Consider using a different service that does not have limits on the value of the contents.

  Scenario: Weight:  If Total Weight > Order Weight: Show error icon with the following hover over content:
  The itemized weight exceeds the package weight.
  Please verify that the package weight is accurate.


