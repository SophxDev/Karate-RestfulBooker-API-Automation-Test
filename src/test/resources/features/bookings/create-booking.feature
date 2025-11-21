Feature: Create a new booking in Restful Booker

  Background:
    * url baseUrl
    # Carga de JSON como un objeto karate:
    #* def bookingPayLoad = read ("classpath:features/bookings")
    * def bookingPayLoad = read("classpath:data/create-booking.json")
  Scenario: Successfully create a booking
    Given path '/booking'
    #Envia el JSON como el cuerpo del POST:
    And request bookingPayLoad
    When method post
    Then status 200
    And match response.bookingid != null
    And match response.booking.firstname == bookingPayLoad.firstname
    #Extraccion del Id para el sig. modulo e2e
    * def bookingId = response.bookingid