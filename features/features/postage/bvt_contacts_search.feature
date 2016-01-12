Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Contacts Search

    Then Select Print Postage Print On <media>
    Then Set Print Postage Ship-From to <address>
    Then Open Contacts modal
    Then Search Contacts by group - <name>
    Then Search Contacts by cost code - <code>
    Then Cancel Contacts modal
    Then Sign out