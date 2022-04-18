Feature: Criar Usuario
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Variável de url, nome e e-mail 
        * def payload = {name : "Chico", email : "chico@g.com"}
        * def baseUrl = "https://crud-api-academy.herokuapp.com/api/v1"
         Given url baseUrl
         And path "users"
        
        Scenario: Registrar Usuario
            And request payload
            When method post
            Then status 201
            And match response contains { name:"Chico", email: "chico@g.com" }

        Scenario: Registrar usuário com email inválido
            And request {name : "Juma", email : "chicog.com"}
            When method post
            Then status 400

        Scenario: Registrar um usuário com e-mail já utilizado
            And request {name : "kksh", email : "chico@g.com"}
            When method post
            Then status 422
            And match response contains { error: "User already exists." }

        Scenario: Cadastrar um nome com mais de 100 caracteres
            And request {name : chicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochico, email: "chico@g.com"}
            When method post
            Then status 400

        Scenario: Cadastrar um e-mail com mais de 60 caracteres
            And request {name : abc, email: "chicochicochicochicochicochicochicochicochicochicochicochico@g.com"}
            When method post
            Then status 400