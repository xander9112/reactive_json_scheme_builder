const shortUiSchemaStr = r'''
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
        },
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
}
''';
