Feature: Mail Shipping Label - 5 ½” x 8 ½” - PM Medium Flat Rate Box



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_5x8_pm_medium_box
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM Medium Flat Rate Box

    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, select service Priority Mail Medium Flat Rate Box
    Then on Shipping Label Print form, select left side starting label
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out