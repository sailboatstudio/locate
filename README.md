# Locate


### DB

- users

  - firstName
  - lastName
  - username
  - email
  - password
  - phoneNumber
  - bio
  - checkIns *[]CheckIn


- checkins
  - id
  - createdAt
  - updatedAt
  - locationName
  - lat
  - long
  - streetAddressOne
  - streetAddressTwo
  - streetAddressThree
  - city
  - province
  - postalCode
  - country
  - isActive (bool)
  - user *User