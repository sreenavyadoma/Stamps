
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    * I am signed in as a batch shipper

  @international_address
  Scenario:  1 User Enters International Address, User Changes Ship To Country, Ship To Country is NOT United States, ser Edits Component Int'l Address Fields, Field Attributes
    * Add new order
    * Set Ship To country to Canada
    * Expect Tracking field is hidden
    * Expect Dimentions field is hidden
    * Expect Ship To field is hidden

    * Expect Edit Customs Form button is shown
    * Expect International Ship To address fields are shown
    * Expect International Ship To name field is constrained to 50 chars
    * Expect International Ship To company field is constrained to 50 chars
    * Expect International Ship To address 1 field is constrained to 50 chars
    * Expect International Ship To address 2 field is constrained to 50 chars
    * Expect International Ship To city field is constrained to 50 chars
    * Expect International Ship To province field is constrained to 50 chars
    * Expect International Ship To postal code field is constrained to 50 chars
    * Expect International Ship To phone field is constrained to 50 chars
    * Expect International Ship To email field is constrained to 50 chars
    * Set International Ship To name to random
    * Set International Ship To company to random
    * Set International Ship To address 1 to random
    * Set International Ship To address 2 to random
    * Set International Ship To city to random
    * Set International Ship To province to random
    * Set International Ship To postal code to random
    * Set International Ship To phone to random
    * Set International Ship To email to random

  Scenario:  Field Behavior and Validation Rules
    * Add new order
    * Set Ship To country to Canada
    * Set International Ship To recipient to random
    * Add Item 1. Quantity=2, ID=random, Description=random
    * Add Item 2. Quantity=2, ID=random, Description=random

    * Open Customs Information Modal

    * Expect Customs Form checkbox for "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions" is shown
    * Expect Customs Form Add Item tooltip to be "Add another item"
    * Expect Customs Form Package Contents set to Merchandise
    * Expect Customs Form Non-Delivery Options set to Return to Sender
    * Expect Customs Form Weight(lbs) is 0
    * Expect Customs Total Value is 0.00

    * Set Customs Form Weight(lbs) to 0
    * Increment Customs Form Weight(lbs) by 2
    * Decrement Customs Form Weight(lbs) by 1
    * Expect Customs Form Weight(lbs)is 1

    * Set Customs Form Weight(oz) to 0
    * Increment Customs Form Weight(oz) by 2
    * Decrement Customs Form Weight(oz) by 1
    * Expect Customs Form Weight(oz)is 1

    * Set Customs Form Package Contents to Merchandise
    * Expect Customs Form Package Contents set to Merchandise
    * Set Customs Form Package Contents to Document
    * Expect Customs Form Package Contents set to Document
    * Set Customs Form Package Contents to Gift
    * Expect Customs Form Package Contents set to Gift
    * Set Customs Form Package Contents to Humanitarian Donation
    * Expect Customs Form Package Contents set to Humanitarian Donation
    * Set Customs Form Package Contents to Returned Goods
    * Expect Customs Form Package Contents set to Returned Goods
    * Set Customs Form Package Contents to Other
    * Expect Customs Form Package Contents set to Other
    * Set Customs Form Package Contents to Merchandise

    * Set Customs Form More Info to random

    * Set Customs Form Non-Delivery Options to Return to Sender
    * Expect Customs Form Non-Delivery Options set to Return to Sender
    * Set Customs Form Non-Delivery Options to Treat as abandoned
    * Expect Customs Form Non-Delivery Options set to Treat as abandoned

    * Set Internal Transaction # to Not Required
    * Expect Internal Transaction # is Not Required
    * Set Internal Transaction # to Required
    * Expect Internal Transaction # is Required

    * Add Customs Item 1 to description=random, qty=1, price=2500, lbs=0, oz=1 origin=United States, tariff=10
    * Add Customs Item 2 to description=random, qty=1, price=10, lbs=0, oz=1 origin=United States, tariff=10
    * Add Customs Item 3 to description=random, qty=1, price=10, lbs=0, oz=1 origin=United States, tariff=10


    * Expect Customs Form Weight(lbs) is correct
    * Expect Customs Total Value is correct

    * Expect Internal Transaction # is Required
    * Delete Customs Item 1
    * Expect Internal Transaction # is Not Required

    * Close Customs Information Modal
    * Expect Customs Information Modal is present

    * Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    * Close Customs Information Modal


  Scenario: User Edits Customs Form - International Address
    * Add new order


  Scenario:  2 User Edits Customs Form - APO/FPO Address
    * Add new order

