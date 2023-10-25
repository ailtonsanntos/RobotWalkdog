*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Library    Browser

*** Test Cases ***
Deve poder cadastrar um novo dog walker

    ${name}               Set Variable    Ailton Santos
    ${email}              Set Variable    ailton@gmail.com
    ${cpf}                Set Variable    69128227115                       
    ${cep}                Set Variable    01137010
    ${addressStreet}      Set Variable    Rua Norma Pieruccini Giannotti
    ${addressDistrict}    Set Variable    Barra Funda
    ${addressCityUf}      Set Variable    São Paulo/SP
    ${addressNumber}      Set Variable    111
    ${addressDetails}     Set Variable    Aparto 04

    New Browser    browser=chromium                     headless=False
    New Page       https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    500
    Get Text                   form h1    equal      Faça seu cadastro

    Fill Text    css=input[name=name]     ${name}
    Fill Text    css=input[name=email]    ${email}
    Fill Text    css=input[name=cpf]      ${cpf}
    Fill Text    css=input[name=cep]      ${cep}

    Click    css=input[type=button][value$=CEP]

    Get Property    css=input[name=addressStreet]      value    equal    ${addressStreet} 
    Get Property    css=input[name=addressDistrict]    value    equal    ${addressDistrict} 
    Get Property    css=input[name=addressCityUf]      value    equal    ${addressCityUf} 

    Fill Text    css=input[name=addressNumber]     ${addressNumber}
    Fill Text    css=input[name=addressDetails]    ${addressDetails}

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/toretto.jpg

    Click    css=.button-register

    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text                   css=.swal2-html-container    equal      Recebemos o seu cadastro e em breve retornaremos o contato.

