# Campaign bounces

## Create the endpoint
```php
// require the setup which has registered the autoloader
require_once __DIR__ . '/setup.php';

// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\CampaignBounces();
```

```ruby
# SETUP THE API
require '../examples/setup_api'

# CREATE THE ENDPOINT
endpoint = CampaignBounces.new 
```

```python
from setup_api import setup
from mailwizz.endpoint.campaign_bounces import CampaignBounces

"""
SETUP THE API
"""
setup()

"""
CREATE THE ENDPOINT
"""
endpoint = CampaignBounces()
```

<aside class="success">Do not forget to require the setup</aside>

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
// 

```

```python
// 

```
This endpoint retrieves all the bounces of a campaign.

### HTTP Request

`GET API-URL/campaigns/CAMPAIGN_UID/bounces/`

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
// 

```
```python
// 

```

This endpoint creates a campaign bounce

### HTTP Request

`POST API-URL/campaigns/CAMPAIGN_UID/bounces`

### POST Parameters

Parameter | Required | Description
--------- | ------- | -----------
message | yes | The bounce message to be recorded.
bounce_type | yes | Bounce type (hard, soft or internal).
subscriber_uid | yes | The subscriber for which we record the bounce

