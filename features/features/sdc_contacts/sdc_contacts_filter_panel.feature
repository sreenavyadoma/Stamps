Feature:  Contacts BVT - Contacts Filter Panel

  Background:
    Given Start test driver

  @sdc_contacts_left_panel_hide_show
  Scenario: Contacts Filter Panel Hide/Show: Collapse and expand contacts Left navigation Filter Panel
    Then sign-in to orders
    Then navigate to contacts
    Then on left navigation panel click on collapse button
    Then expand collapsed left navigation filter panel
