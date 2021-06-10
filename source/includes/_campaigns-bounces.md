# Campaign bounces

## Campaigns bounces endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\CampaignBounces();
```

```ruby
# CREATE THE ENDPOINT
endpoint = CampaignBounces.new 
```

```python
from mailwizz.endpoint.campaign_bounces import CampaignBounces

"""
CREATE THE ENDPOINT
"""
endpoint = CampaignBounces()
```

## Get all bounces
```php
// GET ALL ITEMS
$response = $endpoint->getBounces($campaignUid = CAMPAIGN-UNIQUE-ID, $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo "<pre>";
print_r($response->body);
echo "</pre>";
```

```ruby
# GET ALL ITEMS
response = endpoint.get_bounces(campaign_uid = 'CAMAPAIGN-UNIQUE-ID', page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ALL ITEMS
"""
response = endpoint.get_bounces(campaign_uid='CAMAPAIGN-UNIQUE-ID', page=1, per_page=10)

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
        "message": "5.1.1 : Recipient address rejected: User unknown in virtual mailbox table",
        "processed": "no",
        "bounce_type": "hard",
        "subscriber": {
          "subscriber_uid": "xq907cko16da3",
          "email": "user@example.com"
        }
      }
    ]
  }
}
```

This endpoint retrieves all the bounces of a campaign.

### HTTP Request

`GET API-URL/campaigns/CAMAPAIGN-UNIQUE-ID/bounces`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
pageNumber | 1 | Current page to retrieve.
perPage | 10 | Items per page to retrieve.

## Create a bounce

```php 
// CREATE BOUNCE
$response = $endpoint->create('CAMPAIGN-UNIQUE-ID', [
    'message'        => 'The reason why this email bounced', // max 250 chars
    'bounce_type'    => 'hard', // hard, soft or internal
    'subscriber_uid' => 'SUBSCRIBER-UNIQUE-ID' // 13 chars unique subscriber identifier
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# CREATE BOUNCE
response = endpoint.create('CAMPAIGN-UNIQUE-ID', {
    # required
    'message': 'The reason why this email bounced',
    'bounce_type': 'hard',
    'subscriber_uid': 'SUBSCRIBER-UNIQUE-ID'
})

# DISPLAY RESPONSE
puts response.body
```
```python
"""
CREATE BOUNCE
"""
response = endpoint.create('CAMPAIGN-UNIQUE-ID', {
    # required
    'message': 'The reason why this email bounced',
    'bounce_type': 'hard',
    'subscriber_uid': 'SUBSCRIBER-UNIQUE-ID'
})

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
    "record": {
      "message": "The reason why this email bounced",
      "processed": "no",
      "bounce_type": "hard",
      "subscriber": {
        "subscriber_uid": "fo428vd43x832",
        "email": "user@example.com"
      }
    }
  }
}
```

This endpoint creates a campaign bounce

### HTTP Request

`POST API-URL/campaigns/CAMAPAIGN-UNIQUE-ID/bounces`

### POST Parameters

Parameter | Required | Description
--------- | ------- | -----------
message | yes | The bounce message to be recorded.
bounce_type | yes | Bounce type (hard, soft or internal).
subscriber_uid | yes | The subscriber for which we record the bounce

