Feature: Generate valid auth token for Restful Booker

  Background:
    #Base url traida desde -> Karate-config
    * url baseUrl

    Scenario: Generate valid auth token
      Given path '/auth'
      And request
      """
      {
        "username": "admin",
        "password": "password123"
      }
      """
      When method post
      Then status 200
      And match response.token != null
      * def token = response.token