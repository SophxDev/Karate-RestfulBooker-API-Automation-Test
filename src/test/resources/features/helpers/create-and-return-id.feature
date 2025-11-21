Feature: Helper - create booking and return only the ID

  Scenario:

    * def result = call read('classpath:features/common/reusable-create-booking.feature')
    * def bookingId = result.id

