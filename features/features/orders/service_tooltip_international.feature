
Feature: Service Tooltip for International Services

  Background:
    Given I am signed in to Orders

  @service_tooltip
  Scenario: International Service Tooltip Tests
    And Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to Canada
    Then Order Details: Expect Service Tooltip for "First-Class Mail International Large Envelope/Flat" to include "Ship up to 4 lbs. and $400 worth of merchandise using your own large envelope or flat with pricing that varies by weight and country.||Envelope requirements:||Min. Dimensions: Must be more than 11 1/2" long, or more than 6 1/8" high, or more than 1/4" thick||Max. Dimensions: 15" x 12" x 3/4""
    Then Order Details: Expect Service Tooltip for "First-Class Mail International Package/Thick Envelope" to include "Ship up to 4 lbs. and $400 worth of merchandise using your own box or thick envelope with pricing that varies by weight and country.||Box requirements:||Length + widthth + height cannot exceed 36"||Length cannot exceed 24""

    Then Order Details: Expect Service Tooltip for "Priority Mail International Package" to include "Ship up to 70 lbs. using any large or thick envelope or box with pricing that varies by weight and country.  The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise."
    Then Order Details: Expect Service Tooltip for "Priority Mail International Flat Rate Envelope" to include "Ship up to 4 lbs. and $400 worth of merchandise with pricing that varies by country, not weight. You must use a USPS-provided envelope which can be ordered for free from Stamps.com.||Available envelope sizes:||Standard: 	9 1/2" x 12 1/2"||Gift Card: 	7" x 10"||Windowed: 	5" x 10"||Small:		6" x 10"
    Then Order Details: Expect Service Tooltip for "Priority Mail International Padded Flat Rate Envelope" to include "Ship up to 4 lbs. and $400 worth of merchandise with pricing that varies by country, not weight. You must use the 9 1/2" x 12 1/2" USPS-provided padded envelope which can be ordered for free from Stamps.com."

    Then Order Details: Expect Service Tooltip for "Priority Mail International Legal Flat Rate Envelope" to include "Ship up to 4 lbs. and $400 worth of merchandise with pricing that varies by country, not weight.  You must use the 9 1/2" x 15" USPS-provided envelope which can be ordered for free from Stamps.com."
    Then Order Details: Expect Service Tooltip for "Priority Mail International Small Flat Rate Box" to include "Ship up to 4 lbs. and $400 worth of merchandise with pricing that varies by country, not weight.  You must use the USPS-provided 8 11/16" x 5 7/16" x 1 3/4" box which can be ordered for free from Stamps.com."
    Then Order Details: Expect Service Tooltip for "Priority Mail International Medium Flat Rate Box" to include "Ship up to 20 lbs. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading:   14" x 12" x 3 1/2""
    Then Order Details: Expect Service Tooltip for "Priority Mail International Large Flat Rate Box" to include "Ship up to 20 lbs. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading: 24 1/16" x 11 7/8" x 3 1/8""

    Then Order Details: Expect Service Tooltip for "Priority Mail Express International Package" to include "Ship up to 70 lbs. using any thick envelope or box with pricing that varies by weight and country. The USPS provides free packaging for Priority Mail Express which can be ordered from Stamps.com.||Packaging requirements:||Length + 2x width + 2x height cannot exceed 108" (some countries have further restrictions)"
    Then Order Details: Expect Service Tooltip for "Priority Mail Express International Flat Rate Envelope" to include "Ship up to 4 lbs. with pricing that varies by country, not weight.  You must use the 9 1/2" x 12 1/2" USPS-provided envelope which can be ordered for free from Stamps.com."
    Then Order Details: Expect Service Tooltip for "Priority Mail Express International Padded Flat Rate Envelope" to include "Ship up to 4 lbs. with pricing that varies by country, not weight.  You must use the 9 1/2" x 12 1/2" USPS-provided padded envelope which can be ordered for free from Stamps.com."
    Then Order Details: Expect Service Tooltip for "Priority Mail Express International Legal Flat Rate Envelope" to include "Ship up to 4 lbs. with pricing that varies by country, not weight.  You must use the 9 1/2" x 15" USPS-provided envelopes which can be ordered for free from Stamps.com."



