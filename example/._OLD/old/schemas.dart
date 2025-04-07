const schema = '''
{
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

const uiSchema = '''
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
                "xs": 24,
                "sm": 24,
                "md": 24,
                "lg": 24
            },
            "elements": [
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "xs": 12,
                        "sm": 12,
                        "md": 12,
                        "lg": 12
                    },
                    "elements": [
                        {
                            "type": "INPUT_TEXT_SEARCH",
                            "scope": "#/properties/firstName",
                            "label": "Имя",
                            "options": {
                                "_selectable": true,
                                "name": "firstName"
                            }
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "xs": 12,
                        "sm": 12,
                        "md": 12,
                        "lg": 12
                    },
                    "elements": [
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/lastName",
                            "label": "Фамилия",
                            "options": {
                                "_selectable": true,
                                "name": "lastName"
                            }
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "xs": 12,
                        "sm": 12,
                        "md": 12,
                        "lg": 12
                    }
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "xs": 12,
                        "sm": 12,
                        "md": 12,
                        "lg": 12
                    }
                }
            ]
        },
        {
            "type": "INPUT_TEXT",
            "scope": "#/properties/email",
            "label": "Электронная почта",
            "options": {
                "_selectable": true,
                "name": "email"
            }
        },
        {
            "type": "INPUT_TEXT",
            "scope": "#/properties/phone",
            "label": "Телефон",
            "options": {
                "_selectable": true,
                "name": "phone"
            }
        },
        {
            "type": "INPUT_TEXT",
            "scope": "#/properties/birthDate",
            "label": "Дата рождения",
            "options": {
                "_selectable": true,
                "name": "birthDate"
            }
        },
        {
            "type": "DROP_DOWN",
            "scope": "#/properties/gender",
            "label": "Пол",
            "options": {
                "_selectable": true,
                "items": {
                    "Мужской": "Мужской",
                    "Женский": "Женский",
                    "Другой": "Другой"
                },
                "name": "gender"
            }
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
                    "scope": "#/properties/address/properties/street",
                    "label": "Улица",
                    "options": {
                        "_selectable": true,
                        "name": "street",
                        "dict": "sex",
                        queryParam
                    }
                },
                {
                    "type": "INPUT_TEXT",
                    "scope": "#/properties/address/properties/city",
                    "label": "Город",
                    "options": {
                        "_selectable": true,
                        "name": "city"
                    }
                },
                {
                    "type": "INPUT_INT",
                    "scope": "#/properties/address/properties/postalCode",
                    "label": "Почтовый индекс",
                    "options": {
                        "_selectable": true,
                        "name": "postalCode"
                    }
                }
            ]
        }
    ]
}
''';


// "objectExample": {
//       "type": "object",
//       "description": "Пример вложенного объекта",
//       "properties": {
//         "nestedString": {
//           "type": "string",
//           "minLength": 3
//         },
//         "nestedNumber": {
//           "type": "number",
//           "minimum": 0
//         }
//       },
//       "required": ["nestedString"]
//     },


// "items": {
//       "type": "array",
//       "items": {
//         "type": "object",
//         "properties": {
//           "productId": {
//             "type": "string",
//             "description": "Идентификатор продукта."
//           },
//           "productName": {
//             "type": "string",
//             "description": "Название продукта."
//           },
//           "quantity": {
//             "type": "integer",
//             "minimum": 1,
//             "description": "Количество товара."
//           },
//           "price": {
//             "type": "number",
//             "minimum": 0,
//             "description": "Цена товара."
//           },
//           "discounts": {
//             "type": "array",
//             "items": {
//               "type": "object",
//               "properties": {
//                 "discountCode": {
//                   "type": "string",
//                   "description": "Код скидки."
//                 },
//                 "discountValue": {
//                   "type": "number",
//                   "description": "Размер скидки."
//                 }
//               },
//               "required": ["discountCode", "discountValue"]
//             },
//             "description": "Список скидок, применяемых к товару."
//           }
//         },
//         "required": ["productId", "productName", "quantity", "price"]
//       },
//       "minItems": 1,
//       "description": "Список товаров в заказе."
//     },