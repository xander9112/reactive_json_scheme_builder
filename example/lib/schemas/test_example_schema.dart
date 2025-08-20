const textExampleUiSchema = r'''
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
    }
  ]
}

''';

const testExampleJsonSchema = r'''
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
    }
  }
}
''';
