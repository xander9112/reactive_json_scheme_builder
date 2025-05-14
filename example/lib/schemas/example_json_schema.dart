const exampleJsonSchemaStr = r'''
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "title": "Профиль пользователя",
    "type": "object",
    "required": [
        "firstName",
        "lastName",
        "email",
        "phone",
        "birthDate",
        "gender",
        "title"
    ],
    "properties": {
        "firstName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 50,
            "title": "Имя"
        },
        "lastName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 50,
            "title": "Фамилия"
        },
        "email": {
            "type": "string",
            "format": "email",
            "title": "Электронная почта"
        },
        "phone": {
            "type": "string",
            "pattern": "^\\+?[1-9]\\d{1,14}$",
            "title": "Номер телефона"
        },
        "birthDate": {
            "type": "string",
            "format": "date",
            "title": "Дата рождения"
        },
        "gender": {
            "type": "string",
            "enum": [
                "male",
                "female",
                "other"
            ],
            "title": "Пол"
        },
        "city": {
            "type": "string",
            "enum": [
                ""
            ],
            "title": "Город"
        },
        "position": {
            "type": "string",
            "maxLength": 100,
            "title": "Должность"
        },
        "department": {
            "type": "string",
            "maxLength": 100,
            "title": "Отдел"
        },
        "about": {
            "type": "string",
            "maxLength": 500,
            "title": "О себе"
        },
        "photoUrl": {
            "type": "string",
            "format": "uri",
            "title": "Фото профиля (URL)"
        },
        "title": {
            "type": "string",
            "minLength": 1,
            "maxLength": 100,
            "title": "Должность"
        }
    }
}
''';
