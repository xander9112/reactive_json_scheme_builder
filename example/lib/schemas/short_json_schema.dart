const shortJsonSchemaStr = r'''
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
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
    }
}
''';
