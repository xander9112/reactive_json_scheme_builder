const uiSchemaStr = r'''
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
                "lg": 24,
                "md": 24,
                "sm": 24,
                "xs": 24
            },
            "elements": [
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 12,
                        "md": 12,
                        "sm": 12,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/firstName",
                            "label": "firstName",
                            "options": {
                                "name": "firstName",
                                "bordered": true
                            }
                        },
                        {
                            "type": "INPUT_NUMBER",
                            "scope": "#/properties/rating",
                            "label": "rating",
                            "options": {
                                "name": "rating",
                                "bordered": true
                            }
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 12,
                        "md": 12,
                        "sm": 12,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/lastName",
                            "label": "lastName",
                            "options": {
                                "name": "lastName",
                                "size": "middle",
                                "type": "text",
                                "bordered": true,
                                "maxLength": 3
                            }
                        }
                    ]
                }               
            ]
        },
        {
            "type": "INPUT_NUMBER",
            "scope": "#/properties/age",
            "label": "age",
            "options": {
                "name": "age",
                "bordered": true
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
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 8,
                        "md": 8,
                        "sm": 12,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "DROP_DOWN",
                            "scope": "#/properties/gender",
                            "label": "gender",
                            "options": {
                                "name": "gender",
                                "items": {
                                    "Male": "Male",
                                    "Female": "Female",
                                    "Undisclosed": "Undisclosed"
                                },
                                "bordered": true
                            }
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 8,
                        "md": 8,
                        "sm": 12,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "INPUT_NUMBER",
                            "scope": "#/properties/height",
                            "label": "height",
                            "options": {
                                "name": "height",
                                "bordered": true
                            }
                        }
                    ]
                },
                {
                    "type": "GRID_COMPONENT",
                    "options": {
                        "lg": 8,
                        "md": 8,
                        "sm": 24,
                        "xs": 24
                    },
                    "elements": [
                        {
                            "type": "INPUT_TEXT",
                            "scope": "#/properties/dateOfBirth",
                            "label": "dateOfBirth",
                            "options": {
                                "name": "dateOfBirth",
                                "bordered": true
                            }
                        }
                    ]
                }
            ]
        },
        {
            "type": "SWITCH",
            "scope": "#/properties/committer",
            "label": "committer",
            "options": {
                "name": "committer",
                "bordered": true
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
                    "label": "street",
                    "options": {
                        "name": "street",
                        "bordered": true
                    }
                },
                {
                    "type": "INPUT_NUMBER",
                    "scope": "#/properties/address/properties/number",
                    "label": "number",
                    "options": {
                        "name": "number",
                        "bordered": true
                    }
                },
                {
                    "type": "INPUT_NUMBER",
                    "scope": "#/properties/address/properties/postalCode",
                    "label": "postalCode",
                    "options": {
                        "name": "postalCode",
                        "bordered": true
                    }
                },
                {
                    "type": "INPUT_TEXT",
                    "scope": "#/properties/address/properties/city",
                    "label": "city",
                    "options": {
                        "name": "city",
                        "bordered": true
                    }
                }
            ]
        },
        {
            "type": "BUTTON",
            "label": "Button",
            "options": {
                "type": "default",
                "htmlType": "button"
            }
        }
    ]
}
''';
