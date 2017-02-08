Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_fsa_cp72_paper_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address
      | name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then on Order Details form, set Weight to 1 lb 2 oz
    Then on Order Details form, select service MM Package

    Then on Customs form, Open Modal
    Then on Customs form, set Package Contents to Other
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 25, Made In United States, Tariff 10
    Then on Customs form, set More Info to "random"
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button

    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select right-side label
    Then in Print modal, expect right-side label selected
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Sign out
