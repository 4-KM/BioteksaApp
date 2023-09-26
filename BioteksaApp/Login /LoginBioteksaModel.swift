//
//  LoginModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    let data: LoginResponseData
}


struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}


/*
var  coleccionesDeBioteksa :  [String]
coleccionesDeBioteksa =  [{
    
    "info": {
        "_postman_id": "a6746c9c-8d1a-443d-932d-83ef04683d57",
        "name": "Realtorio Calculadora",
        "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
        "_exporter_id": "9700213"
    },
    "item": [
        {
            "name": "Auth",
            "item": [
                {
                    "name": "Login",
                    "event": [
                        {
                            "listen": "test",
                            "script": {
                                "exec": [
                                    "var jsonData = pm.response.json();",
                                    "",
                                    "pm.environment.set(\"token\", jsonData[\"token\"]);",
                                    ""
                                ],
                                "type": "text/javascript"
                            }
                        }
                    ],
                    "request": {
                        "method": "POST",
                        "header": [
                            {
                                "key": "Content-Type",
                                "value": "application/json"
                            }
                        ],
                        "body": {
                            "mode": "raw",
                            "raw": "{\n\t\"email\": \"william3@gmail.com\",\n\t\"password\": \"76767657\"\n}                               "
                        },
                        "url": {
                            "raw": "{{url}}/api/auth/login",
                            "host": [
                                "{{url}}"
                            ],
                            "path": [
                                "api",
                                "auth",
                                "login"
                            ]
                        }
                    },
                    "response": []
                }
            ]
        },
        {
            "name": "API",
            "item": [
                {
                    "name": "Calculate",
                    "request": {
                        "method": "POST",
                        "header": [
                            {
                                "key": "Content-Type",
                                "name": "Content-Type",
                                "value": "application/json"
                            }
                        ],
                        "body": {
                            "mode": "raw",
                            "raw": "{\n\t\"required\":\n\t{\n\t\t\"1\": 7.35,\n\t\t\"2\": 10.92,\n\t\t\"3\": 12.72,\n\t\t\"4\": 6.25,\n\t\t\"5\": 3.35,\n\t\t\"6\": 4\n\t}\n}"
                        },
                        "url": {
                            "raw": "{{url}}calculator/calculate",
                            "host": [
                                "{{url}}calculator"
                            ],
                            "path": [
                                "calculate"
                            ]
                        }
                    },
                    "response": []
                },
                {
                    "name": "Set configuration Vars",
                    "request": {
                        "method": "POST",
                        "header": [
                            {
                                "key": "Content-Type",
                                "name": "Content-Type",
                                "value": "application/json"
                            }
                        ],
                        "body": {
                            "mode": "raw",
                            "raw": "{\n\t\"bioteksa1\": \n\t{\n\t\t\"1\": \n\t\t{\n\t\t\t\"1\": 125,\n\t\t\t\"2\": 0,\n\t\t\t\"3\": 212.5,\n\t\t\t\"4\": 0,\n\t\t\t\"5\": 0,\n\t\t\t\"6\": 0\n\t\t},\n\t\t\"2\": \n\t\t{\n\t\t\t\"1\": 504.1,\n\t\t\t\"2\": 0,\n\t\t\t\"3\": 0,\n\t\t\t\"4\": 0,\n\t\t\t\"5\": 0,\n\t\t\t\"6\": 0\n\t\t},\n\t\t\"3\": \n\t\t{\n\t\t\t\"1\": 0,\n\t\t\t\"2\": 469.42,\n\t\t\t\"3\": 37.1,\n\t\t\t\"4\": 0,\n\t\t\t\"5\": 0,\n\t\t\t\"6\": 0\n\t\t},\n\t\t\"4\": \n\t\t{\n\t\t\t\"1\": 154,\n\t\t\t\"2\": 98,\n\t\t\t\"3\": 252,\n\t\t\t\"4\": 0,\n\t\t\t\"5\": 0,\n\t\t\t\"6\": 0\n\t\t},\n\t\t\"5\": \n\t\t{\n\t\t\t\"1\": 221,\n\t\t\t\"2\": 0,\n\t\t\t\"3\": 45.5,\n\t\t\t\"4\": 169,\n\t\t\t\"5\": 0,\n\t\t\t\"6\": 0\n\t\t},\n\t\t\"6\": \n\t\t{\n\t\t\t\"1\": 0,\n\t\t\t\"2\": 22,\n\t\t\t\"3\": 55,\n\t\t\t\"4\": 0,\n\t\t\t\"5\": 19.8,\n\t\t\t\"6\": 0\n\t\t},\n\t\t\"7\": \n\t\t{\n\t\t\t\"1\": 0,\n\t\t\t\"2\": 0,\n\t\t\t\"3\": 0,\n\t\t\t\"4\": 0,\n\t\t\t\"5\": 0,\n\t\t\t\"6\": 375\n\t\t}\n\t},\n\t\"convertion1\":\n\t{\n\t\t\"1\":\n\t\t{\n\t\t\t\"soluble\": 1,\n\t\t\t\"bioteksa\": 0.6\n\t\t},\n\t\t\"2\":\n\t\t{\n\t\t\t\"soluble\": 1,\n\t\t\t\"bioteksa\": 0.25\n\t\t},\n\t\t\"3\":\n\t\t{\n\t\t\t\"soluble\": 1,\n\t\t\t\"bioteksa\": 0.15\n\t\t},\n\t\t\"4\":\n\t\t{\n\t\t\t\"soluble\": 1,\n\t\t\t\"bioteksa\": 0.3\n\t\t},\n\t\t\"5\":\n\t\t{\n\t\t\t\"soluble\": 1,\n\t\t\t\"bioteksa\": 0.02\n\t\t},\n\t\t\"6\":\n\t\t{\n\t\t\t\"soluble\": 1,\n\t\t\t\"bioteksa\": 0.1\n\t\t}\n\t},\n\t \"nitrico\": {\n        \"peso_especifico\": {\n            \"bioteksa\": 1,\n            \"greenHow\": 2\n        },\n        \"densidad\": {\n            \"bioteksa\": 3,\n            \"greenHow\": 4\n        },\n        \"riqueza\": {\n            \"bioteksa\": 5,\n            \"greenHow\": 6\n        }\n    },\n    \"sulfurico\": {\n        \"peso_especifico\": {\n            \"bioteksa\": 7,\n            \"greenHow\": 8\n        },\n        \"densidad\": {\n            \"bioteksa\": 9,\n            \"greenHow\": 10\n        },\n        \"riqueza\": {\n            \"bioteksa\": 11,\n            \"greenHow\": 12\n        }\n    },\n    \"fosforico\": {\n        \"peso_especifico\": {\n            \"bioteksa\": 7,\n            \"greenHow\": 8\n        },\n        \"densidad\": {\n            \"bioteksa\": 9,\n            \"greenHow\": 10\n        },\n        \"riqueza\": {\n            \"bioteksa\": 11,\n            \"greenHow\": 12\n        }\n    }\n}"
                        },
                        "url": {
                            "raw": "{{url}}calculator/configuration",
                            "host": [
                                "{{url}}calculator"
                            ],
                            "path": [
                                "configuration"
                            ]
                        }
                    },
                    "response": []
                },
                {
                    "name": "Get configuration Vars",
                    "request": {
                        "method": "GET",
                        "header": [],
                        "url": {
                            "raw": "{{url}}calculator/configuration",
                            "host": [
                                "{{url}}calculator"
                            ],
                            "path": [
                                "configuration"
                            ]
                        }
                    },
                    "response": []
                }
            ],
            "auth": {
                "type": "bearer",
                "bearer": [
                    {
                        "key": "token",
                        "value": "{{token}}",
                        "type": "string"
                    }
                ]
            },
            "event": [
                {
                    "listen": "prerequest",
                    "script": {
                        "type": "text/javascript",
                        "exec": [
                            ""
                        ]
                    }
                },
                {
                    "listen": "test",
                    "script": {
                        "type": "text/javascript",
                        "exec": [
                            ""
                        ]
                    }
                }
            ]
        }
    ],
    "event": [
        {
            "listen": "prerequest",
            "script": {
                "type": "text/javascript",
                "exec": [
                    ""
                ]
            }
        },
        {
            "listen": "test",
            "script": {
                "type": "text/javascript",
                "exec": [
                    ""
                ]
            }
        }
    ],
    "variable": [
        {
            "key": "url[Local]",
            "value": "localhost:8000/api/"
        },
        {
            "key": "url[KM]",
            "value": "http://kmabas.space/rt_calc/public/api/"
        },
        {
            "key": "url[Glezco]",
            "value": "http://bioteksa.equiposglezco.com/api/"
        }
    ]
}
 ]*/
