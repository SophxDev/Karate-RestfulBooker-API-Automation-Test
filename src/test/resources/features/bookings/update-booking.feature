Feature: Update a exist booking in Restful Booker

  Background:
    * url baseUrl
    * def bookingPayLoad = read('classpath:data/create-booking.json')

  Scenario: Succesfully update a booking
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
        "firstname": "JaquelineUpdated",
        "lastname": "EspinoUpdated",
        "totalprice": 200,
        "depositpaid": false,
        "bookingdates":
        {
          "checkin": "2023-02-01",
          "checkout": "2023-02-10"
        },
        "additionalneeds": "Lunch"
      }
      """

    Given path '/booking', bookingId
    #Especificamente Api Restful Booker usa autenticacion antigua basada en Cookie
    #Si no se usa se recibe 403 forbidden
    And header cookie = 'token=' + token
    And request updatePayload
    When method put
    Then status 200
    And match response.firstname == "JaquelineUpdated"
    And match response.lastname == "EspinoUpdated"
    And match response.totalprice == 200