const exampleUiSchemaStr = r'''
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
                      "type": "INPUT_TEXT",
                      "scope": "#/properties/firstName",
                      "label": "Имя",
                      "options": {
                          "bordered": true,
                          "name": "firstName"
                      }
                  },
                  {
                      "type": "INPUT_TEXT",
                      "scope": "#/properties/lastName",
                      "label": "Фамилия",
                      "options": {
                          "bordered": true,
                          "name": "lastName"
                      }
                  }
              ]
          },
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
                      "type": "INPUT_TEXT",
                      "scope": "#/properties/email",
                      "label": "Электронная почта",
                      "options": {
                          "bordered": true,
                          "name": "email"
                      }
                  },
                  {
                      "type": "INPUT_TEXT",
                      "scope": "#/properties/phone",
                      "label": "Номер телефона",
                      "options": {
                          "bordered": true,
                          "name": "phone"
                      }
                  },
                  {
                      "type": "DATE",
                      "scope": "#/properties/birthDate",
                      "label": "Дата рождения",
                      "options": {
                          "bordered": true,
                          "name": "birthDate"
                      }
                  }
              ]
          },
        {
            "type": "DROP_DOWN",
            "scope": "#/properties/gender",
            "label": "Пол",
            "options": {
                "bordered": true,
                "data": {
                    "items": {
                        "male": "Мужской",
                        "female": "Женский",
                        "other": "Другое"
                    }
                },
                "name": "gender"
            }
        },
        {
            "type": "INPUT_TEXT",
            "scope": "#/properties/position",
            "label": "Должность",
            "options": {
                "bordered": true,
                "name": "position"
            }
        },
        {
            "type": "INPUT_TEXT",
            "scope": "#/properties/department",
            "label": "Отдел",
            "options": {
                "bordered": true,
                "name": "department"
            }
        },
        {
            "type": "TEXT_AREA",
            "scope": "#/properties/about",
            "label": "О себе",
            "options": {
                "bordered": true,
                "name": "about"
            }
        },
        {
            "type": "INPUT_TEXT",
            "scope": "#/properties/photoUrl",
            "label": "Фото профиля (URL)",
            "options": {
                "bordered": true,
                "name": "photoUrl"
            }
        },
        {
            "type": "INPUT_TEXT",
            "scope": "#/properties/title",
            "label": "Должность",
            "options": {
                "bordered": true,
                "name": "title"
            }
        },
        {
            "type": "BUTTON",
            "label": "Сохранить",
            "options": {
                "type": "default",
                "htmlType": "submit"
            }
        }
    ]
}
''';
