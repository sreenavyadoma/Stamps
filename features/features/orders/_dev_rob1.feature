Feature: Test Development
  Background:
    Given I am signed in to Orders

  @rob_dev_printer
  Scenario:
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Ship Date to today
    # factory selection sends printout to PDF Factory.  You will need to rename your PDF Factory printer to factory.
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    # Sends your printouts to Kyocera printer next to the post office.
    Then Print: Set Printer to "Kyocera"
    # Sends your printouts to Brother MFC-7840W Printer
    Then Print: Set Printer to "Brother"
    # Sends your printouts to EPSON printer in eva's cube.
    Then Print: Set Printer to "EPSON"
    # Sends your printouts to Officejet Pro in elie's cube.
    Then Print: Set Printer to "HP Officejet Pro 8600"
    Then Print: Print

  Scenario:
    Then Toolbar: Add
    Then Details: Set Ship-To Country to Canada
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-From to default

    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to ambiguous address
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Company Name | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    Then Select row 2 from Exact Address Not Found module
    Then Details: Select Service Priority Mail Package
    Then Grid: Expect Recipient to be Joseph Balancio
    Then Grid: Expect Company to be Company Name
    Then Grid: Expect City to be San Francisco
    Then Grid: Expect State to be CA
    Then Grid: Expect Zip to be 94102

    Then Details: Set Ship-To to Random Address Between Zone 1 through 4

    Then Details: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Toolbar: Add
    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Toolbar: Add
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Toolbar: Add
    Then Details: Set Ship-To address to San
    Then Toolbar: Add
    Then Details: Set Ship-To address to San

  Scenario:
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Details: Expect Service to be "Priority Mail Package"
    Then Details: Expect Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Details: Expect Service Tooltip for "Priority Mail Package" to include "Priority Mail Package,Ship up to 70 lbs. using any box with pricing that varies by weight and distance,The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com."

    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Tracking to be "USPS Tracking"
    Then Details: Set Tracking to "Signature Required"
    Then Details: Expect Tracking to be "Signature Required"

    Then Details: Select Service Priority Mail Package
    Then Details: Expect Service to be "Priority Mail Package"
    Then Details: Expect Tracking to be "Signature Required"

    Then Details: Select Service Priority Mail Package
    Then Details: Expect Service to be "Priority Mail Package"
    Then Details: Select Service Priority Mail Large Package
    Then Details: Expect Service to be "Priority Mail Large Package"

    Then Details: Expect Service Cost inline price for "Priority Mail Large/Thick Envelope" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Large Package" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Flat Rate Envelope" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Small Flat Rate Box" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Medium Flat Rate Box" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Large Flat Rate Box" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Regional Rate Box A" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Regional Rate Box B" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Package" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Flat Rate Envelope" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Padded Flat Rate Envelope" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Parcel Select Ground Package" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Parcel Select Ground Large Package" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Parcel Select Ground Oversized Package" to be greater than $0.01
    Then Details: Expect Service Cost inline price for "Media Mail Package" to be greater than $0.01

    Then Grid: Expect Pounds to be 0
    Then Grid: Expect Ounces to be 0
    Then Grid: Expect Weight to be 0 lbs. 0 oz.
