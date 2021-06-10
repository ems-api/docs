# Segments

## List segments endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\ListSegments();
```

```ruby
# CREATE THE ENDPOINT
endpoint = ListSegments.new
```

```python
from mailwizz.endpoint.list_segments import ListSegments

"""
CREATE THE ENDPOINT
"""
endpoint = ListSegments()
```

## Get all list segments
```php
// GET ALL ITEMS
$response = $endpoint->getSegments('LIST-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ALL SEGMENTS OF A LIST
response = endpoint.get_segments('LIST_UID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ALL SEGMENTS OF A LIST
"""
response = endpoint.get_segments(list_uid='LIST_UID')

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
    "count": "1",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "segment_uid": "yx536w32xt946",
        "name": "test",
        "subscribers_count": 289
      }
    ]
  }
}
```
This endpoint retrieves all the segments of a list.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/segments`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
pageNumber | 1 | Current page to retrieve.
perPage | 10 | Items per page to retrieve.
LIST-UNIQUE-ID | | The list unique identifier
