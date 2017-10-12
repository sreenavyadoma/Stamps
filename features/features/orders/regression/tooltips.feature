@tooltips
Feature:  Tooltip Errors

  Background:
    Given a valid user is signed in to Web Apps

  @tooltip_customs_form
  Scenario:  Customs Form Data Error

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then set Order Details form service to PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then Pause for 1 second
    Then Cancel Customs Form
    Then Pause for 1 second
    Then click Order Details form Edit Form button
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then uncheck Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then uncheck Customs form I agree to the USPS Privacy Act Statement

    Then expect Customs form Associated Item Description Tooltip Error is Description is a required field
    Then expect Customs form Qty Tooltip Error is Quantity must be greater than 0
    Then expect Customs form Unit Price Tooltip Error is Value must be greater than 0
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 50, Made In United States, Tariff 100
    Then Pause for 2 seconds
    Then close Customs Information form
    Then Sign out


  @tooltips_improvements
  Scenario: Tooltips Improvements

    Then Filter Panel: Menu Item collapse button tooltip should be Collapse this panel.
    Then Filter Panel: Collapse Panel
    Then Filter Panel: Menu Item expand button tooltip should be Expand this panel.
    Then Filter Panel: Expand Panel
    Then in Orders Toolbar, expect Add Tooltip to include Add
    Then in Orders Toolbar, expect Add Tooltip to include Create a new, blank order.
    Then add new order
    Then in Orders Toolbar, expect Move Tooltip to include Move
    Then in Orders Toolbar, expect Move Tooltip to include Move all selected orders to a different status.
    Then in Orders Toolbar, expect Print Tooltip to include Print
    Then in Orders Toolbar, expect Print Tooltip to include Print labels for all selected orders.
    Then on Order Details form, Collapse Panel
    Then on Order Details form, Expand panel
    Then expect Order Details form Toolbar Menu Tooltip is View more options



  @tooltip_print_media
  Scenario:  Verify tooltips for all Print Media selections

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then set Order Details form Pounds to 1
    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then Tooltips: Expect Print Modal Print Media Shipping Label - Paper tooltip to include "Use any letter-size sheet of plain paper to print up to two 4” x 6” shipping labels, including postage, addresses, tracking barcode, and customs form.||Use any letter-size sheet of plain paper to print up to two 4” x 6” shipping labels, including postage, addresses, tracking barcode, and customs form.<br><br>Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination."
    Then Tooltips: Expect Print Modal Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"" tooltip to include "Use these letter-sized label sheets with two 4 ¼” x 6 ¾” labels per sheet to print postage, addresses, tracking barcode, and customs form.||Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination."
    Then Tooltips: Expect Print Modal Print Media "Shipping Label - 5 ½" x 8 ½"" tooltip to include "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode.||Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination.<br><br>Product Numbers:||Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then Tooltips: Expect Print Modal Print Media "Roll - 4" x 6" Shipping Label" tooltip to include "Use these 4” x 6” thermal label rolls to print postage, addresses, tracking barcode, and customs form.||Can be used to ship any mailpiece to any U.S. or international destination.||Compatible Printers:||Most Zebra/Eltron models and Samsung Bixolon SRP 770II."
    Then Tooltips: Expect Print Modal Print Media "Roll 418x614" tooltip to include "Use these 4⅛” x 6¼” thermal label rolls to print postage, addresses, tracking barcode, and customs form.||Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. or international destination.||Compatible Printers:||Dymo 4XL, most Zebra/Eltron models and Samsung Bixolon SRP 770II."
    Then in Print modal, click Close button
    Then Sign out


  @tooltips_services_domestic
  Scenario: International service Tooltip Tests

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to Canada
    Then expect Order Details form service Tooltip for "FCMI Large Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise using your own large envelope or flat with pricing that varies by weight and country.||Envelope requirements:||Min. Dimensions: Must be more than 11 1/2" long, or more than 6 1/8" high, or more than 1/4" thick||Max. Dimensions: 15" x 12" x 3/4""
    Then expect Order Details form service Tooltip for "FCMI Package" to include "Ship up to 4 lb. and $400 worth of merchandise using your own box or thick envelope with pricing that varies by weight and country.||Box requirements:||Length + widthth + height cannot exceed 36"||Length cannot exceed 24""

    Then expect Order Details form service Tooltip for "Priority Mail International Package" to include "Ship up to 70 lb. using any large or thick envelope or box with pricing that varies by weight and country.  The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise."
    Then expect Order Details form service Tooltip for "Priority Mail International Flat Rate Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight. You must use a USPS-provided envelope which can be ordered for free from Stamps.com.||Available envelope sizes:||Standard: 	9 1/2" x 12 1/2"||Gift Card: 	7" x 10"||Windowed: 	5" x 10"||Small:		6" x 10"
    Then expect Order Details form service Tooltip for "Priority Mail International Padded Flat Rate Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight. You must use the 9 1/2" x 12 1/2" USPS-provided padded envelope which can be ordered for free from Stamps.com."

    Then expect Order Details form service Tooltip for "Priority Mail International Legal Flat Rate Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight.  You must use the 9 1/2" x 15" USPS-provided envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail International Small Flat Rate Box" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight.  You must use the USPS-provided 8 11/16" x 5 7/16" x 1 3/4" box which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail International Medium Flat Rate Box" to include "Ship up to 20 lb. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading:   14" x 12" x 3 1/2""
    Then expect Order Details form service Tooltip for "Priority Mail International Large Flat Rate Box" to include "Ship up to 20 lb. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading: 24 1/16" x 11 7/8" x 3 1/8""

    Then expect Order Details form service Tooltip for "PME International Package" to include "Ship up to 70 lb. using any thick envelope or box with pricing that varies by weight and country. The USPS provides free packaging for PME which can be ordered from Stamps.com.||Packaging requirements:||Length + 2x width + 2x height cannot exceed 108" (some countries have further restrictions)"
    Then expect Order Details form service Tooltip for "PME International Flat Rate Envelope" to include "Ship up to 4 lb. with pricing that varies by country, not weight.  You must use the 9 1/2" x 12 1/2" USPS-provided envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "PME International Padded Flat Rate Envelope" to include "Ship up to 4 lb. with pricing that varies by country, not weight.  You must use the 9 1/2" x 12 1/2" USPS-provided padded envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail International Package" to include "Ship up to 4 lb. with pricing that varies by country, not weight.  You must use the 9 1/2" x 15" USPS-provided envelopes which can be ordered for free from Stamps.com."

  @tooltips_services_domestic
  Scenario: Domestic service Tooltip Tests

    Then add new order

    Then expect Order Details form service Tooltip for "FCM Package" to include "Ship up to 15.999 ounces using your own large envelope or flat with pricing that varies by weight, not distance.||Envelope requirements:||Min. Dimensions: Must be more than 11 1/2" long, or more than 6 1/8" high, or more than 1/4" thick||Max. Dimensions: 15" x 12" x 3/4""
    Then expect Order Details form service Tooltip for "First-Class Mail Package/Thick Envelope" to include "Ship up to 15.999 ounces using your own box or thick envelope with pricing that varies by weight, not distance.||Packaging requirements: ||Min. Dimensions: 3/4" thick||Max. Dimensions: Package must not exceed 22" in length, 18" in width, or 15" in thickness."

    Then expect Order Details form service Tooltip for "Priority Mail Large/Thick Envelope" to include "Ship up to 70 lb. using any large or thick envelope with pricing that varies by weight and distance. The USPS provides free packaging for Priority Mail, which can be ordered from Stamps.com.||Envelope requirements:||Length + 2x width + 2x height cannot exceed 84""
    Then expect Order Details form service Tooltip for "PM Package" to include "Ship up to 70 lb. using any box with pricing that varies by weight and distance. The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com.||Packaging requirements:||Length + 2x width + 2x height cannot exceed 84""
    Then expect Order Details form service Tooltip for "Priority Mail Large Package" to include "Ship up to 70 lb. using any large box with pricing that varies by weight and distance. The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com.||Packaging requirements:||Length + 2x width + 2x height must be over 84" and less than 108""
    Then expect Order Details form service Tooltip for "Priority Mail Flat Rate Envelope" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use a USPS-provided envelope which can be ordered for free from Stamps.com.||Available envelope sizes:||Standard:	9 1/2" x 12 1/2"||Gift Card: 	7" x 10"||Windowed: 	5" x 10"||Small:		6" x 10""
    Then expect Order Details form service Tooltip for "Priority Mail Padded Flat Rate Envelope" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use the USPS-provided 9 1/2" x 12 1/2"padded envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail Legal Flat Rate Envelope" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use the USPS-provided 9 1/2" x 15" envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail Small Flat Rate Box" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use the USPS-provided 8 11/16" x 5 7/16" x 1 3/4" box which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail Medium Flat Rate Box" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Available box sizes:||Top Loading: 11 1/4" x 8 3/4" x 6"||Side Loading: 14" x 12" x 3 1/2""
    Then expect Order Details form service Tooltip for "Priority Mail Large Flat Rate Box" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Available box sizes:||Standard: 12 1/4" x 12 1/4" x 6||"
    Then expect Order Details form service Tooltip for "Priority Mail Regional Rate Box A" to include "Ship up to 15 lb. anywhere in the U.S. with pricing that varies by distance, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Available box sizes:||Top Loading:10 1/8" x 7 1/8" x 5"||Side Loading: 13 1/16" x 11 1/16" x 2 1/2""
    Then expect Order Details form service Tooltip for "Priority Mail Regional Rate Box B" to include "Ship up to 20 lb. anywhere in the U.S. with pricing that varies by distance, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Available box sizes:||Top Loading: 	12 1/4" x 10 1/2" x 5 1/2" ||Side Loading:	16 1/4" x 14 1/2" x 3""

    Then expect Order Details form service Tooltip for "PME Package" to include "Ship up to 70 lb. using any box or envelope with pricing that varies by weight and distance. The USPS provides free packaging for PME which can be ordered from Stamps.com.||Packaging requirements:||Length + 2x width + 2x height cannot exceed 108""
    Then expect Order Details form service Tooltip for "PME Flat Rate Envelope" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use the 9 1/2" x 12 1/2" USPS-provided envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "PME Padded Flat Rate Envelope" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use the USPS-provided 9 1/2" x 12 1/2"padded envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "PME Legal Flat Rate Envelope" to include "Ship up to 70 lb. to anywhere in the U.S. for one low rate.  You must use the USPS-provided 9 1/2" x 15" envelope which can be ordered for free from Stamps.com."

    Then expect Order Details form service Tooltip for "Media Mail Package" to include "Ship up to 70 lb. using your own thick envelope or box with pricing that varies by weight, not distance.||Packaging requirements:||Length + 2x width + 2x height cannot exceed 108""

    Then expect Order Details form service Tooltip for "Parcel Select Ground Package" to include "Ship up to 70 lb. using your own thick envelope or box with pricing that varies by weight and distance. ||Packaging requirements:||Length + 2x width + 2x height must be less than 84""
    Then expect Order Details form service Tooltip for "Parcel Select Ground Large Package" to include "Ship up to 70 lb. using your own large box with pricing that varies by weight and distance. ||Packaging requirements:||Length + 2x width + 2x height must be over 84""
    Then expect Order Details form service Tooltip for "Parcel Select Ground Oversized Package" to include "Ship up to 70 lb. using your own oversized box with pricing that varies by weight and distance. ||Packaging requirements:||Length + 2x width + 2x height must be over 108" and less than 130""


  @tooltips_services_international
  Scenario: International service Tooltip Tests

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to Canada
    Then expect Order Details form service Tooltip for "FCMI Large Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise using your own large envelope or flat with pricing that varies by weight and country.||Envelope requirements:||Min. Dimensions: Must be more than 11 1/2" long, or more than 6 1/8" high, or more than 1/4" thick||Max. Dimensions: 15" x 12" x 3/4""
    Then expect Order Details form service Tooltip for "FCMI Package" to include "Ship up to 4 lb. and $400 worth of merchandise using your own box or thick envelope with pricing that varies by weight and country.||Box requirements:||Length + widthth + height cannot exceed 36"||Length cannot exceed 24""

    Then expect Order Details form service Tooltip for "Priority Mail International Package" to include "Ship up to 70 lb. using any large or thick envelope or box with pricing that varies by weight and country.  The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise."
    Then expect Order Details form service Tooltip for "Priority Mail International Flat Rate Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight. You must use a USPS-provided envelope which can be ordered for free from Stamps.com.||Available envelope sizes:||Standard: 	9 1/2" x 12 1/2"||Gift Card: 	7" x 10"||Windowed: 	5" x 10"||Small:		6" x 10"
    Then expect Order Details form service Tooltip for "Priority Mail International Padded Flat Rate Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight. You must use the 9 1/2" x 12 1/2" USPS-provided padded envelope which can be ordered for free from Stamps.com."

    Then expect Order Details form service Tooltip for "Priority Mail International Legal Flat Rate Envelope" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight.  You must use the 9 1/2" x 15" USPS-provided envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail International Small Flat Rate Box" to include "Ship up to 4 lb. and $400 worth of merchandise with pricing that varies by country, not weight.  You must use the USPS-provided 8 11/16" x 5 7/16" x 1 3/4" box which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail International Medium Flat Rate Box" to include "Ship up to 20 lb. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading:   14" x 12" x 3 1/2""
    Then expect Order Details form service Tooltip for "Priority Mail International Large Flat Rate Box" to include "Ship up to 20 lb. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading: 24 1/16" x 11 7/8" x 3 1/8""

    Then expect Order Details form service Tooltip for "PME International Package" to include "Ship up to 70 lb. using any thick envelope or box with pricing that varies by weight and country. The USPS provides free packaging for PME which can be ordered from Stamps.com.||Packaging requirements:||Length + 2x width + 2x height cannot exceed 108" (some countries have further restrictions)"
    Then expect Order Details form service Tooltip for "PME International Flat Rate Envelope" to include "Ship up to 4 lb. with pricing that varies by country, not weight.  You must use the 9 1/2" x 12 1/2" USPS-provided envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "PME International Padded Flat Rate Envelope" to include "Ship up to 4 lb. with pricing that varies by country, not weight.  You must use the 9 1/2" x 12 1/2" USPS-provided padded envelope which can be ordered for free from Stamps.com."
    Then expect Order Details form service Tooltip for "Priority Mail International Package" to include "Ship up to 4 lb. with pricing that varies by country, not weight.  You must use the 9 1/2" x 15" USPS-provided envelopes which can be ordered for free from Stamps.com."

