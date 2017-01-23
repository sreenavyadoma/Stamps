
Feature: FPO Shipping BVT

  Background:
    Given I am signed in as a postage shipper

  @mail_bvt
  @mail_bvt_fpo
  Scenario: FPO Shipping

    Then Postage: Select Roll 4 x 6

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States

    Then Postage: Set Ship-To to
      | name   | company               | street_address | city | state | zip    | country       |
      | random | USS Bainbridge DDG 96 | A3 Div         | FPO  | AE    | 09565  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 3
    Then Postage Roll: Select Service Priority Mail Large-Thick Envelope

    Then Postage Shipping Labels: Edit Customs Form
    Then Postage Customs Form: Set Package Contents to Gift
    Then Postage Customs Form: Set Non-Delivery Options to "Treat as abandoned"
    Then Postage Customs Form: Set Internal Transaction Number Requirement to "Required"
    Then Postage Customs Form: Set ITN Number to "12345"
    Then Postage Customs Form: Set More Info to "WP BVT FPO Shipping"
    Then Postage Customs Form: Delete All Items
    Then Postage Customs Form: Add Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Origin United States, Tariff 25
    Then Postage Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Postage Customs Form: Save

    Then Postage: Open Print Sample Modal
    Then Postage Print Modal: Select Printer "ZDesigner"
    Then Postage Print Modal: Print
    Then Sign out