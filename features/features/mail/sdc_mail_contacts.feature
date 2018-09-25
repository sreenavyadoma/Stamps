Feature:  Mail Extra Services

  Background:
    Given Start test driver

  @reference_number_from_contacts_list
  Scenario: WEBAPPS-10781 Reference # field (Use Reference # from Contact List)
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then show advanced options
    Then set print form reference number asdf
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then expect search contacts filter panel all contacts count is > 1
    Then expect search contacts filter panel selected count is 0
    Then check search contacts grid name Person 1
    Then expect search contacts filter panel selected count is 1
    Then check search contacts grid name Person 2
    Then expect search contacts filter panel selected count is 2
    Then expect select button count on search contacts toolbar is 2
    # Filter panel
    Then click selected tab on search contacts modal

    Then click select button on search contacts modal

    Then expect selected contacts count is 2
    Then expect multiple contacts view include Person 1, Person 2

    Then expect use reference # from contact list on print form is present
    Then expect use reference # from contact list on print form is unchecked
    Then check use reference # from contact list on print form
    Then expect use reference # from contact list on print form is checked
    Then uncheck use reference # from contact list on print form
    Then expect use reference # from contact list on print form is unchecked
    Then check use reference # from contact list on print form
    Then expect use reference # from contact list on print form is checked
    Then expect placeholder for disabled reference # on print form is Use Reference # from Contact List

    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None

    Then expect use cost code from contact list on print form is present
    Then expect use cost code from contact list on print form is unchecked
    Then check use cost code from contact list on print form
    Then expect use cost code from contact list on print form is checked
    Then uncheck use cost code from contact list on print form
    Then expect use cost code from contact list on print form is unchecked
    Then check use cost code from contact list on print form
    Then expect use cost code from contact list on print form is checked
    Then expect placeholder for disabled cost code on print form is Use Cost Code from Contact List