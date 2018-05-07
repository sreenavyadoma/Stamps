@pp_header_favicons
Feature: PP-MVP: Header and Favicons

  Background:
    Given PP: A valid user is signed into Partner Portal
  @pp_header_favicons_browser

  Scenario: PP: Header and Favicons Validation For Browser
    Then PP: set window to large viewport
    Then PP: expect global  header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect user is redirected to the Dashboard page

    Then PP: set window to medium viewport
    Then PP: expect global  header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect user is redirected to the Dashboard page

  @pp_header_favicons_mobile
  Scenario: PP: Header and Favicons Validation For Mobile
    #verify all content and fields are present
    Then PP: set window to small viewport
    Then PP: expect global  header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button exists

    Then PP: click on hamburger button
    Then PP: expect Dashboard on left panel exists
    Then PP: expect left panel to expand for mobile
    Then PP: expect X button exists
    Then PP: expect left panel to collapse for mobile
    Then PP: expect hamburger button exists

    Then PP: click on global header
    Then PP: expect user is redirected to the Dashboard page