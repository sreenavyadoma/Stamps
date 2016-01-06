Feature:  Customs Form Data Tooltip Error

  Background:
    Given I am signed in to Orders

  @international @international_customs_form_data_tooltip
  Scenario:  Customs Form Data Error
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"
    Then Open customs form
    Then Wait in seconds 2
    Then Cancel Customs Form
    Then Wait in seconds 2
    Then Open customs form
    Then Wait in seconds 2
    Then Expect Customs Form USPS Privacy Act Warning to be visible
    Then Set Customs Form I agree to Checked
    Then Wait in seconds 1
    Then Expect Customs Form USPS Privacy Act Warning to be hidden
    Then Set Customs Form I agree to Unchecked
    Then Expect Customs Form Tooltip Error for Item Description to be Description is a required field
    Then Expect Customs Form Tooltip Error for Qty to be Quantity must be greater than 0
    Then Expect Customs Form Tooltip Error for Unit Price to be Value must be greater than 0
    Then Expect Customs Form Tooltip Error for Pounds to be Weight cannot be 0
    Then Expect Customs Form Tooltip Error for Ounces to be Weight cannot be 0
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 50, Weight(lbs) 9, Weight(oz) 9 Origin United States, Tariff 100
    Then Wait in seconds 2
    Then Expect Customs Form Tooltip Error for Total Weight to be The itemized weight exceeds the package weight
    Then Close Customs Form
    And Sign out
