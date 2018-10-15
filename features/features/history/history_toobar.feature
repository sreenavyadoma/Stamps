Feature:  History Toolbar

  Background:
    Given Start test driver

  @history_filter_panel
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then select row 1 on history grid
    Then click refund button on history toolbar
    Then expect refund modal on history is present
    Then close refund modal on history

    Then click schedule pickup button on history toolbar
    Then click all eligible packages button on history toolbar schedule pickup
    Then expect schedule pickup on history is present
    Then close schedule pickup modal on history
    Then click selected packages button on history toolbar schedule pickup
    Then expect schedule pickup on history is present
    Then close schedule pickup modal on history
    Then click manage pickups button on history toolbar schedule pickup
    Then expect manage pickups on history is present
    Then close manage pickups modal on history

    Then click create scan form button on history toolbar
    Then click all eligible packages button on history toolbar create scan form
    Then expect scan form on history is present
    Then close scan form modal on history
    Then click selected packages button on history toolbar create scan form
    Then expect scan form on history is present
    Then close scan form modal on history
    Then click reprint scan form button on history toolbar create scan form
    Then expect reprint scan form on history is present

    Then click create return label button on history toolbar
