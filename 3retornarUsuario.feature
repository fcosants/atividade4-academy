Feature: Retornar Usuario 
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Scenario: Retornar usuario por id
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", "84db798a-b79e-45ca-80b1-d2de45768b40"
        When method get
        Then status 200
        And match response contains {id: "84db798a-b79e-45ca-80b1-d2de45768b40"}

    Scenario: Retornar um id com usuário não localizado.
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", "65137afa-4368-47d6-884e-68b47139397a"
        When method get
        Then status 404

    