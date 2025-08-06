const fullUiSchemaStr = r'''
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
            "type": "TITLE",
            "text": "Заголовок",
            "options": {
                "label": "Заголовок",
                "variant": "h4",
                "name": "title"
            }
        },
        {
            "type": "DIVIDER"
        },
        {
            "type": "TABS_COMPONENT",
            "options": {
                "display": {},
                "data": {
                    "items": [
                        {
                            "slug": "input_fields",
                            "label": "Поля ввода"
                        },
                        {
                            "slug": "controls",
                            "label": "Элементы управления"
                        },
                        {
                            "slug": "sliders",
                            "label": "Слайдеры"
                        },
                        {
                            "slug": "date_controls",
                            "label": "Работа с датой"
                        },
                        {
                            "slug": "buttons",
                            "label": "Кнопки"
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
                                        "lg": 6,
                                        "md": 8,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_NUMBER",
                                            "scope": "#/properties/number_input",
                                            "label": "Число",
                                            "options": {
                                                "name": "number_input",
                                                "type": "number",
                                                "title": "Число",
                                                "bordered": true,
                                                "validation": {},
                                                "description": "Описание",
                                                "labelPosition": "left",
                                                "decimalSeparator": ","
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 6,
                                        "md": 8,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/text_input",
                                            "label": "Текст",
                                            "options": {
                                                "name": "text_input",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "Текст",
                                                "bordered": true,
                                                "validation": {}
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 6,
                                        "md": 8,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_PASSWORD",
                                            "scope": "#/properties/password_input",
                                            "label": "Пароль",
                                            "options": {
                                                "name": "password_input",
                                                "type": "string",
                                                "title": "Пароль",
                                                "bordered": true,
                                                "validation": {}
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 6,
                                        "md": 8,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "TEXT_AREA",
                                            "scope": "#/properties/long_input",
                                            "label": "Длинный текст",
                                            "options": {
                                                "name": "long_input",
                                                "rows": 1,
                                                "type": "string",
                                                "title": "Длинный текст",
                                                "rowsMax": 10,
                                                "bordered": true,
                                                "validation": {}
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
                                        "lg": 6,
                                        "md": 8,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_TEXT",
                                            "scope": "#/properties/text_validation_input",
                                            "label": "Поле с валидацией",
                                            "options": {
                                                "name": "text_validation_input",
                                                "size": "middle",
                                                "type": "string",
                                                "title": "Поле с валидацией",
                                                "format": "email",
                                                "length": "15",
                                                "bordered": true,
                                                "maxLength": 20,
                                                "minLength": 10,
                                                "validation": {
                                                    "required": "Поле обязательно для заполнения",
                                                    "minLength": "Минимальной должно быть 10 символов",
                                                    "maxLength": "Максимально может быть 20 символов",
                                                    "email": "Должен быть email"
                                                }
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 6,
                                        "md": 8,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_MASK",
                                            "scope": "#/properties/letter_mask",
                                            "label": "Номер машины",
                                            "options": {
                                                "mask": "a 999 aa",
                                                "name": "letter_mask",
                                                "type": "string",
                                                "title": "Номер машины",
                                                "bordered": true,
                                                "validation": {}
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 6,
                                        "md": 8,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "INPUT_MASK",
                                            "scope": "#/properties/mask_input",
                                            "label": "Маска",
                                            "options": {
                                                "mask": "+9 (999) 999-99-99",
                                                "name": "mask_input",
                                                "type": "string",
                                                "title": "Маска",
                                                "bordered": true,
                                                "validation": {}
                                            }
                                        }
                                    ]
                                },
                                {
                                    "type": "GRID_COMPONENT",
                                    "options": {
                                        "lg": 6,
                                        "md": 24,
                                        "sm": 12,
                                        "xs": 24
                                    },
                                    "elements": [
                                        {
                                            "type": "DROP_DOWN",
                                            "scope": "#/properties/select_input",
                                            "label": "Выбор из списка",
                                            "options": {
                                                "name": "select_input",
                                                "type": "string",
                                                "title": "Выбор из списка",
                                                "bordered": true,
                                                "listHeight": 256,
                                                "validation": {},
                                                "data": {
                                                    "items": {
                                                        "element_1": "Элемент 1",
                                                        "element_2": "Элемент 2",
                                                        "element_3": "Элемент 2"
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
                                "lg": 6,
                                "md": 12,
                                "sm": 18,
                                "xs": 24
                            },
                            "elements": [
                                {
                                    "type": "DROP_DOWN",
                                    "scope": "#/properties/select_data_source_input",
                                    "label": "Выбор из динамического списка",
                                    "options": {
                                        "name": "select_data_source_input",
                                        "type": "string",
                                        "title": "Выбор из динамического списка",
                                        "bordered": true,
                                        "listHeight": 256,
                                        "validation": {}
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
                            "type": "RADIO",
                            "scope": "#/properties/radio_control",
                            "label": "Выберите ваш пол",
                            "options": {
                                "name": "radio_control",
                                "type": "string",
                                "title": "Выберите ваш пол",
                                "bordered": true,
                                "validation": {},
                                "data": {
                                    "items": {
                                        "man": "Мужской",
                                        "woman": "Женский",
                                        "other": "Другое"
                                    }
                                }
                            }
                        },
                        {
                            "type": "CHECKBOX",
                            "scope": "#/properties/checkbox_group_control",
                            "label": "Вы согласны с правилами?",
                            "options": {
                                "name": "checkbox_group_control",
                                "type": "string",
                                "title": "Вы согласны с правилами?",
                                "bordered": true,
                                "validation": {},
                                "data": {
                                    "items": {
                                        "number_1": "Правило №1",
                                        "number_2": "Правило №2",
                                        "number_3": "Правило №3",
                                        "number_4": "Правило №4"
                                    }
                                }
                            }
                        },
                        {
                            "type": "SWITCH",
                            "scope": "#/properties/switch_control",
                            "label": "Включить настройки",
                            "options": {
                                "name": "switch_control",
                                "type": "boolean",
                                "title": "Включить настройки",
                                "bordered": true,
                                "validation": {},
                                "checkedChildren": "On",
                                "unCheckedChildren": "Off"
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
                            "type": "SLIDER",
                            "scope": "#/properties/slider",
                            "label": "Какая сумма интересует",
                            "options": {
                                "max": 10000,
                                "min": 1000,
                                "name": "slider",
                                "step": 1,
                                "type": "number",
                                "items": {
                                    "type": "number"
                                },
                                "title": "Какая сумма интересует",
                                "bordered": true,
                                "included": true,
                                "validation": {},
                                "data": {
                                    "items": {}
                                }
                            }
                        },
                        {
                            "type": "SLIDER",
                            "scope": "#/properties/slider_range",
                            "label": "Какая сумма интересует",
                            "options": {
                                "max": 10000,
                                "min": 1000,
                                "name": "slider_range",
                                "step": 1,
                                "type": "array",
                                "items": {
                                    "type": "number"
                                },
                                "range": true,
                                "title": "Какая сумма интересует",
                                "bordered": true,
                                "included": true,
                                "vertical": true,
                                "validation": {},
                                "data": {
                                    "items": {}
                                }
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
                            "type": "DATE",
                            "scope": "#/properties/date_control",
                            "label": "День рождения",
                            "options": {
                                "name": "date_control",
                                "type": "string",
                                "title": "День рождения",
                                "format": "date",
                                "bordered": true,
                                "alowClear": true,
                                "validation": {}
                            }
                        },
                        {
                            "type": "DATE",
                            "scope": "#/properties/datetime_control",
                            "label": "День и время рождения",
                            "options": {
                                "name": "datetime_control",
                                "type": "string",
                                "title": "День и время рождения",
                                "format": "date-time",
                                "bordered": true,
                                "alowClear": true,
                                "validation": {}
                            }
                        },
                        {
                            "type": "DATE",
                            "scope": "#/properties/time_control",
                            "label": "Время рождения",
                            "options": {
                                "name": "time_control",
                                "type": "string",
                                "title": "Время рождения",
                                "format": "time",
                                "bordered": true,
                                "alowClear": true,
                                "validation": {}
                            }
                        },
                        {
                            "type": "DATE_RANGE",
                            "scope": "#/properties/date_range_control",
                            "label": "Выберите даты",
                            "options": {
                                "name": "date_range_control",
                                "type": "array",
                                "items": {
                                    "type": "string",
                                    "format": "date"
                                },
                                "title": "Выберите даты",
                                "format": "date",
                                "bordered": true,
                                "maxItems": 2,
                                "minItems": 2,
                                "alowClear": true,
                                "validation": {}
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
                                "lg": 8,
                                "md": 8,
                                "sm": 12,
                                "xs": 24
                            },
                            "elements": [
                                {
                                    "type": "BUTTON",
                                    "label": "Отправить",
                                    "options": {
                                        "name": "submit_btn",
                                        "type": "default",
                                        "htmlType": "submit"
                                    }
                                }
                            ]
                        },
                        {
                            "type": "GRID_COMPONENT",
                            "options": {
                                "lg": 8,
                                "md": 8,
                                "sm": 12,
                                "xs": 24
                            },
                            "elements": [
                                {
                                    "type": "BUTTON",
                                    "label": "Просто кнопка",
                                    "options": {
                                        "name": "button_btn",
                                        "type": "default",
                                        "htmlType": "button"
                                    }
                                }
                            ]
                        },
                        {
                            "type": "GRID_COMPONENT",
                            "options": {
                                "lg": 8,
                                "md": 8,
                                "sm": 24,
                                "xs": 24
                            },
                            "elements": [
                                {
                                    "type": "BUTTON",
                                    "label": "Кнопка сбросить",
                                    "options": {
                                        "name": "reset_btn",
                                        "type": "default",
                                        "htmlType": "reset"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
''';
