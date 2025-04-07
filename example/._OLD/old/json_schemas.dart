const newSchema = r'''
{
"$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Личный профиль",
  "type": "object",
  "properties": {
    "firstName": {
      "type": "string",
      "title": "Имя",
      "description": "Введите ваше имя"
    },
    "lastName": {
      "type": "string",
      "title": "Фамилия",
      "description": "Введите вашу фамилию"
    },
    "email": {
      "type": "string",
      "format": "email",
      "title": "Электронная почта",
      "description": "Введите ваш email"
    },
    "phone": {
      "type": "string",
      "title": "Телефон",
      "description": "Введите ваш номер телефона"
    },
    "birthDate": {
      "type": "string",
      "format": "date",
      "title": "Дата рождения",
      "description": "Выберите дату рождения"
    },
    "gender": {
      "type": "string",
      "title": "Пол",
      "description": "Выберите ваш пол",
      "enum": ["Мужской", "Женский", "Другой"]
    },
    "address": {
      "type": "object",
      "title": "Адрес",
      "properties": {
        "street": {
          "type": "string",
          "title": "Улица",
          "description": "Введите название улицы"
        },
        "city": {
          "type": "string",
          "title": "Город",
          "description": "Введите название города"
        },
        "postalCode": {
          "type": "integer",
          "title": "Почтовый индекс",
          "description": "Введите почтовый индекс"
        }
      }
    }
  },
  "required": ["firstName", "lastName", "email"]
}
''';
const creditSchema = r'''
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "type": "object",
  "title": "Кредитная заявка",
  "properties": {
    "applicant": {
      "type": "object",
      "title": "Заявитель",
      "properties": {
        "fullName": {
          "type": "string",
          "title": "ФИО"
        },
        "birthDate": {
          "type": "string",
          "format": "date",
          "title": "Дата рождения"
        },
        "passportNumber": {
          "type": "string",
          "title": "Номер паспорта"
        },
        "income": {
          "type": "number",
          "title": "Ежемесячный доход",
          "minimum": 0
        },
        "employmentStatus": {
          "type": "string",
          "enum": ["Работающий", "Безработный", "Пенсионер", "Студент"],
          "title": "Статус занятости"
        }
      },
      "required": ["fullName", "birthDate", "passportNumber", "income"]
    },
    "loanDetails": {
      "type": "object",
      "title": "Детали кредита",
      "properties": {
        "amount": {
          "type": "number",
          "title": "Сумма кредита",
          "minimum": 1000
        },
        "termMonths": {
          "type": "integer",
          "title": "Срок кредита (в месяцах)",
          "minimum": 1
        },
        "purpose": {
          "type": "string",
          "title": "Цель кредита",
          "enum": ["Покупка авто", "Ипотека", "Потребительский", "Рефинансирование"]
        }
      },
      "required": ["amount", "termMonths"]
    },
    "contactInfo": {
      "type": "object",
      "title": "Контактная информация",
      "properties": {
        "phone": {
          "type": "string",
          "title": "Телефон",
          "pattern": "^+?[0-9-s]+$"
        },
        "email": {
          "type": "string",
          "format": "email",
          "title": "Email"
        }
      },
      "required": ["phone"]
    }
  },
  "required": ["applicant", "loanDetails", "contactInfo"]
}
''';

const jsonForms = r'''
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "type": "object",
  "required": [
    "age"
  ],
  "properties": {
    "firstName": {
      "type": "string",
      "minLength": 2,
      "maxLength": 20
    },
    "lastName": {
      "type": "string",
      "minLength": 5,
      "maxLength": 15
    },
    "age": {
      "type": "integer",
      "minimum": 18,
      "maximum": 100
    },
    "gender": {
      "type": "string",
      "enum": [
        "Male",
        "Female",
        "Undisclosed"
      ]
    },
    "height": {
      "type": "number"
    },
    "dateOfBirth": {
      "type": "string",
      "format": "date"
    },
    "rating": {
      "type": "integer"
    },
    "committer": {
      "type": "boolean"
    },
    "address": {
      "type": "object",
      "properties": {
        "street": {
          "type": "string"
        },
        "streetnumber": {
          "type": "string"
        },
        "postalCode": {
          "type": "string"
        },
        "city": {
          "type": "string"
        }
      }
    }
  }
}
''';

const jsonFormsUiSchema = r'''
{
  "type": "VerticalLayout",
  "elements": [
    {
      "type": "HorizontalLayout",
      "elements": [
        {
          "type": "Control",
          "scope": "#/properties/firstName"
        },
        {
          "type": "Control",
          "scope": "#/properties/lastName"
        }
      ]
    },
    {
      "type": "HorizontalLayout",
      "elements": [
        {
          "type": "Control",
          "scope": "#/properties/age"
        },
        {
          "type": "Control",
          "scope": "#/properties/dateOfBirth"
        }
      ]
    },
    {
      "type": "HorizontalLayout",
      "elements": [
        {
          "type": "Control",
          "scope": "#/properties/height"
        },
        {
          "type": "Control",
          "scope": "#/properties/gender"
        },
        {
          "type": "Control",
          "scope": "#/properties/committer"
        }
      ]
    },
    {
      "type": "Group",
      "label": "Address for Shipping T-Shirt",
      "elements": [
        {
          "type": "HorizontalLayout",
          "elements": [
            {
              "type": "Control",
              "scope": "#/properties/address/properties/street"
            },
            {
              "type": "Control",
              "scope": "#/properties/address/properties/streetnumber"
            }
          ]
        },
        {
          "type": "HorizontalLayout",
          "elements": [
            {
              "type": "Control",
              "scope": "#/properties/address/properties/postalCode"
            },
            {
              "type": "Control",
              "scope": "#/properties/address/properties/city"
            }
          ]
        }
      ],
      "rule": {
        "effect": "ENABLE",
        "condition": {
          "scope": "#/properties/committer",
          "schema": {
            "const": true
          }
        }
      }
    }
  ]
}
''';
