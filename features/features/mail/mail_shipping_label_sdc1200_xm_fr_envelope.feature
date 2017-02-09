Feature: Mail Shipping Label - SDC-1200 - XM Flat Rate Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_sdc1200_xm_fr_envelope
  Scenario: Shipping Label - SDC-1200 - XM Flat Rate Envelope

    Then on Shipping Label Print form, select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, select service Priority Mail Express Flat Rate Envelope
    Then on Shipping Label Print form, select left side starting label
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out