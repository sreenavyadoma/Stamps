
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
    Then Postage Roll: Select service Priority Mail Large-Thick Envelope

    Then Postage Shipping Labels: Edit Customs Form
    Then Postage set Customs form Package Contents to Gift
    Then Postage set Customs form Non-Delivery Options to "Treat as abandoned"
    Then Postage set Customs form Internal Transaction Number Requirement to "Required"
    Then Postage set Customs form ITN Number to "12345"
    Then Postage set Customs form More Info to "WP BVT FPO Shipping"
    Then Postage on Customs form, Delete All Items
    Then Postage add Customs form Associated Item - Description random, Qty 2, Value 90, Lbs 0, Oz 1, Made In United States, Tariff 25
    Then Postage check Customs form I agree to the USPS Privacy Act Statement
    Then Postage on Customs form, Save

    Then Postage: Open Print Sample Modal
    Then Postage select Print modal Printer "ZDesigner"
    Then Postage in Print modal, click Print button
    Then Sign out