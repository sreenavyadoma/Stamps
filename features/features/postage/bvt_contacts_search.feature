Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Contacts Search

    Then Print Postage - Select Print On <media>
    Then Shipping Label: Set Print Postage Ship-From to <address>
    Then Shipping Label: Open Contacts modal
    Then Contacts: Search by group - <name>
    Then Contacts: Search by cost code - <code>
    Then Contacts: Click Cancel
    Then Sign out