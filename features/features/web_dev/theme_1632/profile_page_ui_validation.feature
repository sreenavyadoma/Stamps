Feature: WebReg Profile page validation theme_1632

  Background:
    Given I launched default browser

  @profile_page_ui_validation
  Scenario:
    Then navigate to WebReg page
    Then expect WebReg navigationbar Stamps logo exists
    Then expect WebReg navigation bar USPS logo exists
    Then expect WebReg Profile bread crumbs to contain Profile
    Then expect WebReg Profile bread crumbs to contain Membership
    Then expect WebReg Profile bread crumbs to contain Choose Supplies
    Then expect WebReg Profile header is Sign up for a new account
    Then expect WebReg Profile Email textbox exists
    Then expect WebReg Profile Email textbox exists
    Then expect WebReg Profile textbox exists
    Then expect WebReg Profile PASSWORD textbox exists
    Then verify RE-TYPE PASSWORD exists on the page

    Then verify values in dropdown for HOW WILL YOU USE STAMPS.COM should contain
    |Business Use - Mostly mailing (letters/postcards/flats|
    |Business/Ecommerce Use - Mostly shipping packages     |
    |Business Use - Both mailing and shipping|
    |Individual/Home Office                  |

    Then expect WebReg Profile Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
    Then expect WebReg Profile Usage Type list of values to contain Business/Ecommerce Use - Mostly shipping packages
    Then expect WebReg Profile Usage Type list of values to contain Business Use - Both mailing and shipping
    Then expect WebReg Profile Usage Type list of values to contain Individual/Home Office

    Then verify PROMO CODE field textbox exists on the page
    Then verify CONTINUE button exists on the page
    Then verify content under <h3>Why do I need to create an account?</h3> exists on the page
    Then verify content under<h3>Money-saving offers and new products</h3>
    Then verify Money-saving offers and new products checkbox is checkmarked on the page
    Then verify CONTINUE button exists on the page
    Then verify Privacy Policy link exists on the page and is clickable
    Then verify copyright link exists on the page and is clickable
    Then verify Norton logo exists on the page
    Then TRUSTe logo exists on the page
    Then verify LIVE chat button exists on the page

