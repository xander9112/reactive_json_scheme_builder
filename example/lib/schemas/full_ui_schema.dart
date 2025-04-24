const fullUiSchemaStr = r'''
{
    "type": "GRID_COMPONENT",
    "options": {
        "xs": 24,
        "sm": 24,
        "md": 24,
        "lg": 24
    },
    "elements": [
        {
            "type": "TITLE",
            "text": "Новая форма",
            "options": {
                "variant": "h1"
            }
        },
        {
            "type": "DIVIDER"
        },
        {
            "type": "INPUT_PASSWORD",
            "scope": "#/properties/password",
            "label": "Пароль",
            "options": {
                "name": "password",
                "bordered": true
            }
        },
        {
            "type": "TEXT_AREA",
            "scope": "#/properties/long_text",
            "label": "Длинный текст",
            "options": {
                "name": "long_text",
                "bordered": true
            }
        },
        {
            "type": "INPUT_MASK",
            "scope": "#/properties/phone",
            "label": "Какая то маска",
            "options": {
                "mask": "+1 (111) 111-11-11",
                "name": "phone",
                "bordered": true
            }
        },
        {
            "type": "DROP_DOWN",
            "scope": "#/properties/select",
            "label": "Выбор чего нибудь",
            "options": {
                "name": "select",
                "bordered": true,
                "listHeight": 256,
                "items": {
                    "city_1": "Город 1",
                    "city_2": "Город 2"
                }
            }
        },
        {
            "type": "RADIO",
            "scope": "#/properties/sex",
            "label": "Какой пол",
            "options": {
                "name": "sex",
                "items": {
                    "male": "Мужское",
                    "female": "Женский",
                    "other": "Другой"
                }
            }
        },
        {
            "type": "CHECKBOX",
            "scope": "#/properties/check",
            "label": "Согласны с условиями",
            "options": {
                "name": "check",
                "items": {
                    "politic": "Политика",
                    "toher": "Другое"
                }
            }
        },
        {
            "type": "SWITCH",
            "scope": "#/properties/enable",
            "label": "Включить?",
            "options": {
                "name": "enable",
                "checkedChildren": "On",
                "unCheckedChildren": "Off",
                "defaultValue": true
            }
        },
        {
            "type": "DATE",
            "scope": "#/properties/birthday",
            "label": "Дата рождения",
            "options": {
                "name": "birthday",
                "alowClear": true,
                "bordered": true
            }
        },
        {
            "type": "DATE_RANGE",
            "scope": "#/properties/date_range",
            "label": "Выбрать дату",
            "options": {
                "name": "date_range",
                "alowClear": true,
                "bordered": true
            }
        },
        {
            "type": "BUTTON",
            "label": "Button",
            "options": {
                "type": "default",
                "htmlType": "button"
            }
        }
    ]
}
''';
