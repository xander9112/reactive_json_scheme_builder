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
                "display": {},
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
                }
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
                            "scope": "#/properties/loanAmount",
                            "label": "Сумма",
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
                            "scope": "#/properties/currency",
                            "label": "Валюта",
                            "options": {
                                "enum": [
                                    [
                                        "R"
                                    ],
                                    [
                                        "Y"
                                    ]
                                ],
                                "name": "currency",
                                "type": "string",
                                "title": "Валюта",
                                "bordered": true,
                                "listHeight": 256,
                                "description": "Валюта",
                                "defaultValue": "RUB",
                                "data": {
                                    "items": {
                                        "RUB": "RUB",
                                        "YAN": "YAN"
                                    }
                                }
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "scope": "#/properties/loanTerm",
                            "label": "Срок в месяцах",
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
                            "type": "DROP_DOWN",
                            "scope": "#/properties/loanPurpose",
                            "label": "Цель",
                            "options": {
                                "enum": [
                                    [
                                        "c"
                                    ],
                                    [
                                        "e"
                                    ],
                                    [
                                        "m"
                                    ],
                                    [
                                        "t"
                                    ],
                                    [
                                        "o"
                                    ],
                                    [
                                        "Д"
                                    ]
                                ],
                                "name": "loanPurpose",
                                "type": "string",
                                "title": "Цель",
                                "bordered": true,
                                "listHeight": 256,
                                "description": "Цель",
                                "data": {
                                    "items": {
                                        "car": "Авто",
                                        "education": "Образование",
                                        "medical": "Лечение",
                                        "travel": "Путешествие",
                                        "other": "Другое"
                                    }
                                }
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/otherPurposeDescription",
                            "label": "Другое",
                            "options": {
                                "name": "otherPurposeDescription",
                                "type": "string",
                                "title": "Другое",
                                "bordered": true,
                                "description": "Другое"
                            },
                            "rule": {
                                "effect": "SHOW",
                                "condition": {
                                    "scope": "#/properties/loanPurpose",
                                    "schema": {
                                        "const": "other"
                                    }
                                }
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/Applicant/properties/phoneNumber",
                            "label": "Номер телефона",
                            "options": {
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
                            "scope": "#/properties/Applicant/properties/email",
                            "label": "Электронная почта",
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
                            "scope": "#/properties/applicationDate",
                            "label": "Дата заявки",
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
                            "scope": "#/properties/applicationId",
                            "label": "Id заявки",
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
                                        "md": 12,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/lastName",
                                            "label": "Фамилия",
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
                                        "md": 12,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/firstName",
                                            "label": "Имя",
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
                                        "md": 24,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/middleName",
                                            "label": "Отчество",
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
                                        "md": 12,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/birthDate",
                                            "label": "Дата рождения",
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
                                        "md": 12,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "DROP_DOWN",
                                            "scope": "#/properties/Applicant/properties/gender",
                                            "label": "Пол",
                                            "options": {
                                                "enum": [
                                                    [
                                                        "m"
                                                    ],
                                                    [
                                                        "f"
                                                    ]
                                                ],
                                                "name": "gender",
                                                "type": "string",
                                                "title": "Пол",
                                                "bordered": true,
                                                "listHeight": 256,
                                                "description": "Пол",
                                                "data": {
                                                    "items": {
                                                        "male": "Муж",
                                                        "female": "Жен"
                                                    }
                                                }
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 8,
                                        "md": 24,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/taxId",
                                            "label": "ИНН",
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
                                        "md": 12,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/passportNumber",
                                            "label": "Серия и номер паспорта",
                                            "options": {
                                                "name": "passportNumber",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "Серия и номер паспорта",
                                                "pattern": "^\\d{4}\\s\\d{6}$",
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
                                        "md": 12,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/passportIssuedBy",
                                            "label": "Кем выдан паспорт",
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
                                        "md": 24,
                                        "sm": 24,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/Applicant/properties/passportIssueDate",
                                            "label": "Дата выдачи паспорта",
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
                            "scope": "#/properties/Employment/properties/employmentType",
                            "label": "Тип занятости",
                            "options": {
                                "enum": [
                                    [
                                        "e"
                                    ],
                                    [
                                        "s"
                                    ],
                                    [
                                        "u"
                                    ],
                                    [
                                        "p"
                                    ],
                                    [
                                        "s"
                                    ]
                                ],
                                "name": "employmentType",
                                "type": "string",
                                "title": "Тип занятости",
                                "bordered": true,
                                "listHeight": 256,
                                "description": "Тип занятости",
                                "data": {
                                    "items": {
                                        "employed": "Работаю",
                                        "self_employed": "Самозанятый",
                                        "unemployed": "Безработный",
                                        "pensioner": "Пенсионер",
                                        "student": "Студент"
                                    }
                                }
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/Employment/properties/companyName",
                            "label": "Название компании",
                            "options": {
                                "name": "companyName",
                                "type": "string",
                                "title": "Название компании",
                                "bordered": true,
                                "description": "Название компании"
                            },
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
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/Employment/properties/position",
                            "label": "Должность",
                            "options": {
                                "name": "position",
                                "type": "string",
                                "title": "Должность",
                                "bordered": true,
                                "description": "Должность"
                            },
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
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "scope": "#/properties/Employment/properties/workExperience",
                            "label": "Общий стаж работы в месяцах",
                            "options": {
                                "name": "workExperience",
                                "type": "number",
                                "title": "Общий стаж работы в месяцах",
                                "bordered": true,
                                "description": "Общий стаж работы в месяцах"
                            },
                            "rule": {
                                "effect": "HIDE",
                                "condition": {
                                    "scope": "#/properties/Employment/properties/employmentType",
                                    "schema": {
                                        "const": "student"
                                    }
                                }
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "scope": "#/properties/Employment/properties/currentJobExperience",
                            "label": "Стаж на текущем месте работы в месяцах",
                            "options": {
                                "name": "currentJobExperience",
                                "type": "number",
                                "title": "Стаж на текущем месте работы в месяцах",
                                "bordered": true,
                                "description": "Стаж на текущем месте работы в месяцах"
                            },
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
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "scope": "#/properties/Employment/properties/monthlyIncome",
                            "label": "Ежемесячный доход в рублях",
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
                            "scope": "#/properties/Employment/properties/additionalIncome",
                            "label": "Дополнительный доход в рублях",
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
                            "scope": "#/properties/Address/properties/registrationAddress",
                            "label": "Адрес регистрации",
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
                            "scope": "#/properties/Address/properties/sameAsRegistration",
                            "label": "Совпадает с адресом регистрации",
                            "options": {
                                "name": "sameAsRegistration",
                                "type": "boolean",
                                "title": "Совпадает с адресом регистрации",
                                "default": true,
                                "bordered": true,
                                "description": "Совпадает с адресом регистрации",
                                "checkedChildren": "On",
                                "unCheckedChildren": "Off"
                            }
                        },
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/Address/properties/residentialAddress",
                            "label": "Адрес Проживания",
                            "options": {
                                "name": "residentialAddress",
                                "type": "string",
                                "title": "Адрес Проживания",
                                "bordered": true,
                                "description": "Адрес Проживания"
                            },
                            "rule": {
                                "effect": "HIDE",
                                "condition": {
                                    "scope": "#/properties/Address/properties/sameAsRegistration",
                                    "schema": {
                                        "const": true
                                    }
                                }
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
            }
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
                    "scope": "#/properties/Consents/properties/personalDataProcessing",
                    "label": "Согласие на обработку персональных данных",
                    "options": {
                        "name": "personalDataProcessing",
                        "type": "boolean",
                        "title": "Согласие на обработку персональных данных",
                        "bordered": true,
                        "description": "Согласие на обработку персональных данных",
                        "checkedChildren": "On",
                        "unCheckedChildren": "Off"
                    }
                },
                {
                    "type": "SWITCH",
                    "scope": "#/properties/Consents/properties/creditBureauCheck",
                    "label": "Согласие на проверку кредитной истории",
                    "options": {
                        "name": "creditBureauCheck",
                        "type": "boolean",
                        "title": "Согласие на проверку кредитной истории",
                        "bordered": true,
                        "description": "Согласие на проверку кредитной истории",
                        "checkedChildren": "On",
                        "unCheckedChildren": "Off"
                    }
                },
                {
                    "type": "SWITCH",
                    "scope": "#/properties/Consents/properties/marketingCommunications",
                    "label": "Согласие на маркетинговые коммуникации",
                    "options": {
                        "name": "marketingCommunications",
                        "type": "boolean",
                        "title": "Согласие на маркетинговые коммуникации",
                        "default": true,
                        "bordered": true,
                        "description": "Согласие на маркетинговые коммуникации",
                        "defaultValue": true,
                        "defaultChecked": true,
                        "checkedChildren": "On",
                        "unCheckedChildren": "Off"
                    }
                }
            ]
        },
        {
            "type": "DROP_DOWN",
            "scope": "#/properties/status",
            "label": "Статус заявки",
            "options": {
                "enum": [
                    [
                        "n"
                    ],
                    [
                        "i"
                    ],
                    [
                        "a"
                    ],
                    [
                        "r"
                    ],
                    [
                        "c"
                    ]
                ],
                "name": "status",
                "type": "string",
                "title": "Статус заявки",
                "bordered": true,
                "listHeight": 256,
                "description": "Статус заявки",
                "data": {
                    "items": {
                        "new": "Новая",
                        "in_review": "На рассмотрении",
                        "approved": "Одобрена",
                        "rejected": "Отклонена",
                        "canceled": "Отменена"
                    }
                }
            }
        },
        {
            "type": "BUTTON",
            "label": "Отправить",
            "options": {
                "name": "sentButton",
                "type": "submit",
                "htmlType": "button"
            }
        }
    ]
}
''';
