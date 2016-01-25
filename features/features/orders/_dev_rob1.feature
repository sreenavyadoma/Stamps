Feature: Test Development
  Background:
    Given I am signed in to Orders

  @rob_dev_printer
  Scenario:
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Ship Date to today
    # factory selection sends printout to PDF Factory.  You will need to rename your PDF Factory printer to factory.
    Then Print Modal: Set Printer to "factory"
    # Sends your printouts to Kyocera printer next to the post office.
    Then Print Modal: Set Printer to "Kyocera"
    # Sends your printouts to Brother MFC-7840W Printer
    Then Print Modal: Set Printer to "Brother"
    # Sends your printouts to EPSON printer in eva's cube.
    Then Print Modal: Set Printer to "EPSON"
    # Sends your printouts to Officejet Pro in elie's cube.
    Then Print Modal: Set Printer to "HP Officejet Pro 8600"
    Then Toolbar: Print

  Scenario:
    Then Add New Order
    Then Order Details: Set Ship-To Country to Canada
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to ambiguous address
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Company Name | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    And Select row 2 from Exact Address Not Found module
    Then Order Details: Set Service to "Priority Mail Package"
    Then Expect Grid Recipient to be Joseph Balancio
    Then Expect Grid Company to be Company Name
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 94102

    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    Then Order Details: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Add New Order
    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Add New Order
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Add New Order
    Then Order Details: Set Ship-To address to San
    Then Add New Order
    Then Order Details: Set Ship-To address to San

  Scenario:
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Priority Mail Package"
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Expect Order Details Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Expect Order Details Service Tooltip for "Priority Mail Package" to include "Priority Mail Package,Ship up to 70 lbs. using any box with pricing that varies by weight and distance,The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com."

    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Tracking to be "USPS Tracking"
    Then Order Details: Set Tracking to "Signature Required"
    Then Expect Order Details Tracking to be "Signature Required"

    Then Order Details: Set Service to "Priority Mail Package"
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Expect Order Details Tracking to be "Signature Required"

    Then Order Details: Set Service to "Priority Mail Package"
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Expect Order Details Service to be "Priority Mail Large Package"

    Then Expect Order Details Service Cost inline price for "Priority Mail Large/Thick Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Large Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Small Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Medium Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Large Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box A" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box B" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Padded Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Parcel Select Ground Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Parcel Select Ground Large Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Parcel Select Ground Oversized Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Media Mail Package" to be greater than $0.01

    Then Expect Grid Pounds to be 0
    Then Expect Grid Ounces to be 0
    Then Expect Grid Weight to be 0 lbs. 0 oz.
