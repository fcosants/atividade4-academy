Feature: Retornar Usuario 
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Scenario: Retornar usuario por id
        Given url baseUrl
        And path "users", "5c085afe-e218-4d3e-ba11-812008a4d940"
        When method get
        Then status 200

    Scenario: Retornar um id com usuário não localizado.
        Given url baseUrl
        And path "users", "65137afa-4368-47d6-884e-68b47139397a"
        When method get
        Then status 404

    