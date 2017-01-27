Feature: User Prints 1 FPO CN22 label on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_fpo_cn22_paper_right
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then On Order Details form, set Weight to 2 lb 1 oz
    Then On Order Details form, select service PSG Package
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select right-side label
    Then In Print modal, expect right-side label selected
    Then In Print modal, click Print button Sample
    Then In Print modal, click Print button
    Then Sign out
