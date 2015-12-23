
Feature: Print Media

  Background:
    Given I am signed in to Orders

  @print_media @print_media_tooltip
  Scenario:  As a batch shipper, I want to be able to change my print media
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal

    Then Select Print Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Expect Print Media "Roll - 4 ⅛" x 6 ¼" Shipping Label" tooltip to include "Use these 4⅛” x 6¼” thermal label rolls to print postage, addresses, tracking barcode, and customs form."
    Then Expect Print Media "Roll - 4 ⅛" x 6 ¼" Shipping Label" tooltip to include "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination."

    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Expect Print Media "Roll - 4" x 6" Shipping Label" tooltip to include "Use these 4” x 6” thermal label rolls to print postage, addresses, tracking barcode, and customs form."
    Then Expect Print Media "Roll - 4" x 6" Shipping Label" tooltip to include "Can be used to ship any mailpiece to any U.S. or international destination."

    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Expect Print Media "Shipping Label - 5 ½" x 8 ½"" tooltip to include "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode."
    Then Expect Print Media "Shipping Label - 5 ½" x 8 ½"" tooltip to include "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination."

    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Expect Print Media "Shipping Label - 8 ½" x 11" Paper" tooltip to include "Use any letter-size sheet of plain paper to print up to two 4” x 6” shipping labels, including postage, addresses, tracking barcode, and customs form."
    Then Expect Print Media "Shipping Label - 8 ½" x 11" Paper" tooltip to include "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination."

    Then Select Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Expect Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"" tooltip to include "Use these letter-sized label sheets with two 4 ¼” x 6 ¾” labels per sheet to print postage, addresses, tracking barcode, and customs form."
    Then Expect Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"" tooltip to include "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination."

    Then Close Print Modal

    And Sign out

  @print_media
  Scenario:  As a batch shipper, I want to be able to change my print media
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Select Print Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 5
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 4
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 2
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Select Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Pounds to 1
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print

    And Sign out

