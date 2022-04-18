Feature: Consultar usuários
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

    Scenario: Listar usuarios
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        When method get
        Then status 200
        And match response == "#array"
    