Feature: Mail Shipping Label - 5 ½” x 8 ½” - PM Large Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_5x8_pm_large_package
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM Large Package

    Then select Print On Shipping Label - 5 ½" x 8 ½"

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Large Package
    Then on Print form, select left side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out