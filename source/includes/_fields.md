# Fields

## List fields endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\ListFields();
```

```ruby
# CREATE THE ENDPOINT
endpoint = ListFields.new
```

```python
from mailwizz.endpoint.list_fields import ListFields

"""
CREATE THE ENDPOINT
"""
endpoint = ListFields()
```

## Get all list fields
```php
// GET ALL ITEMS
$response = $endpoint->getFields('LIST-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ALL FIELDS OF A LIST
response = endpoint.get_fields('LIST_UID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ALL FIELDS OF A LIST
"""
response = endpoint.get_fields(list_uid='LIST_UID')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "records": [
      {
        "field_id": "12",
        "tag": "EMAIL",
        "label": "Email",
        "required": "yes",
        "help_text": null,
        "type": {
          "name": "Text",
          "identifier": "text",
          "description": "Text"
        }
      },
      {
        "field_id": "13",
        "tag": "FNAME",
        "label": "First name",
        "required": "no",
        "help_text": null,
        "type": {
          "name": "Text",
          "identifier": "text",
          "description": "Text"
        }
      },
      {
        "field_id": "14",
        "tag": "LNAME",
        "label": "Last name",
        "required": "no",
        "help_text": null,
        "type": {
          "name": "Text",
          "identifier": "text",
          "description": "Text"
        }
      }
    ]
  }
}
```
This endpoint retrieves all the fields of a list.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/fields`

### URL Segments

| Segment        | Required | Description                 |
|----------------|----------|-----------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier  |

### Query Parameters

| Parameter | Default | Description                 |
|-----------|---------|-----------------------------|
| page      | 1       | Current page to retrieve.   |
| per_page  | 10      | Items per page to retrieve. |

## Get one list field
```php
// GET ONE ITEM
$response = $endpoint->getField('LIST-UNIQUE-ID', 'FIELD-ID');

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "record": {
      "field_id": "13",
      "tag": "FNAME",
      "label": "First name",
      "required": "no",
      "help_text": null,
      "type": {
        "name": "Text",
        "identifier": "text",
        "description": "Text" 
      }
    }
  }
}
```
This endpoint retrieves the list field with the given FIELD-ID for the given LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/fields/FIELD-ID`

### URL Segments

| Segment        | Required | Description                           |
|----------------|----------|---------------------------------------|
| LIST-UNIQUE-ID | yes      | List unique id to retrieve field for. |
| FIELD-ID       | yes      | List field id to retrieve             |


## Create a list field

```php 
// create a new list field
$response = $endpoint->create('LIST-UNIQUE-ID', [
  'type'           => 'dropdown',
  'label'         => 'Text Label',
  'tag'           => 'DROPDOWN',
  'required'      => 'no',
  'visibility'    => 'visible',
  'sort_order'    => 0,
  'help_text'     => 'Help',
  'default_value' => '',
  'description'   => 'Description',
  'options'        => [
    [
      'name'  => 'Option1',
      'value' => 'Value1'
    ],
    [
      'name'  => 'Option2',
      'value' => 'Value2'
    ],
  ]
]);

// and get the response
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "record": {
      "field_id": "138",
      "label": "Text Label",
      "tag": "DROPDOWN",
      "help_text": "Help",
      "description": "Description",
      "default_value": "",
      "required": "no",
      "visibility": "visible",
      "sort_order": "0",
      "type": {
        "name": "Dropdown",
        "identifier": "dropdown",
        "description": "Dropdown"
      },
      "list": {
        "list_uid": "wo16508sn983b",
        "display_name": "My list"
      },
      "options": {
        "Value1": "Option1",
        "Value2": "Option2"
      }
    }
  }
}
```
This endpoint creates a list field.

The data param can contain following indexed arrays:

-> options - optional

### HTTP Request

`POST API-URL/lists/LIST_UID/fields`

### POST Parameters

| Parameter | Type  | Required | Description                                                                           |
|-----------|-------|----------|---------------------------------------------------------------------------------------|
| data      | array | yes      | Array with the list field details. The following indexed arrays are accepted: options |

**General block - required**

| Parameter     | Type   | Required | Description                                                       |
|---------------|--------|----------|-------------------------------------------------------------------|
| type          | string | yes      | The field type check the field types endpoint for possible values |
| label         | string | yes      | The label of the field                                            |
| tag           | string | yes      | The unique tag                                                    |
| required      | string | yes      | Whether the field is required or not (yes/no)                     |
| visibility    | string | yes      | Whether the field is visible or not (hidden/visible)              |
| default_value | string | no       | The field default value                                           |
| sort_order    | int    | no       | The field showing order in the form                               |
| help_text     | string | no       | The field help text                                               |
| description   | string | no       | The field description                                             |

**Options block - optional**

| Parameter | Type   | Required | Description                             |
|-----------|--------|----------|-----------------------------------------|
| name      | string | yes      | The option name to show in the dropdown |
| value     | string | yes      | The option value for the dropdown       |

## Update a list field

```php 
// update list field
$response = $endpoint->update('LIST-UNIQUE-ID', 'FIELD-ID', [
  'label'         => 'Text Label',
  'tag'           => 'DROPDOWN',
  'required'      => 'no',
  'visibility'    => 'visible',
  'sort_order'    => 0,
  'help_text'     => 'Help',
  'default_value' => '',
  'description'   => 'Description',
  'options'        => [
    [
      'name'  => 'Option1',
      'value' => 'Value1'
    ],
    [
      'name'  => 'Option2',
      'value' => 'Value2'
    ],
  ]
]);

// and get the response
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "record": {
      "field_id": "138",
      "label": "Text Label",
      "tag": "DROPDOWN",
      "help_text": "Help",
      "description": "Description",
      "default_value": "",
      "required": "no",
      "visibility": "visible",
      "sort_order": "0",
      "type": {
        "name": "Dropdown",
        "identifier": "dropdown",
        "description": "Dropdown"
      },
      "list": {
        "list_uid": "wo16508sn983b",
        "display_name": "My list"
      },
      "options": {
        "Value1": "Option1",
        "Value2": "Option2"
      }
    }
  }
}
```
This endpoint updates a list field.

### HTTP Request

`PUT API-URL/lists/LIST-UNIQUE-ID/fields/FIELD-ID`

### URL Segment

| Segment        | Type   | Required | Description            |
|----------------|--------|----------|------------------------|
| LIST-UNIQUE-ID | string | yes      | List unique identifier |
| FIELD-ID       | string | yes      | List field id          |

### PUT Parameters

| Parameter      | Type   | Required | Description                                                                                                              |
|----------------|--------|----------|--------------------------------------------------------------------------------------------------------------------------|
| data           | array  | yes      | Array with the list field details. The following indexed arrays are accepted: options See the create section for details |

**General block - required**

| Parameter     | Type   | Required | Description                                                       |
|---------------|--------|----------|-------------------------------------------------------------------|
| label         | string | yes      | The label of the field                                            |
| tag           | string | yes      | The unique tag                                                    |
| required      | string | yes      | Whether the field is required or not (yes/no)                     |
| visibility    | string | yes      | Whether the field is visible or not (hidden/visible)              |
| default_value | string | no       | The field default value                                           |
| sort_order    | int    | no       | The field showing order in the form                               |
| help_text     | string | no       | The field help text                                               |
| description   | string | no       | The field description                                             |

**Options block - optional**

| Parameter | Type   | Required | Description                             |
|-----------|--------|----------|-----------------------------------------|
| name      | string | yes      | The option name to show in the dropdown |
| value     | string | yes      | The option value for the dropdown       |


## Delete a list field
```php
// Delete FIELD
$response = $endpoint->delete('LIST-UNIQUE-ID', 'FIELD-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```

This endpoint will delete the list field with the given FIELD-ID for the LIST-UNIQUE-ID.

### HTTP Request

`DELETE API-URL/lists/LIST-UNIQUE-ID/fields/LIST-ID`

### URL Segments

| Segment        | Required | Description               |
|----------------|----------|---------------------------|
| LIST-UNIQUE-ID | yes      | List unique id to delete. |
| FIELD-ID       | yes      | List field id to delete   |

## Get all list field types
```php
// GET ALL ITEMS
$response = $endpoint->getListFieldTypes();

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "count": "20",
    "records": [
      {
        "name": "Text",
        "identifier": "text",
        "description": "Text"
      },
      {
        "name": "Dropdown",
        "identifier": "dropdown",
        "description": "Dropdown"
      },
      {
        "name": "Multiselect",
        "identifier": "multiselect",
        "description": "Multiselect"
      },
      {
        "name": "Date",
        "identifier": "date",
        "description": "Date"
      },
      {
        "name": "Datetime",
        "identifier": "datetime",
        "description": "Datetime"
      },
      {
        "name": "Textarea",
        "identifier": "textarea",
        "description": "Textarea"
      },
      {
        "name": "Country",
        "identifier": "country",
        "description": "Country"
      },
      {
        "name": "State",
        "identifier": "state",
        "description": "State"
      },
      {
        "name": "Checkbox List",
        "identifier": "checkboxlist",
        "description": "Checkbox List"
      },
      {
        "name": "Radio List",
        "identifier": "radiolist",
        "description": "Radio List"
      },
      {
        "name": "Geo Country",
        "identifier": "geocountry",
        "description": "Geo Country"
      },
      {
        "name": "Geo State",
        "identifier": "geostate",
        "description": "Geo State"
      },
      {
        "name": "Geo City",
        "identifier": "geocity",
        "description": "Geo City"
      },
      {
        "name": "Checkbox",
        "identifier": "checkbox",
        "description": "Checkbox"
      },
      {
        "name": "Consent Checkbox",
        "identifier": "consentcheckbox",
        "description": "Consent Checkbox"
      },
      {
        "name": "Years Range",
        "identifier": "yearsrange",
        "description": "Years Range"
      },
      {
        "name": "Phone Number",
        "identifier": "phonenumber",
        "description": "Phone Number"
      },
      {
        "name": "Email",
        "identifier": "email",
        "description": "Email"
      },
      {
        "name": "Url",
        "identifier": "url",
        "description": "Url"
      },
      {
        "name": "Rating",
        "identifier": "rating",
        "description": "Rating"
      }
    ]
  }
}
```
This endpoint retrieves all the list field types.

### HTTP Request

`GET API-URL/lists/fields/types`
