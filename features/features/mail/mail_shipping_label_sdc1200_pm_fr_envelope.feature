Feature: Mail Shipping Label - SDC-1200 - PM FR Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_sdc1200_pm_fr_envelope
  Scenario: Shipping Label - SDC-1200 - PM FR Envelope

    Then Mail: Select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Priority Mail Flat Rate Envelope
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out