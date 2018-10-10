Feature:  Contacts BVT - Contacts Pagination

  Background:
    Given Start test driver

@sdc_contacts_pagination
Scenario: Contacts BVT Scenario 1: Contacts Pagination
    Then sign-in to orders
    Then navigate to Contacts
	# perpage : 100
    Then set per page drop down of pagination on contacts toolbar to 100
    Then expect contacts on contacts grid is reflected according to the selected pagination
    # perpage : 250
    Then set per page drop down of pagination on contacts toolbar to 250
    Then expect contacts on contacts grid is reflected according to the selected pagination
    # perpage : 500
    Then set per page drop down of pagination on contacts toolbar to 500
    Then expect contacts on contacts grid is reflected according to the selected pagination

