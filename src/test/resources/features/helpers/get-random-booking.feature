Feature: Get random booking

  Scenario:
    # Uso del endpoint que devuelve todos los boking IDs
    Given url baseUrl + '/booking'
    When method get
    Then status 200

    # Tomar id random de la lista
    * def list = response
    * def bookingId = list[0].bookingid