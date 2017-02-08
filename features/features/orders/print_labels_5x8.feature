# encoding: utf-8
Feature: I want is able to print to 5.5 x 8.5 labels (single or multi) B-01667

  Background:
  Given a valid user is signed in to Web Apps

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    #Then View Print On option Shipping Label 5.5 x 8.5 tooltip
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode."
   # Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination."
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then in Print modal, click Print button
    Then Sign out

  @print_labels_5x8
  Scenario: Print - Shipping Label: 8 ½" x 11" Paper
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then in Print modal, click Print button

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button


    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then in Print modal, click Print button

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, click Print button
    Then Sign out

  Scenario: Print - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then in Print modal, click Print button
    Then Sign out

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, click Print button
    Then Sign out

  Scenario: Print - Roll - 4" x 6" Shipping Label
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button
    Then Sign out

  Scenario: Print - Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then in Print modal, click Print button
    Then Sign out

  Scenario: Multi Order Printing - Shipping Label: 5 ½" x 8 ½"
    #Create order 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Grid, check row 1

    #Create order 2
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Grid, check row 1

    #Create order 3
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then in Orders Grid, check row 1

    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Grid, check row 3

    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, click Print button Sample
    Then Expect system will only print first order
    Then Sign out

  Scenario:  User prints postage for CN22 Shipping Label 5.5 x 8.5
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address
      | name            | company                 | street_address      | street_address_2 |  city          | state | zip        | country       | phone  |  email |
      | Jessie Joe      | The CN 22 House         | PSC 819 BOX 1       |                  | FPO           | AE    | 09645-0001 | United States |        |        |
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Ounces to 5
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 20, Made In United States, Tariff 10
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, click Print button
    Then Sign out

  Scenario:  User prints postage for CP72 Shipping Label 5.5 x 8.5
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address
      | name            | company                 | street_address      | street_address_2| city          | state | zip        | country       | phone  |  email |
      | Tammmy Moo      | The CP72 House          | Unit 15324          |                 | APO           | AP    | 96205-5324 | United States |        |        |
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Pounds to 3
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Length to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 20, Made In United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, click Print button
    Then Sign out
