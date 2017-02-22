Feature: Mail Shipping Label - 8 ½” x 11” Paper - PM Small Flat Rate Box



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_8x11_pm_small_box
  Scenario: Shipping Label - 8 ½” x 11” Paper - PM Small Flat Rate Box

    Then select Print On Shipping Label - 8 ½" x 11" Paper

    Then set Print form Mail From to default
    Then set Label form Mail To Country to United States
    Then on Label form, set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Small Flat Rate Box
    Then on Print form, select left side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out