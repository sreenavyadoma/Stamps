Feature: Mail Shipping Label - 5 ½” x 8 ½” - PM Regional Rate Box A



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_5x8_pm_regional_box_a
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM Regional Rate Box A

    Then select Print On Shipping Label - 5 x 8 on Print form

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then on Print form, select service Priority Mail Regional Rate Box A
    Then on Print form, select left side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out