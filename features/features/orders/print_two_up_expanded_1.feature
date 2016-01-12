Feature:  As a batch shipper, I want to be able to print multiple labels

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded @print_two_up_expanded_test
  Scenario: User Prints 1 FPO CN22 Label on 8.5x11 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set Order Details Service to "Priority Mail Regional Rate Box B"
    Then Set Order Details Weight to 2 lbs 1 oz
    Then Add Order Details Item 1 - Qty 1, ID random, Description random
    Then Add Order Details Item 2 - Qty 2, ID random, Description random
    Then Add Order Details Item 3 - Qty 3, ID random, Description random

    Then Delete Order Details Item 1
    Then Delete Order Details Item 2

    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Intl CP72, 1 Intl CN22 label on SDC-1200 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI Pkg-Flat-Env | SDC-1200  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | PMI FR Envelope | SDC-1200  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 2 Intl CN22 labels on 8.5x11 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Right Side 2 | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Order Details Service to "Priority Mail International Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side 1 | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Set Order Details Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Intl CP72, 2 Intl CN22 labels on 8.5x11 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI SFR Box | 8.5x11  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then Set Order Details Service to "Priority Mail International Small Flat Rate Box"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI MFR Box | 8.5x11  | random           | random           | random | random  | random      | Kenya | random  | random  |
    Then Set Order Details Service to "Priority Mail International Medium Flat Rate Box"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI SFR Box | 8.5x11  | random           | random           | random | random  | random      | Mexico | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Package"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME FR Envelope, 5.5x8.5, 26930 NE 152nd St., Duvall WA 98019-8316
    Then Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME LFR Envelope, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME PFR Envelope, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Box | 5.5x8.5  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then Set Order Details Service to "Priority Mail International Large Flat Rate Box"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI Pkg-Flat-Env | 5.5x8.5 | random           | random           | random | random  | random      | Turkey | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Package"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI FR Envelope | 5.5x8.5 | random           | random           | random | random  | random      | Argentina | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3
    Then Check Orders Grid row 4
    Then Check Orders Grid row 5
    Then Check Orders Grid row 6
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 3 Domestic labels on SDC-1200 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Med FR Box, SDC-1200, 530 K Street Unit 504, San Diego CA 92101-7060
    Then Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Lg FR Box, SDC-1200, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then Set Order Details Service to "Priority Mail Large Flat Rate Box"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM RR Box A, SDC-1200, 4937 79th St., Sacramento CA 95820-6213
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print Sample
    Then Print

    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set Order Details Ounces to 3
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print Sample
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Domestic label on 8.5x11 - left side

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Domestic label on SDC-1200 - right side

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    Then Set Order Details Insure For to $1.09
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 2 Domestic labels on 8.5x11 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 2 Domestic labels on 8.5x11 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Set Order Details Service to "Priority Mail Small Flat Rate Box"
    Then Set Order Details Ounces to 3
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - left side

    # 1 Domestic label 5 ½" x 8 ½"
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME MFR Box, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side

    # 1 Domestic label 5 ½" x 8 ½" right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Set Order Details Service to "Parcel Select Ground Package"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 2 Domestic labels on 5.5x8.5 - left side
    # 2 Domestic labels 5 ½" x 8 ½"
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PS Large Package, 5.5x8.5, 530 K Street Unit 504, San Diego CA 92101-7060
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PS Large Package, 5.5x8.5, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then Set Order Details Service to "Parcel Select Ground Oversized Package"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 2 Domestic labels on 5.5x8.5 - right side

    # 2 Domestic labels 5 ½" x 8 ½" right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Set Order Details Service to "Media Mail Package"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Large Package, 5.5x8.5 Right Side 1, 26930 NE 152nd St., Duvall WA 98019-8316
    Then Set Order Details Service to "Priority Mail Large Package"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 3 Domestic labels on 5.5x8.5 - left side

    # 3 Domestic labels 5 ½" x 8 ½"
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to FCM Lg Env-Flat, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Lg-Thick Env, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Set Order Details Service to "Priority Mail Large/Thick Envelope"
    Then Set Order Details Ounces to 1
    Then Set Order Details Length to 1
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to FCM Pkg-Thick Env, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Intl CP72 label on 5.5x8.5 - left side
    # 1 CP72 label 5 ½" x 8 ½"
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | China | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Intl CP72 label on 5.5x8.5 - right side
    # 1 CP72 label 5 ½" x 8 ½" right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 1 Intl CN22, 1 Intl CP72 label on SDC-1200 - left side

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | PMEI MFR Box | SDC-1200  | 234 Laurier Avenue West  | random     | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Letter | SDC-1200  | random           | random           | random | random  | random      | Costa Rica | random  | random  |
    Then Set Order Details Service to "First-Class Mail International Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out

  @print_two_up_expanded
  Scenario: User Prints 2 Intl CN22 labels on 5.5x8.5 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Lg Env-Flat | 5.5x8.5 Right Side 2 | random           | random           | random | random  | random      | Croatia | random  | random  |
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Pkg-Thick Env | 5.5x8.5 Right Side 1 | random           | random           | random | random  | random      | India | random  | random  |
    Then Set Order Details Service to "First-Class Mail International Package/Thick Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print


    Then Sign out






#todo-rob