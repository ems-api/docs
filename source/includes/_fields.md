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

| Parameter      | Default | Description                 |
|----------------|---------|-----------------------------|
| pageNumber     | 1       | Current page to retrieve.   |
| perPage        | 10      | Items per page to retrieve. |
