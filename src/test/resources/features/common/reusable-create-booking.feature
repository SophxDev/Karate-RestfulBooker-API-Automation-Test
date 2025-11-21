Feature: Reusable create booking feature

  Background:
    * url baseUrl
    * def payload = read('classpath:data/create-booking.json')

  Scenario:
    Given path '/booking'
    And request payload
    When method post
    Then status 200
    * def id = response.bookingid
    * def booking = response.booking