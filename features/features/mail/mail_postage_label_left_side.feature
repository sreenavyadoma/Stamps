Feature: Mail Shipping Label - Left Side

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_label_left_side
  Scenario: Left Side Shipping Label -  SDC-1200

    Then select Print On Shipping Label - SDC-1200 Paper
    Then set Print form Mail From to default
    Then set Print form Mail To Country to United States
    Then set Print form Mail To random address in zone 1
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Package
    Then select Print form service PM Package
    Then on Print form, select left side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out
