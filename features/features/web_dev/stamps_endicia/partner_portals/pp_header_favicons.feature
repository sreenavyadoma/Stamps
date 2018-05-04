@pp_header_favicons
Feature: PP-MVP: Header and Favicons

  Background:
    Given PP: A valid user is signed into Partner Portal

  Scenario: PP: Header and Favicons Validation
    #Then PP: set window to large viewport
    Then PP: expect global  header exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on Stamps Endicia Partner Portal logo
