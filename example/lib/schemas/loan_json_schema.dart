const loanJsonSchemaStr = r'''
{
    "type": "object",
    "$schema": "http://json-schema.org/draft-07/schema#",
    "required": [
        "loanAmount",
        "loanTerm"
    ],
    "properties": {
        "status": {
            "enum": [
                "new",
                "in_review",
                "approved",
                "rejected",
                "canceled"
            ],
            "type": "string",
            "title": "Статус заявки",
            "description": "Статус заявки"
        },
        "Address": {
            "type": "object",
            "required": [
                "registrationAddress"
            ],
            "properties": {
                "residentialAddress": {
                    "type": "string",
                    "title": "Адрес Проживания",
                    "description": "Адрес Проживания"
                },
                "sameAsRegistration": {
                    "type": "boolean",
                    "title": "Совпадает с адресом регистрации",
                    "description": "Совпадает с адресом регистрации"
                },
                "registrationAddress": {
                    "type": "string",
                    "title": "Адрес регистрации",
                    "description": "Адрес регистрации"
                }
            }
        },
        "Consents": {
            "type": "object",
            "required": [
                "personalDataProcessing",
                "creditBureauCheck"
            ],
            "properties": {
                "creditBureauCheck": {
                    "type": "boolean",
                    "title": "Согласие на проверку кредитной истории",
                    "description": "Согласие на проверку кредитной истории"
                },
                "personalDataProcessing": {
                    "type": "boolean",
                    "title": "Согласие на обработку персональных данных",
                    "description": "Согласие на обработку персональных данных"
                },
                "marketingCommunications": {
                    "type": "boolean",
                    "title": "Согласие на маркетинговые коммуникации",
                    "default": true,
                    "description": "Согласие на маркетинговые коммуникации"
                }
            }
        },
        "currency": {
            "enum": [
                "RUB",
                "YAN"
            ],
            "type": "string",
            "title": "Валюта",
            "default": "RUB",
            "description": "Валюта"
        },
        "loanTerm": {
            "type": "number",
            "title": "Срок в месяцах",
            "maximum": 60,
            "minimum": 1,
            "description": "Срок в месяцах"
        },
        "Applicant": {
            "type": "object",
            "required": [
                "phoneNumber",
                "lastName",
                "firstName",
                "birthDate"
            ],
            "properties": {
                "email": {
                    "type": "string",
                    "title": "Электронная почта",
                    "pattern": "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
                    "description": "Электронная почта"
                },
                "taxId": {
                    "type": "string",
                    "title": "ИНН",
                    "maxLength": 12,
                    "minLength": 12,
                    "description": "ИНН"
                },
                "gender": {
                    "enum": [
                        "male",
                        "female"
                    ],
                    "type": "string",
                    "title": "Пол",
                    "description": "Пол"
                },
                "lastName": {
                    "type": "string",
                    "title": "Фамилия",
                    "pattern": "^[a-zA-Zа-яА-Я\\s\\-]{2,80}$",
                    "description": "Фамилия"
                },
                "birthDate": {
                    "type": "string",
                    "title": "Дата рождения",
                    "description": "Дата рождения"
                },
                "firstName": {
                    "type": "string",
                    "title": "Имя",
                    "pattern": "^[a-zA-Zа-яА-Я\\s\\-]{2,50}$",
                    "description": "Имя"
                },
                "middleName": {
                    "type": "string",
                    "title": "Отчество",
                    "description": "Отчество"
                },
                "phoneNumber": {
                    "type": "string",
                    "title": "Номер телефона",
                    "default": "",
                    "pattern": "^\\+?[0-9\\s\\-\\(\\)]{7,15}$",
                    "description": "Номер телефона"
                },
                "passportNumber": {
                    "type": "string",
                    "title": "Серия и номер паспорта",
                    "pattern": "",
                    "description": "Серия и номер паспорта"
                },
                "passportIssuedBy": {
                    "type": "string",
                    "title": "Кем выдан паспорт",
                    "description": "Кем выдан паспорт"
                },
                "passportIssueDate": {
                    "type": "string",
                    "title": "Дата выдачи паспорта",
                    "description": "Дата выдачи паспорта"
                }
            }
        },
        "Employment": {
            "type": "object",
            "required": [
                "employmentType",
                "monthlyIncome"
            ],
            "properties": {
                "position": {
                    "type": "string",
                    "title": "Должность",
                    "description": "Должность"
                },
                "companyName": {
                    "type": "string",
                    "title": "Название компании",
                    "description": "Название компании"
                },
                "monthlyIncome": {
                    "type": "number",
                    "title": "Ежемесячный доход в рублях",
                    "description": "Ежемесячный доход в рублях"
                },
                "employmentType": {
                    "enum": [
                        "employed",
                        "self_employed",
                        "unemployed",
                        "pensioner",
                        "student"
                    ],
                    "type": "string",
                    "title": "Тип занятости",
                    "description": "Тип занятости"
                },
                "workExperience": {
                    "type": "number",
                    "title": "Общий стаж работы в месяцах",
                    "description": "Общий стаж работы в месяцах"
                },
                "additionalIncome": {
                    "type": "number",
                    "title": "Дополнительный доход в рублях",
                    "description": "Дополнительный доход в рублях"
                },
                "currentJobExperience": {
                    "type": "number",
                    "title": "Стаж на текущем месте работы в месяцах",
                    "description": "Стаж на текущем месте работы в месяцах"
                }
            }
        },
        "loanAmount": {
            "type": "number",
            "title": "Сумма",
            "maximum": 10000000,
            "minimum": 1000,
            "description": "Сумма"
        },
        "loanPurpose": {
            "enum": [
                "car",
                "education",
                "medical",
                "travel",
                "other"
            ],
            "type": "string",
            "title": "Цель",
            "description": "Цель"
        },
        "applicationId": {
            "type": "string",
            "title": "Id заявки",
            "description": "Id заявки"
        },
        "applicationDate": {
            "type": "string",
            "title": "Дата заявки",
            "description": "Дата заявки"
        },
        "loanReceiptDate": {
            "type": "array",
            "items": {
                "type": "string",
                "format": "date"
            },
            "title": "Желаемая дата получения кредита",
            "format": "date",
            "maxItems": 2,
            "minItems": 2
        },
        "methodReceivingMoney": {
            "enum": [
                "cash",
                "account",
                "card"
            ],
            "type": "string",
            "title": "Способ получения"
        },
        "otherPurposeDescription": {
            "type": "string",
            "title": "Другое",
            "description": "Другое"
        }
    }
}
''';
