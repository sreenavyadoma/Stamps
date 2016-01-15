Feature: Select All Print Ons and Services



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Select Print Media and Services

    Then Select Print Postage Print On Stamps
    Then Set Print Postage Form Service to "First-Class Mail Postcard"
    Then Set Print Postage Form Service to "First-Class Mail Envelope"
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"


    Then Select Print Postage Print On 8 ½” x 11” Paper
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"


    Then Select Print Postage Print On 4 ¼” x 6 ¾” Shipping Label
    Then Set Print Postage Form Service to "<string>"
    Then Set Print Postage Form Service to "<string>"

    Then Select Print Postage Print On Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”
    Then Select Print Postage Print On Shipping Label - 5 ½” x 8 ½”
    Then Select Print Postage Print On Envelope - #10, 4 ⅛” x 9 ½”
    Then Select Print Postage Print On Envelope - #9, 3 ⅞” x 8 ⅞”
    Then Select Print Postage Print On Envelope - #A9, 5 ¾” x 8 ¾”
    Then Select Print Postage Print On Envelope - #6, 3 ⅝” x 6 ½”
    Then Select Print Postage Print On Envelope - #A2, 4 ⅜” x 5 ¾”
    Then Select Print Postage Print On Envelope - #7, 3 ⅞” x 7 ½”
    Then Select Print Postage Print On Envelope - #11, 4 ½” x 10 ⅜”
    Then Select Print Postage Print On Envelope - #12, 4 ¾” x 11”
    Then Select Print Postage Print On Certified Mail Label - Stamps.com SDC-3610
    Then Select Print Postage Print On Certified Mail Label - Stamps.com SDC-3710
    Then Select Print Postage Print On Certified Mail Label - Stamps.com SDC-3910
    Then Select Print Postage Print On Certified Mail #11 Envelope - Stamps.com SDC-3810
    Then Select Print Postage Print On Roll - 4” x 6” Shipping Label
    Then Select Print Postage Print On Roll - 4 ⅛” x 6 ¼” Shipping Label



    Then Set Print Postage Ship-From to <address>
    Then Set Print Postage Form Ship-To address to
      | name              | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Ambiguous Address | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    #Then Set Print Postage Form Service to <service>
    Then Expect Print Postage Form Ship-To address to be <address>
    And Sign out

    #todo-eva
