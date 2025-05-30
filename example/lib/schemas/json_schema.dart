const jsonSchemaStr = r'''
{
  "$schema": "http://json-schema.org/draft-07/schema#",
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
        "number": {
          "type": "number"
        },
        "postalCode": {
          "type": "integer"
        },
        "city": {
          "type": "string"
        }
      }
    }
  }
}
''';
