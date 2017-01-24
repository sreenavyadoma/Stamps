Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given A user is signed in to Orders

  @print_layout_fsa_cp72_paper_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address
      | name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then On Order Details form, set Weight to 1 lb 2 oz
    Then On Order Details form, select service MM Package

    Then On Customs form, Open Modal
    Then On Customs form, set Package Contents to Other
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 25, Origin United States, Tariff 10
    Then On Customs form, set More Info to "random"
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
