Feature:  Mail Contacts

  Background:
    Given Start test driver

  @contacts_list_reference_number
  Scenario: ORDERSAUTO-5299 Batch Print - Use Reference # from Contact List
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click print form mail to link