Feature: Partial update for a exist booking in Restfull Booker

  Background:

    * url baseUrl
    * def bookingPayload = read('classpath:data/create-booking.json')

  Scenario: Successfully partial update a booking
    # Generar token
    * def auth = call read('classpath:features/common/reusable-auth.feature')
    * def token = auth.token

    # Crear booking real
    * def created = call read('classpath:features/helpers/create-and-return-id.feature')
    * def bookingId = created.bookingId

    #Construir la actualización (Aqui se colocan los datos a modificar)
    * def updatePayLoad =
      """
      {
        "firstname": "JaquelineParcialUpdate",
        "additionalneeds": "Late checkout"
      }
      """

    Given path '/booking', bookingId
    #Especificamente Api Restful Booker usa autenticacion antigua basada en Cookie
    #Si no se usa se recibe 403 forbidden
    And header cookie = 'token=' + token
    And request partialUpdate
    When method patch
    Then status 200
    And match response.firstname == "JaquelineParcialUpdate"
    And match response.additionalneeds == "Late checkout"

    # Validar que el resto no desaparecio
    And match response contains {lastname: '#string'}
    And match response contains {totalprice: '#number'}
    And match response.bookingdates == '#object'