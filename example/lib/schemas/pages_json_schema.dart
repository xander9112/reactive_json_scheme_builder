const pagesJsonSchemaStr = r'''
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
        "number_input": {
            "title": "Число",
            "description": "Описание",
            "type": "number"
        },
        "text_input": {
            "title": "Текст",
            "type": "string"
        },
        "password_input": {
            "title": "Пароль",
            "type": "string"
        },
        "long_input": {
            "title": "Длинный текст",
            "type": "string"
        },
        "text_validation_input": {
            "title": "Поле с валидацией",
            "format": "email",
            "type": "string",
            "minLength": 10,
            "maxLength": 20
        },
        "letter_mask": {
            "title": "Номер машины",
            "type": "string"
        },
        "mask_input": {
            "title": "Маска",
            "type": "string"
        },
        "select_input": {
            "title": "Выбор из списка",
            "type": "string",
            "enum": [
                "element_1",
                "element_2",
                "element_3"
            ]
        },
        "select_data_source_input": {
            "title": "Выбор из динамического списка",
            "type": "string",
            "enum": [
                ""
            ]
        },
        "radio_control": {
            "title": "Выберите ваш пол",
            "type": "string",
            "enum": [
                "man",
                "woman",
                "other"
            ]
        },
        "checkbox_group_control": {
            "title": "Вы согласны с правилами?",
            "default": [],
            "type": "string",
            "enum": [
                "number_1",
                "number_2",
                "number_3",
                "number_4"
            ]
        },
        "switch_control": {
            "title": "Включить настройки",
            "type": "boolean"
        },
        "slider": {
            "title": "Какая сумма интересует",
            "type": "number"
        },
        "slider_range": {
            "title": "Какая сумма интересует",
            "type": "array",
            "items": {
                "type": "number"
            }
        },
        "date_control": {
            "title": "День рождения",
            "format": "date",
            "type": "string"
        },
        "datetime_control": {
            "title": "День и время рождения",
            "format": "date-time",
            "type": "string"
        },
        "time_control": {
            "title": "Время рождения",
            "format": "time",
            "type": "string"
        },
        "date_range_control": {
            "title": "Выберите даты",
            "format": "date",
            "type": "array",
            "items": {
                "type": "string",
                "format": "date"
            },
            "minItems": 2,
            "maxItems": 2
        }
    },
    "required": [
        "text_validation_input"
    ]
}
''';
