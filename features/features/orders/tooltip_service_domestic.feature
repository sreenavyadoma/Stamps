
Feature: service Tooltip

  Background:
    Given a valid user is signed in to Web Apps

  @tooltips_services
  Scenario: International service Tooltip Tests
    Then click Orders Toolbar Add button
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

  @tooltips_services
  Scenario: Domestic service Tooltip Tests
    Then click Orders Toolbar Add button

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




