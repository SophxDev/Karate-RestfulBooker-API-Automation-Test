Feature: Get booking by ID

  Background:
    * url baseUrl

  Scenario: Succesfully get an existing booking
  #Creacion de un booking real
    * def create = call read('classpath:features/helpers/create-and-return-id.feature')
    * def bookingId = create.bookingId

    #Get al booking real
    Given path '/booking', bookingId
    When method get
    Then status 200

    #Validaciones simples:
    And match response.firstname != null
    And match response.lastname != null
    And match response.totalprice != null

    #Validaciones avanzadas por schema
    And match response == read('classpath:features/responses/booking-success-schema.json')
