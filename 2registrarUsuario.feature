Feature: Criar Usuario
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Variável de url, nome e e-mail 
        * def payload = {name : "Luffy", email : "luffy@g.com"}
         Given url baseUrl
         And path "users"
        
        Scenario: Registrar Usuario
            And request payload
            When method post
            Then status 201
            And match response contains { name:"Luffy", email: "luffy@g.com" }
            * def FcoSantos = response.id
            * def Francisco = call read("hook.feature@deletar")

        Scenario: Registrar usuário com email inválido
            And request {name : "Juma", email : "chicog.com"}
            When method post
            Then status 400

        Scenario: Registrar um usuário com e-mail já utilizado
           * def baseId = call read ("hook.feature@registrar")
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