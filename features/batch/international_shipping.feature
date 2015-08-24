
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper

  Scenario:  Field Behavior and Validation Rules
    And I Add a new order
    Then Set Ship-To country to Canada
    Then Set Ship-To Recipient to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code     | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random        | Ottawa | Ontario  | K1A 0G9 | Canada | random  | random  |
    And Add Item 1. Quantity 2, ID random, Description random
    And Add Item 2. Quantity 3, ID random, Description random

    And Open Customs Form

    Then Expect Customs Form Checkbox "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions" is visible
    Then Expect Customs Form Add Item tooltip to be "Add another item"
    Then Expect Customs Form Package Contents to be Merchandise
    Then Expect Customs Form Non-Delivery Options to be Return to Sender
    Then Expect Customs Form Weight(lbs) to be 0
    Then Expect Customs Form Total Value to be 0.00

    Then Set Customs Form Weight(lbs) to 0
    And Increment Customs Form Weight(lbs) by 2
    And Decrement Customs Form Weight(lbs) by 1
    Then Expect Customs Form Weight(lbs) to be 1

    Then Set Customs Form Weight(oz) to 0
    And Increment Customs Form Weight(oz) by 2
    And Decrement Customs Form Weight(oz) by 1
    Then Expect Customs Form Weight(oz ) to be 1

    Then Set Customs Form Package Contents to Merchandise
    Then Expect Customs Form Package Contents to be Merchandise
    Then Set Customs Form Package Contents to Document
    Then Expect Customs Form Package Contents to be Document
    Then Set Customs Form Package Contents to Gift
    Then Expect Customs Form Package Contents to be Gift
    Then Set Customs Form Package Contents to Humanitarian Donation
    Then Expect Customs Form Package Contents to be Humanitarian Donation
    Then Set Customs Form Package Contents to Returned Goods
    Then Expect Customs Form Package Contents to be Returned Goods
    Then Set Customs Form Package Contents to Other
    Then Expect Customs Form Package Contents to be Other
    Then Set Customs Form Package Contents to Merchandise

    Then Set Customs Form More Info to random

    Then Set Customs Form Non-Delivery Options to Return To Sender
    Then Expect Customs Form Non-Delivery Options to be Return To Sender
    Then Set Customs Form Non-Delivery Options to Treat as abandoned
    Then Expect Customs Form Non-Delivery Options to be Treat as abandoned

    Then Set Customs Form Internal Transaction # to Not Required
    Then Expect Customs Form Internal Transaction # to be Not Required
    Then Set Customs Form Internal Transaction # to Required
    Then Expect Customs Form Internal Transaction # to be Required

    And Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Add Customs Form Item 2 to Description=random, Qty 1, Unit Price 10, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Add Customs Form Item 3 to Description=random, Qty 1, Unit Price 10, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10

    Then Expect Customs Form Weight(lbs) to be correct
    Then Expect Customs Form Total Value to be correct

    Then Expect Customs Form Internal Transaction # to be Required
    And Delete Customs Form Item 2
    And Delete Customs Form Item 1
    Then Expect Customs Form Internal Transaction # to be Not Required

    And Close Customs Information Modal
    Then Expect Customs Information Modal to be present

    And Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    And Close Customs Information Modal
    And Collapse Ship-To Address

  Scenario:  1 User Enters International Address, User Changes Ship-To Country, Ship-To Country is NOT United States, ser Edits Component Int'l Address Fields, Field Attributes
    And I Add a new order
    Then Set Ship-To country to Canada
    Then Expect Single Order Form International Address fields are visible
    Then Expect Single Order Form Tracking field is hidden
    Then Expect Single Order Form Dimensions field is hidden
    Then Expect Single Order Form Ship To field is hidden

    Then Expect International Ship-To Name Field Attributes are correct
    Then Expect International Ship-To Company Field Attributes are correct
    Then Expect International Ship-To Address 1 Field Attributes are correct
    Then Expect International Ship-To Address 2 Field Attributes are correct
    Then Expect International Ship-To City Field Attributes are correct
    Then Expect International Ship-To Province Field Attributes are correct
    Then Expect International Ship-To Postal Code Field Attributes are correct
    Then Expect International Ship-To Phone Field Attributes are correct
    Then Expect International Ship-To Email Field Attributes are correct

    And Open Customs Form

    Then Expect Customs Form field Package Contents behavior is correct
    Then Expect Customs Form field Non-Delivery Options behavior is correct
    Then Expect Customs Form field Internal Transaction # behavior is correct
    Then Expect Customs Form field ITN# behavior is correct
    Then Expect Customs Form field More Info behavior is correct
    Then Expect Customs Form field License # behavior is correct
    Then Expect Customs Form field Certificate # behavior is correct
    Then Expect Customs Form field Invoice # behavior is correct
    Then Expect Customs Form field Privacy Act Statement Checkbox behavior is correct
    Then Expect Customs Form field Item Description behavior is correct
    Then Expect Customs Form field Qty. behavior is correct
    Then Expect Customs Form field Unit Price behavior is correct
    Then Expect Customs Form field Unit Weight (lbs.) behavior is correct
    Then Expect Customs Form field Unit Weight (oz.) behavior is correct
    Then Expect Customs Form field HS Tariff behavior is correct
    Then Expect Customs Form field Origin behavior is correct
    Then Expect Customs Form field Total Weight behavior is correct
    Then Expect Customs Form field Total Value behavior is correct

    Then Set International Ship-To Name to random
    Then Set International Ship-To Company to random
    Then Set International Ship-To Address 1 to random
    Then Set International Ship-To Address 2 to random
    Then Set International Ship-To City to random
    Then Set International Ship-To Province to random
    Then Set International Ship-To Postal Code to random
    Then Set International Ship-To Phone to random
    Then Set International Ship-To Email to random

  Scenario: User Prints International Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to Canada
    Then Set International Ship-To Name to random
    Then Set International Ship-To Company to random
    Then Set International Ship-To Address 1 to random
    Then Set International Ship-To Address 2 to random
    Then Set International Ship-To City to random
    Then Set International Ship-To Province to random
    Then Set International Ship-To Postal Code to random
    Then Set International Ship-To Phone to random
    Then Set International Ship-To Email to random
    And Open Customs Form
    Then Set Customs Form Package Contents to Merchandise
    Then Set Customs Form Weight(oz) to 1
    And Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    And Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope
    Then Print

  Scenario:  User Prints APO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to APO Address
    And Open Customs Form
    Then Set Customs Form Package Contents to Merchandise
    Then Set Customs Form Weight(oz) to 1
    And Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    And Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope
    Then Print

  Scenario:  User Prints APO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to APO Address
    And Open Customs Form
    Then Set Customs Form Package Contents to Merchandise
    Then Set Customs Form Weight(oz) to 1
    And Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    And Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope
    Then Print

  Scenario:  User Prints FPO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to FPO address
    And Open Customs Form
    Then Set Customs Form Package Contents to Merchandise
    Then Set Customs Form Weight(oz) to 1
    And Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    And Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope
    Then Print

  Scenario: Print single or multiple at once CN22 and CP72 labels (for both int'l and APO/FPO/etc... addresses)
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to APO Address
    And Open Customs Form
    Then Set Customs Form Package Contents to Merchandise
    Then Set Customs Form Weight(oz) to 1

    And Add Customs Form Item 1 to Description=random, Qty 1, Unit Price 2500, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    And Check Customs Form "I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions"
    And Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope

    And Edit row 1 on the order grid
    And Edit row 2 on the order grid

    Then Print

  Scenario: Total Value:  If Total Value > $400 AND Int'l Service is Any First-Class Mail International service or Priority Mail International Flat Rate Envelope, Padded Flat Rate Envelope, Legal Flat Rate Envelope, and Small Flat Rate Box: Show Warning icon with the following hover over content:
  Total value cannot exceed $400 for this USPS service.  Consider using a different service that does not have limits on the value of the contents.

  Scenario: Weight:  If Total Weight > Order Weight: Show error icon with the following hover over content:
  The itemized weight exceeds the package weight.
  Please verify that the package weight is accurate.


