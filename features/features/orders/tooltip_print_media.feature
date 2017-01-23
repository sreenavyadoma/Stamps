Feature: Print Media Tooltips

  Background:
    Given I am signed in to Orders

  @tooltip_print_media
  Scenario:  Verify tooltips for all Print Media selections
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Order Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Print Modal: Open Print Modal
    Then Tooltips: Expect Print Modal Print Media "Shipping Label - 8 ½" x 11" Paper" tooltip to include "Use any letter-size sheet of plain paper to print up to two 4” x 6” shipping labels, including postage, addresses, tracking barcode, and customs form.||Use any letter-size sheet of plain paper to print up to two 4” x 6” shipping labels, including postage, addresses, tracking barcode, and customs form.<br><br>Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination."
    Then Tooltips: Expect Print Modal Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"" tooltip to include "Use these letter-sized label sheets with two 4 ¼” x 6 ¾” labels per sheet to print postage, addresses, tracking barcode, and customs form.||Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination."
    Then Tooltips: Expect Print Modal Print Media "Shipping Label - 5 ½" x 8 ½"" tooltip to include "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode.||Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination.<br><br>Product Numbers:||Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then Tooltips: Expect Print Modal Print Media "Roll - 4" x 6" Shipping Label" tooltip to include "Use these 4” x 6” thermal label rolls to print postage, addresses, tracking barcode, and customs form.||Can be used to ship any mailpiece to any U.S. or international destination.||Compatible Printers:||Most Zebra/Eltron models and Samsung Bixolon SRP 770II."
    Then Tooltips: Expect Print Modal Print Media "Roll - 4 ⅛" x 6 ¼" Shipping Label" tooltip to include "Use these 4⅛” x 6¼” thermal label rolls to print postage, addresses, tracking barcode, and customs form.||Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination.||Compatible Printers:||Dymo 4XL, most Zebra/Eltron models and Samsung Bixolon SRP 770II."
    Then Print Modal: Close Print Modal
    Then Sign out

