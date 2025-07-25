const loanJsonSchemaStr = r'''
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
        "loanAmount": {
            "title": "Сумма",
            "description": "Сумма",
            "type": "number",
            "minimum": 1000,
            "maximum": 10000000
        },
        "currency": {
            "title": "Валюта",
            "description": "Валюта",
            "type": "string",
            "enum": [
                "RUB",
                "YAN"
            ]
        },
        "loanTerm": {
            "title": "Срок в месяцах",
            "description": "Срок в месяцах",
            "type": "number",
            "minimum": 1,
            "maximum": 60
        },
        "loanPurpose": {
            "title": "Цель",
            "description": "Цель",
            "type": "string",
            "enum": [
                "car",
                "education",
                "medical",
                "travel",
                "other"
            ]
        },
        "otherPurposeDescription": {
            "title": "Другое",
            "description": "Другое",
            "type": "string"
        },
        "Applicant": {
            "type": "object",
            "properties": {
                "phoneNumber": {
                    "title": "Номер телефона",
                    "description": "Номер телефона",
                    "type": "string",
                    "pattern": "^\\+?[0-9\\s\\-\\(\\)]{7,15}$"
                },
                "email": {
                    "title": "Электронная почта",
                    "description": "Электронная почта",
                    "type": "string",
                    "pattern": "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
                },
                "lastName": {
                    "title": "Фамилия",
                    "description": "Фамилия",
                    "type": "string",
                    "pattern": "^[a-zA-Zа-яА-Я\\s\\-]{2,80}$"
                },
                "birthDate": {
                    "title": "Дата рождения",
                    "description": "Дата рождения",
                    "type": "string"
                },
                "passportNumber": {
                    "title": "Серия и номер паспорта",
                    "description": "Серия и номер паспорта",
                    "type": "string",
                    "pattern": "^\\d{4}\\s\\d{6}$"
                },
                "firstName": {
                    "title": "Имя",
                    "description": "Имя",
                    "type": "string",
                    "pattern": "^[a-zA-Zа-яА-Я\\s\\-]{2,50}$"
                },
                "gender": {
                    "title": "Пол",
                    "description": "Пол",
                    "type": "string",
                    "enum": [
                        "male",
                        "female"
                    ]
                },
                "passportIssuedBy": {
                    "title": "Кем выдан паспорт",
                    "description": "Кем выдан паспорт",
                    "type": "string"
                },
                "passportIssueDate": {
                    "title": "Дата выдачи паспорта",
                    "description": "Дата выдачи паспорта",
                    "type": "string"
                },
                "middleName": {
                    "title": "Отчество",
                    "description": "Отчество",
                    "type": "string"
                },
                "taxId": {
                    "title": "ИНН",
                    "description": "ИНН",
                    "type": "string",
                    "minLength": 12,
                    "maxLength": 12
                }
            },
            "required": [
                "phoneNumber",
                "lastName",
                "birthDate",
                "passportNumber",
                "firstName"
            ]
        },
        "applicationDate": {
            "title": "Дата заявки",
            "description": "Дата заявки",
            "type": "string"
        },
        "applicationId": {
            "title": "Id заявки",
            "description": "Id заявки",
            "type": "string"
        },
        "Employment": {
            "type": "object",
            "properties": {
                "employmentType": {
                    "title": "Тип занятости",
                    "description": "Тип занятости",
                    "type": "string",
                    "enum": [
                        "employed",
                        "self_employed",
                        "unemployed",
                        "pensioner",
                        "student"
                    ]
                },
                "companyName": {
                    "title": "Название компании",
                    "description": "Название компании",
                    "type": "string"
                },
                "position": {
                    "title": "Должность",
                    "description": "Должность",
                    "type": "string"
                },
                "workExperience": {
                    "title": "Общий стаж работы в месяцах",
                    "description": "Общий стаж работы в месяцах",
                    "type": "number"
                },
                "currentJobExperience": {
                    "title": "Стаж на текущем месте работы в месяцах",
                    "description": "Стаж на текущем месте работы в месяцах",
                    "type": "number"
                },
                "monthlyIncome": {
                    "title": "Ежемесячный доход в рублях",
                    "description": "Ежемесячный доход в рублях",
                    "type": "number"
                },
                "additionalIncome": {
                    "title": "Дополнительный доход в рублях",
                    "description": "Дополнительный доход в рублях",
                    "type": "number"
                }
            },
            "required": [
                "employmentType",
                "monthlyIncome"
            ]
        },
        "Address": {
            "type": "object",
            "properties": {
                "registrationAddress": {
                    "title": "Адрес регистрации",
                    "description": "Адрес регистрации",
                    "type": "string"
                },
                "residentialAddress": {
                    "title": "Адрес Проживания",
                    "description": "Адрес Проживания",
                    "type": "string"
                },
                "sameAsRegistration": {
                    "title": "Совпадает с адресом регистрации",
                    "description": "Совпадает с адресом регистрации",
                    "default": true,
                    "type": "boolean"
                }
            },
            "required": [
                "registrationAddress"
            ]
        },
        "Consents": {
            "type": "object",
            "properties": {
                "personalDataProcessing": {
                    "title": "Согласие на обработку персональных данных",
                    "description": "Согласие на обработку персональных данных",
                    "type": "boolean"
                },
                "creditBureauCheck": {
                    "title": "Согласие на проверку кредитной истории",
                    "description": "Согласие на проверку кредитной истории",
                    "type": "boolean"
                },
                "marketingCommunications": {
                    "title": "Согласие на маркетинговые коммуникации",
                    "description": "Согласие на маркетинговые коммуникации",
                    "default": true,
                    "type": "boolean"
                }
            },
            "required": [
                "personalDataProcessing",
                "creditBureauCheck"
            ]
        },
        "status": {
            "title": "Статус заявки",
            "description": "Статус заявки",
            "type": "string",
            "enum": [
                "new",
                "in_review",
                "approved",
                "rejected",
                "canceled"
            ]
        }
    }
}
''';
