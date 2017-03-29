Feature: WebReg Profile page validation theme_1632

  Background:
    Given I launched default browser

  @profile_page_ui_validation
  Scenario:
    Then navigate to WebReg page
    Then verify Stamps logo exists in navigation bar
    Then verify USPS logo exists on navigation bar
    Then verify bread crumbs should contain
    |Profile|
    |Membership|
    |Choose Supplies|
   #Then verify bread crumb exist Membership
   # Then verify bread crumb exist Choose Supplies
    Then verify Profile page header is Sign up for a new account
    Then verify Email textbox exists on profile page
    Then verify USERNAME textbox exists on the page
    Then verify PASSWORD textbox exists on the page
    Then verify RE-TYPE PASSWORD exists on the page
    Then verify values in dropdown for HOW WILL YOU USE STAMPS.COM?
    Then How will you use Stamps.com drop-down includes Business use .. blah blah blah
    Then How will you use Stamps.com drop-down includes ECommerce use .. blah blah blah
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

