Feature: Stamps BVT



  Background:
    Given I am signed in as Mail shipper

  @mail_bvt_netstamps_specify

  Scenario: Stamps Specify Postage
    Then Mail: Select Stamps

    Then Mail Stamps: Set Serial Number to random

    Then Mail Stamps: Select Specify Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Specify Mail service Media Mail
    Then Mail Stamps: Set Stamp Amount to $4.65
    Then Mail Stamps: Set Quantity to 3
    Then Mail Stamps: Set Reference Number to Stamp3221
    Then Mail Stamps: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out

  @mail_bvt_netstamps_calculate
  Scenario: Stamps Calculate Postage
    Then Mail: Select Stamps
    Then Mail Stamps: Set Serial Number to random
    Then Mail Stamps: Select Calculate Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Set Weight 0 lb 1 oz
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out

