const fullJsonSchemaStr = r'''
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
        "password": {
            "title": "Пароль",
            "type": "string"
        },
        "long_text": {
            "title": "Длинный текст",
            "type": "string"
        },
        "phone": {
            "title": "Какая то маска",
            "type": "string"
        },
        "select": {
            "title": "Выбор чего нибудь",
            "type": "string",
            "enum": [
                ""
            ]
        },
        "sex": {
            "title": "Какой пол",
            "type": "string",
            "enum": [
                "male",
                "female",
                "other"
            ]
        },
        "check": {
            "title": "Согласны с условиями",
            "type": "boolean",
            "enum": [
                "politic",
                "other",
                ""
            ]
        },
        "enable": {
            "title": "Включить?",
            "type": "boolean",
            "default": true
        },
        "birthday": {
            "title": "Дата рождения",
            "type": "string"
        },
        "date_range": {
            "title": "Выбрать дату",
            "type": "string",
            "default": null
        }
    }
}
''';
