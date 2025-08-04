const jsonSchemaStr = r'''
{
 "$schema": "http://json-schema.org/draft-07/schema#",
 "type": "object",
 "properties": {
  "addresses": {
   "type": "array",
   "items": [
    {
     "title": "Улица",
     "description": "Улица",
     "type": "string"
    },
    {
     "title": "Дом",
     "description": "Дом",
     "type": "integer"
    },
    {
     "title": "Квартал",
     "type": "object",
     "properties": {
      "num": {
       "title": "Номер квартала",
       "description": "Номер квартала",
       "type": "number"
      }
     }
    }
   ]
  }
 }
}
''';
