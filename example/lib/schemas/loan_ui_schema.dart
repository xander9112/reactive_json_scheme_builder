const loanUiSchemaStr = r'''
{
    "type": "GRID_COMPONENT",
    "options": {
        "lg": 24,
        "md": 24,
        "sm": 24,
        "xs": 24
    },
    "elements": [
        {
            "type": "TABS_COMPONENT",
            "options": {
                "data": {
                    "items": [
                        {
                            "slug": "Main",
                            "label": "Основное"
                        },
                        {
                            "slug": "Personal",
                            "label": "Личные данные"
                        },
                        {
                            "slug": "Job",
                            "label": "Работа"
                        },
                        {
                            "slug": "Address",
                            "label": "Адрес"
                        }
                    ]
                },
                "display": {}
            },
            "elements": [
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 24,
                        "md": 24,
                        "sm": 24,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "INPUT_NUMBER",
                            "label": "Сумма",
                            "scope": "#/properties/loanAmount",
                            "options": {
                                "name": "loanAmount",
                                "type": "number",
                                "title": "Сумма",
                                "maximum": 10000000,
                                "minimum": 1000,
                                "bordered": true,
                                "description": "Сумма"
                            }
                        },
                        {
                            "type": "DROP_DOWN",
                            "label": "Валюта",
                            "scope": "#/properties/currency",
                            "options": {
                                "data": {
                                    "items": {
                                        "RUB": "RUB",
                                        "YAN": "YAN"
                                    }
                                },
                                "name": "currency",
                                "type": "string",
                                "title": "Валюта",
                                "bordered": true,
                                "listHeight": 256,
                                "description": "Валюта"
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "label": "Срок в месяцах",
                            "scope": "#/properties/loanTerm",
                            "options": {
                                "name": "loanTerm",
                                "type": "number",
                                "title": "Срок в месяцах",
                                "maximum": 60,
                                "minimum": 1,
                                "bordered": true,
                                "addonAfter": "месяцы",
                                "description": "Срок в месяцах"
                            }
                        },
                        {
                            "type": "RADIO",
                            "label": "Способ получения",
                            "scope": "#/properties/methodReceivingMoney",
                            "options": {
                                "data": {
                                    "items": {
                                        "card": "На карту",
                                        "cash": "Наличными",
                                        "account": "На счет"
                                    }
                                },
                                "name": "methodReceivingMoney",
                                "type": "string",
                                "title": "Способ получения",
                                "bordered": true
                            }
                        },
                        {
                            "type": "DROP_DOWN",
                            "label": "Цель",
                            "scope": "#/properties/loanPurpose",
                            "options": {
                                "data": {
                                    "items": {
                                        "car": "Авто",
                                        "other": "Другое",
                                        "travel": "Путешествие",
                                        "medical": "Лечение",
                                        "education": "Образование"
                                    }
                                },
                                "name": "loanPurpose",
                                "type": "string",
                                "title": "Цель",
                                "bordered": true,
                                "listHeight": 256,
                                "description": "Цель"
                            }
                        },
                        {
                            "rule": {
                                "effect": "SHOW",
                                "condition": {
                                    "scope": "#/properties/loanPurpose",
                                    "schema": {
                                        "const": "other"
                                    }
                                }
                            },
                            "type": "INPUT_TEXT",
                            "label": "Другое",
                            "scope": "#/properties/otherPurposeDescription",
                            "options": {
                                "name": "otherPurposeDescription",
                                "type": "string",
                                "title": "Другое",
                                "bordered": true,
                                "description": "Другое"
                            }
                        },
                        {
                            "type": "DATE_RANGE",
                            "label": "Желаемая дата получения кредита",
                            "scope": "#/properties/loanReceiptDate",
                            "options": {
                                "name": "loanReceiptDate",
                                "type": "array",
                                "items": {
                                    "type": "string",
                                    "format": "date"
                                },
                                "title": "Желаемая дата получения кредита",
                                "format": "date",
                                "bordered": true,
                                "maxItems": 2,
                                "minItems": 2,
                                "alowClear": true
                            }
                        },
                        {
                            "type": "INPUT_MASK",
                            "label": "Номер телефона",
                            "scope": "#/properties/Applicant/properties/phoneNumber",
                            "options": {
                                "mask": "9 999 999 99 99",
                                "name": "phoneNumber",
                                "size": "middle",
                                "type": "string",
                                "title": "Номер телефона",
                                "pattern": "^\\+?[0-9\\s\\-\\(\\)]{7,15}$",
                                "bordered": true,
                                "description": "Номер телефона"
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "label": "Электронная почта",
                            "scope": "#/properties/Applicant/properties/email",
                            "options": {
                                "name": "email",
                                "size": "middle",
                                "type": "string",
                                "title": "Электронная почта",
                                "pattern": "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
                                "bordered": true,
                                "description": "Электронная почта"
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "label": "Дата заявки",
                            "scope": "#/properties/applicationDate",
                            "options": {
                                "name": "applicationDate",
                                "type": "string",
                                "title": "Дата заявки",
                                "bordered": true,
                                "description": "Дата заявки"
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "label": "Id заявки",
                            "scope": "#/properties/applicationId",
                            "options": {
                                "name": "applicationId",
                                "type": "string",
                                "title": "Id заявки",
                                "bordered": true,
                                "description": "Id заявки"
                            }
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 24,
                        "md": 24,
                        "sm": 24,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "GRID_COMPONENT",
                            "options": {
                                "lg": 24,
                                "md": 24,
                                "sm": 24,
                                "xs": 24
                            },
                            "elements": [
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "label": "Фамилия",
                                            "scope": "#/properties/Applicant/properties/lastName",
                                            "options": {
                                                "name": "lastName",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "Фамилия",
                                                "pattern": "^[a-zA-Zа-яА-Я\\s\\-]{2,80}$",
                                                "bordered": true,
                                                "description": "Фамилия"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "label": "Имя",
                                            "scope": "#/properties/Applicant/properties/firstName",
                                            "options": {
                                                "name": "firstName",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "Имя",
                                                "pattern": "^[a-zA-Zа-яА-Я\\s\\-]{2,50}$",
                                                "bordered": true,
                                                "description": "Имя"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "label": "Отчество",
                                            "scope": "#/properties/Applicant/properties/middleName",
                                            "options": {
                                                "name": "middleName",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "Отчество",
                                                "bordered": true,
                                                "description": "Отчество"
                                            }
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "type": "GRID_COMPONENT",
                            "options": {
                                "lg": 24,
                                "md": 24,
                                "sm": 24,
                                "xs": 24
                            },
                            "elements": [
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "label": "Дата рождения",
                                            "scope": "#/properties/Applicant/properties/birthDate",
                                            "options": {
                                                "name": "birthDate",
                                                "type": "string",
                                                "title": "Дата рождения",
                                                "bordered": true,
                                                "description": "Дата рождения"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "DROP_DOWN",
                                            "label": "Пол",
                                            "scope": "#/properties/Applicant/properties/gender",
                                            "options": {
                                                "data": {
                                                    "items": {
                                                        "male": "Муж",
                                                        "female": "Жен"
                                                    }
                                                },
                                                "name": "gender",
                                                "type": "string",
                                                "title": "Пол",
                                                "bordered": true,
                                                "listHeight": 256,
                                                "description": "Пол"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "label": "ИНН",
                                            "scope": "#/properties/Applicant/properties/taxId",
                                            "options": {
                                                "name": "taxId",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "ИНН",
                                                "bordered": true,
                                                "maxLength": 12,
                                                "minLength": 12,
                                                "description": "ИНН"
                                            }
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "type": "GRID_COMPONENT",
                            "options": {
                                "lg": 24,
                                "md": 24,
                                "sm": 24,
                                "xs": 24
                            },
                            "elements": [
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_MASK",
                                            "label": "Серия и номер паспорта",
                                            "scope": "#/properties/Applicant/properties/passportNumber",
                                            "options": {
                                                "mask": "99 99 999999",
                                                "name": "passportNumber",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "Серия и номер паспорта",
                                                "pattern": "",
                                                "bordered": true,
                                                "description": "Серия и номер паспорта"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "label": "Кем выдан паспорт",
                                            "scope": "#/properties/Applicant/properties/passportIssuedBy",
                                            "options": {
                                                "name": "passportIssuedBy",
                                                "type": "string",
                                                "title": "Кем выдан паспорт",
                                                "bordered": true,
                                                "description": "Кем выдан паспорт"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 8,
                                        "sm": 8,
                                        "xs": 8
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "label": "Дата выдачи паспорта",
                                            "scope": "#/properties/Applicant/properties/passportIssueDate",
                                            "options": {
                                                "name": "passportIssueDate",
                                                "type": "string",
                                                "title": "Дата выдачи паспорта",
                                                "bordered": true,
                                                "description": "Дата выдачи паспорта"
                                            }
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 24,
                        "md": 24,
                        "sm": 24,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "DROP_DOWN",
                            "label": "Тип занятости",
                            "scope": "#/properties/Employment/properties/employmentType",
                            "options": {
                                "data": {
                                    "items": {
                                        "student": "Студент",
                                        "employed": "Работаю",
                                        "pensioner": "Пенсионер",
                                        "unemployed": "Безработный",
                                        "self_employed": "Самозанятый"
                                    }
                                },
                                "name": "employmentType",
                                "type": "string",
                                "title": "Тип занятости",
                                "bordered": true,
                                "listHeight": 256,
                                "description": "Тип занятости"
                            }
                        },
                        {
                            "rule": {
                                "effect": "HIDE",
                                "condition": {
                                    "scope": "#/properties/Employment/properties/employmentType",
                                    "schema": {
                                        "enum": [
                                            "self_employed",
                                            "pensioner",
                                            "student",
                                            "unemployed"
                                        ]
                                    }
                                }
                            },
                            "type": "INPUT_TEXT",
                            "label": "Название компании",
                            "scope": "#/properties/Employment/properties/companyName",
                            "options": {
                                "name": "companyName",
                                "type": "string",
                                "title": "Название компании",
                                "bordered": true,
                                "description": "Название компании"
                            }
                        },
                        {
                            "rule": {
                                "effect": "HIDE",
                                "condition": {
                                    "scope": "#/properties/Employment/properties/employmentType",
                                    "schema": {
                                        "enum": [
                                            "self_employed",
                                            "pensioner",
                                            "student",
                                            "unemployed"
                                        ]
                                    }
                                }
                            },
                            "type": "INPUT_TEXT",
                            "label": "Должность",
                            "scope": "#/properties/Employment/properties/position",
                            "options": {
                                "name": "position",
                                "type": "string",
                                "title": "Должность",
                                "bordered": true,
                                "description": "Должность"
                            }
                        },
                        {
                            "rule": {
                                "effect": "HIDE",
                                "condition": {
                                    "scope": "#/properties/Employment/properties/employmentType",
                                    "schema": {
                                        "const": "student"
                                    }
                                }
                            },
                            "type": "INPUT_NUMBER",
                            "label": "Общий стаж работы в месяцах",
                            "scope": "#/properties/Employment/properties/workExperience",
                            "options": {
                                "name": "workExperience",
                                "type": "number",
                                "title": "Общий стаж работы в месяцах",
                                "bordered": true,
                                "description": "Общий стаж работы в месяцах"
                            }
                        },
                        {
                            "rule": {
                                "effect": "HIDE",
                                "condition": {
                                    "scope": "#/properties/Employment/properties/employmentType",
                                    "schema": {
                                        "enum": [
                                            "self_employed",
                                            "pensioner",
                                            "student",
                                            "unemployed"
                                        ]
                                    }
                                }
                            },
                            "type": "INPUT_NUMBER",
                            "label": "Стаж на текущем месте работы в месяцах",
                            "scope": "#/properties/Employment/properties/currentJobExperience",
                            "options": {
                                "name": "currentJobExperience",
                                "type": "number",
                                "title": "Стаж на текущем месте работы в месяцах",
                                "bordered": true,
                                "description": "Стаж на текущем месте работы в месяцах"
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "label": "Ежемесячный доход в рублях",
                            "scope": "#/properties/Employment/properties/monthlyIncome",
                            "options": {
                                "name": "monthlyIncome",
                                "type": "number",
                                "title": "Ежемесячный доход в рублях",
                                "bordered": true,
                                "description": "Ежемесячный доход в рублях"
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "label": "Дополнительный доход в рублях",
                            "scope": "#/properties/Employment/properties/additionalIncome",
                            "options": {
                                "name": "additionalIncome",
                                "type": "number",
                                "title": "Дополнительный доход в рублях",
                                "bordered": true,
                                "description": "Дополнительный доход в рублях"
                            }
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 24,
                        "md": 24,
                        "sm": 24,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "INPUT_TEXT",
                            "label": "Адрес регистрации",
                            "scope": "#/properties/Address/properties/registrationAddress",
                            "options": {
                                "name": "registrationAddress",
                                "type": "string",
                                "title": "Адрес регистрации",
                                "bordered": true,
                                "description": "Адрес регистрации"
                            }
                        },
                        {
                            "type": "SWITCH",
                            "label": "Совпадает с адресом регистрации",
                            "scope": "#/properties/Address/properties/sameAsRegistration",
                            "options": {
                                "name": "sameAsRegistration",
                                "type": "boolean",
                                "title": "Совпадает с адресом регистрации",
                                "bordered": true,
                                "description": "Совпадает с адресом регистрации",
                                "checkedChildren": "On",
                                "unCheckedChildren": "Off"
                            }
                        },
                        {
                            "rule": {
                                "effect": "HIDE",
                                "condition": {
                                    "scope": "#/properties/Address/properties/sameAsRegistration",
                                    "schema": {
                                        "const": true
                                    }
                                }
                            },
                            "type": "INPUT_TEXT",
                            "label": "Адрес Проживания",
                            "scope": "#/properties/Address/properties/residentialAddress",
                            "options": {
                                "name": "residentialAddress",
                                "type": "string",
                                "title": "Адрес Проживания",
                                "bordered": true,
                                "description": "Адрес Проживания"
                            }
                        }
                    ]
                }
            ]
        },
        {
            "type": "GRID_COMPONENT",
            "options": {
                "lg": 24,
                "md": 24,
                "sm": 24,
                "xs": 24,
                "name": "Applicant"
            },
            "elements": []
        },
        {
            "type": "GRID_COMPONENT",
            "options": {
                "lg": 24,
                "md": 24,
                "sm": 24,
                "xs": 24,
                "name": "Consents"
            },
            "elements": [
                {
                    "type": "SWITCH",
                    "label": "Согласие на обработку персональных данных",
                    "scope": "#/properties/Consents/properties/personalDataProcessing",
                    "options": {
                        "name": "personalDataProcessing",
                        "type": "boolean",
                        "title": "Согласие на обработку персональных данных",
                        "bordered": true,

                        "checkedChildren": "On",
                        "unCheckedChildren": "Off"
                    }
                },
                {
                    "type": "SWITCH",
                    "label": "Согласие на проверку кредитной истории",
                    "scope": "#/properties/Consents/properties/creditBureauCheck",
                    "options": {
                        "name": "creditBureauCheck",
                        "type": "boolean",
                        "title": "Согласие на проверку кредитной истории",
                        "bordered": true,

                        "checkedChildren": "On",
                        "unCheckedChildren": "Off"
                    }
                },
                {
                    "type": "SWITCH",
                    "label": "Согласие на маркетинговые коммуникации",
                    "scope": "#/properties/Consents/properties/marketingCommunications",
                    "options": {
                        "name": "marketingCommunications",
                        "type": "boolean",
                        "title": "Согласие на маркетинговые коммуникации",
                        "default": true,
                        "bordered": true,
                        "description": "Чтобы мы могли отправлять вам рекламу",
                        "defaultChecked": true,
                        "checkedChildren": "On",
                        "unCheckedChildren": "Off"
                    }
                }
            ]
        },
        {
            "type": "DROP_DOWN",
            "label": "Статус заявки",
            "scope": "#/properties/status",
            "options": {
                "data": {
                    "items": {
                        "new": "Новая",
                        "approved": "Одобрена",
                        "canceled": "Отменена",
                        "rejected": "Отклонена",
                        "in_review": "На рассмотрении"
                    }
                },
                "name": "status",
                "type": "string",
                "title": "Статус заявки",
                "bordered": true,
                "listHeight": 256,
                "description": "Статус заявки"
            }
        },
        {
            "type": "BUTTON",
            "label": "Отправить",
            "options": {
                "name": "sentButton",
                "type": "primary",
                "htmlType": "submit"
            }
        }
    ]
}
''';
