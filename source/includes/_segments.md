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

### URL Segments

| Segment        | Required | Description                 |
|----------------|----------|-----------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier  |

### Query Parameters

| Parameter | Default | Description                 |
|-----------|---------|-----------------------------|
| page      | 1       | Current page to retrieve.   |
| per_page  | 10      | Items per page to retrieve. |

## Get one list segment
```php
// GET ONE ITEM
$response = $endpoint->getSegment('SEGMENT-UNIQUE-ID');

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
      "segment_uid": "sx795qzttl9bb",
      "segment_id": "11",
      "name": "my segment with cond updated",
      "operator_match": "any",
      "date_added": "10/23/23, 2:36 PM",
      "subscribers_count": 0,
      "conditions": [
        {
          "field_id": "96",
          "operator_id": "3",
          "value": "keyword"
        }
      ],
      "campaign_conditions": []
    }
  }
}
```
This endpoint retrieves the list segment with the given SEGMENT-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/segments/SEGMENT-UNIQUE-ID`

### URL Segments

| Segment           | Required | Description                             |
|-------------------|----------|-----------------------------------------|
| LIST-UNIQUE-ID    | yes      | List unique id to retrieve segment for. |
| SEGMENT-UNIQUE-ID | yes      | Segment unique id to retrieve           |

## Create a list segment

```php 
// create a new list segment
$response = $endpoint->create('LIST-UNIQUE-ID', [
    // required
    'name'           => 'My list segment created from the API', // required
    'operator_match' => 'any', // required (any/all)
    // optional
    'conditions' => [
        [
            'field_id'    => '96', // required . 
            'operator_id' => '3', // required .  See the API-URL/lists/segments/condition-operators endpoint
            'value'       => 'domain.com', // required
        ],
        [
            'field_id'    => '95', // required . 
            'operator_id' => '4', // required .  See the API-URL/lists/segments/condition-operators endpoint
            'value'       => 'keyword', // required
        ]
    ],
    'campaign_conditions' => [
        [
            'action'                   => 'click', // required (click/open)
            'campaign_id'              => '100', // required
            'time_comparison_operator' => 'lte', // required (lte/lt/gte/gt/eq)
            'time_value'               => '3', // required
            'time_unit'                => 'day' // required (day/month/year)
        ],
        [
            'action'                   => 'open', // required (click/open)
            'campaign_id'              => '99', // required
            'time_comparison_operator' => 'gte', // required (lte/lt/gte/gt/eq)
            'time_value'               => '3', // required
            'time_unit'                => 'month' // required (day/month/year)
        ]
    ],
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
      "segment_uid": "xs655vtkcx569",
      "name": "my segment with cond"
    }
  }
}
```
This endpoint creates a list segment.

The data param can contain following indexed arrays:

-> conditions - optional

-> campaign_conditions - optional

### HTTP Request

`POST API-URL/lists/LIST_UID/segments`

### POST Parameters

| Parameter | Type  | Required | Description                                                                                                      |
|-----------|-------|----------|------------------------------------------------------------------------------------------------------------------|
| data      | array | yes      | Array with the list segment details. The following indexed arrays are accepted: conditions, campaign_conditions, |

**General block - required**

| Parameter      | Type   | Required | Description                                   |
|----------------|--------|----------|-----------------------------------------------|
| name           | string | yes      | List segment name                             |
| operator_match | string | yes      | Operator to match all the conditions: any/all |

**Conditions block - optional**

| Parameter   | Type   | Required | Description                                                           |
|-------------|--------|----------|-----------------------------------------------------------------------|
| field_id    | string | yes      | List custom field id. Can be retrieved using the list fields endpoint |
| operator_id | string | yes      | Operator id. See the API-URL/lists/segments/operators endpoint        |
| value       | string | yes      | Value to compare with                                                 |

**Campaign conditions block - optional**

| Parameter                | Type    | Required | Description                                  |
|--------------------------|---------|----------|----------------------------------------------|
| action                   | string  | yes      | Campaign action: click/open                  |
| campaign_id              | integer | yes      | Campaign id.                                 |
| time_comparison_operator | string  | yes      | Time comparison operator: (lte/lt/gte/gt/eq) |
| time_value               | integer | yes      | Time value                                   |
| time_unit                | string  | yes      | Time unit day/month/year                     |

## Update a list segment

```php 
// update list segment
// Only the conditions present here will be kept. All other existing conditions will be removed
$response = $endpoint->update('LIST-UNIQUE-ID', 'SEGMENT-UNIQUE-ID', [
    // required
    'name'           => 'My list segment created from the API updated', // required
    'operator_match' => 'any', // required (any/all)
    // optional
    'conditions' => [
        [
            'field_id'    => '96', // required . 
            'operator_id' => '3', // required .  See the API-URL/lists/segments/condition-operators endpoint
            'value'       => 'domain.com', // required
        ],
        [
            'field_id'    => '95', // required . 
            'operator_id' => '4', // required .  See the API-URL/lists/segments/condition-operators endpoint
            'value'       => 'keyword', // required
        ]
    ],
    'campaign_conditions' => [
        [
            'action'                   => 'click', // required (click/open)
            'campaign_id'              => '100', // required
            'time_comparison_operator' => 'lte', // required (lte/lt/gte/gt/eq)
            'time_value'               => '3', // required
            'time_unit'                => 'day' // required (day/month/year)
        ],
        [
            'action'                   => 'open', // required (click/open)
            'campaign_id'              => '99', // required
            'time_comparison_operator' => 'gte', // required (lte/lt/gte/gt/eq)
            'time_value'               => '3', // required
            'time_unit'                => 'month' // required (day/month/year)
        ]
    ],
]);

// and get the response
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```
This endpoint updates a list segment.

### HTTP Request

`PUT API-URL/lists/LIST-UNIQUE-ID/segments/SEGMENT-UNIQUE-ID`

### URL Segment

| Segment           | Type   | Required | Description                    |
|-------------------|--------|----------|--------------------------------|
| LIST-UNIQUE-ID    | string | yes      | List unique identifier         |
| SEGMENT-UNIQUE-ID | string | yes      | List segment unique identifier |

### PUT Parameters

| Parameter      | Type   | Required | Description                                                                                                                                         |
|----------------|--------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| data           | array  | yes      | Array with the list segment details. The following indexed arrays are accepted: conditions, campaign_conditions. See the create section for details |

**General block - required**

| Parameter      | Type   | Required | Description                                   |
|----------------|--------|----------|-----------------------------------------------|
| name           | string | yes      | List segment name                             |
| operator_match | string | yes      | Operator to match all the conditions: any/all |

**Conditions block - optional**

| Parameter   | Type   | Required | Description                                                           |
|-------------|--------|----------|-----------------------------------------------------------------------|
| field_id    | string | yes      | List custom field id. Can be retrieved using the list fields endpoint |
| operator_id | string | yes      | Operator id. See the API-URL/lists/segments/operators endpoint        |
| value       | string | yes      | Value to compare with                                                 |

**Campaign conditions block - optional**

| Parameter                | Type    | Required | Description                                  |
|--------------------------|---------|----------|----------------------------------------------|
| action                   | string  | yes      | Campaign action: click/open                  |
| campaign_id              | integer | yes      | Campaign id.                                 |
| time_comparison_operator | string  | yes      | Time comparison operator: (lte/lt/gte/gt/eq) |
| time_value               | integer | yes      | Time value                                   |
| time_unit                | string  | yes      | Time unit day/month/year                     |


## Delete a list segment
```php
// Delete SEGMENT
$response = $endpoint->delete('LIST-UNIQUE-ID', 'SEGMENT-UNIQUE-ID');

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

This endpoint will delete the list segment with the given SEGMENT-UNIQUE-ID for the LIST-UNIQUE-ID.

### HTTP Request

`DELETE API-URL/lists/LIST-UNIQUE-ID/segments/SEGMENT-UNIQUE-ID`

### URL Segments

| Segment           | Required | Description                      |
|-------------------|----------|----------------------------------|
| LIST-UNIQUE-ID    | yes      | List unique id to delete.        |
| SEGMENT-UNIQUE-ID | yes      | List segment unique id to delete |


## Get all list segment condition operators
```php
// GET ALL ITEMS
$response = $endpoint->getConditionOperators();

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
    "count": "10",
    "records": [
      {
        "operator_id": "1",
        "name": "is",
        "slug": "is"
      },
      {
        "operator_id": "2",
        "name": "is not",
        "slug": "is-not"
      },
      {
        "operator_id": "3",
        "name": "contains",
        "slug": "contains"
      },
      {
        "operator_id": "4",
        "name": "not contains",
        "slug": "not-contains"
      },
      {
        "operator_id": "5",
        "name": "starts with",
        "slug": "starts"
      },
      {
        "operator_id": "6",
        "name": "ends with",
        "slug": "ends"
      },
      {
        "operator_id": "7",
        "name": "is greater than",
        "slug": "greater"
      },
      {
        "operator_id": "8",
        "name": "is less than",
        "slug": "less"
      },
      {
        "operator_id": "9",
        "name": "not starts with",
        "slug": "not-starts"
      },
      {
        "operator_id": "10",
        "name": "not ends with",
        "slug": "not-ends"
      }
    ]
  }
}
```
This endpoint retrieves all the list segment condition operators.

### HTTP Request

`GET API-URL/lists/segments/condition-operators`
