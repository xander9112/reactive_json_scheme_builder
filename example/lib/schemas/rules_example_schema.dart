const rulesExampleUiSchema = r'''
{
  "type": "VerticalLayout",
  "elements": [
    {
      "type": "INPUT_TEXT",
      "label": "Name",
      "scope": "#/properties/name",
      "options": {
        "name": "companyName",
        "type": "string",
        "title": "Название компании",
        "bordered": true,
        "description": "Название компании"
      }
    },
    {
      "type": "SWITCH",
      "label": "Is Dead?",
      "scope": "#/properties/dead"
    },
    {
      "type": "DROP_DOWN",
      "label": "Kind of dead",
      "scope": "#/properties/kindOfDead",
      "options": {
          "data": {
                      "items": {
                        "Zombie": "Zombie",
                        "Vampire":"Vampire",
                        "Ghoul":"Ghoul"
                        }
                  },
            "name": "kindOfDead",
            "type": "string",
            "title": "Kind of dead",
            "bordered": true,
            "listHeight": 256,
             "description": "Kind of dead"
      },
      "rule": {
        "effect": "ENABLE",
        "condition": {
          "scope": "#/properties/dead",
          "schema": {
            "not": {
              "const": true
            }
          }
        }
      }
    },
    {
      "type": "SWITCH",
      "label": "Eats vegetables?",
      "scope": "#/properties/vegetables"
    },
    {
      "type": "DROP_DOWN",
      "label": "Kind of vegetables",
      "scope": "#/properties/kindOfVegetables",
      "options": {
          "data": {
                      "items": {
                        "All": "All",
                        "Some":"Some",
                        "Only potatoes":"Only potatoes"
                        }
                  },
            "name": "Kind of vegetables",
            "type": "string",
            "title": "Kind of vegetables",
            "bordered": true,
            "listHeight": 256,
             "description": "Kind of vegetables"
      },
      "rule": {
        "effect": "HIDE",
        "condition": {
          "scope": "#/properties/vegetables",
          "schema": {
            "const": false
          }
        }
      }
    },
    {
      "type": "DROP_DOWN",
      "label": "Vitamin deficiency?",
      "scope": "#/properties/vitaminDeficiency",
       "options": {
          "data": {
                      "items": {
                        "None": "None",
                        "Vitamin A": "Vitamin A",
                        "Vitamin B": "Vitamin B",
                        "Vitamin C": "Vitamin C"
                        }
                  }, 
            "name": "Vitamin deficiency?",
            "type": "string",
            "title": "Vitamin deficiency?",
            "bordered": true,
            "listHeight": 256,
             "description": "Vitamin deficiency?"
      },
      "rule": {
        "effect": "SHOW",
        "condition": {
          "scope": "#"
        }
      }
    },
    {
      "type": "INPUT_NUMBER",
      "label": "NUMBER",
      "scope": "#/properties/number",
      "options": {
        "name": "Integer",
        "type": "string",
        "title": "Integer",
        "bordered": true,
        "description": "Integer"
      }
    },
    {
      "type": "INPUT_NUMBER",
      "label": "NUMBER1",
      "scope": "#/properties/number1",
      "options": {
        "name": "Integer1",
        "type": "string",
        "title": "Integer1",
        "bordered": true,
        "description": "Integer1"
      },
      "rule": {
        "effect": "SHOW",
        "condition": {
          "scope": "#/properties/number",
          "schema": {
            "minimum": 1,
            "exclusiveMaximum": 10
          },
          "failWhenUndefined": true
        }
      }
    },
    {
      "type": "INPUT_TEXT",
      "label": "Проверка Contains, наберите test",
      "scope": "#/properties/contains",
      "options": {
        "name": "contains",
        "type": "string",
        "title": "contains",
        "bordered": true,
        "description": "contains"
      }
    },
    {
      "type": "INPUT_TEXT",
      "label": "Видно если выше поле содержит test",
      "scope": "#/properties/contains1",
      "options": {
        "name": "contains1",
        "type": "string",
        "title": "contains1",
        "bordered": true,
        "description": "contains1"
      },
      "rule": {
        "effect": "SHOW",
        "condition": {
          "scope": "#/properties/contains",
          "schema": {
            "contains": { "const": "test"}
          },
          "failWhenUndefined": true
        }
      }
    },
     {
      "type": "INPUT_TEXT",
      "label": "Видно если заполнены поля name,contains, number и kindOfDead, contains содержит test, name равен test, number от 1 включительно до 10 не включительно и kindOfDead выбран Vampire ",
      "scope": "#/properties/required",
      "options": {
        "name": "required",
        "type": "string",
        "title": "required",
        "bordered": true,
        "description": "required"
      },
      "rule": {
        "effect": "SHOW",
        "condition": {
          "scope": "#",
          "schema": {
            "properties": {
                "contains": { "contains": { "const": "test"  } },
                "name": { "const": "test" },
                "number":{ "minimum": 1, "exclusiveMaximum": 10 },
                "kindOfDead": { "enum": ["Vampire"]}
            },
            "required": ["name", "contains", "number", "kindOfDead"]
          },
          "failWhenUndefined": true
        }
      }
    }
  ]
}

''';

const rulesExampleJsonSchema = r'''
{
  "type": "object",
  "properties": {
    "name": {
      "type": "string"
    },
    "dead": {
      "type": "boolean"
    },
    "kindOfDead": {
      "type": "string",
      "enum": [
        "Zombie",
        "Vampire",
        "Ghoul"
      ]
    },
    "vegetables": {
      "type": "boolean"
    },
    "kindOfVegetables": {
      "type": "string",
      "enum": [
        "All",
        "Some",
        "Only potatoes"
      ]
    },
    "vitaminDeficiency": {
      "type": "string",
      "enum": [
        "None",
        "Vitamin A",
        "Vitamin B",
        "Vitamin C"
      ]
    },
    "number": {
      "type": "integer"
    },
    "number1": {
      "type": "integer"
    },
    "contains": {
      "type": "string"
    },
    "contains1": {
      "type": "string"
    },
     "required": {
      "type": "string"
    }
  }
}
''';
