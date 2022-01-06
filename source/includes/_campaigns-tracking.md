# Campaigns tracking

## Campaigns tracking endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\CampaignsTracking();
```

```ruby
# CREATE THE ENDPOINT
endpoint = CampaignsTracking.new
```

```python
from mailwizz.endpoint.campaigns_tracking import CampaignsTracking

"""
CREATE THE ENDPOINT
"""
endpoint = CampaignsTracking()
```

## Track subscriber click for campaign
```php
// Track subscriber click for campaign click
$response = $endpoint->trackUrl('CAMPAIGN-UNIQUE-ID', 'SUBSCRIBER-UNIQUE-ID', 'URL-HASH');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# Track subscriber click for campaign click
response = endpoint.track_url('CAMPAIGN_UID', 'SUBSCRIBER_UID', 'HASH_URL')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
Track subscriber click for campaign click
"""
response = endpoint.track_url(campaign_uid='CAMPAIGN_UID', subscriber_uid='SUBSCRIBER_UID', hash_string='')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {}
}
```
This endpoint set a campaign tracking url click action.

### HTTP Request

`GET API-URL/campaigns/CAMPAIGN-UID/track-url/SUBSCRIBER-UNIQUE-ID/URL-HASH`

### Query Parameters

| Parameter            | Required | Description                                |
|----------------------|----------|--------------------------------------------|
| CAMPAIGN-UID         | Yes      | Campaign unique identifier.                |
| SUBSCRIBER-UNIQUE-ID | Yes      | Subscriber unique identifier.              |
| URL-HASH             | Yes      | The url hash which the subscriber clicked. |

## Track subscriber open
```php 
// Track subscriber open for campaign
$response = $endpoint->trackOpening('CAMPAIGN-UNIQUE-ID', 'SUBSCRIBER-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# Track subscriber open for campaign
response = endpoint.track_opening('CAMPAIGN_UID', 'SUBSCRIBER_UID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
Track subscriber open for campaign
"""
response = endpoint.track_opening(campaign_uid='CAMPAIGN_UID', subscriber_uid='SUBSCRIBER_UID')

"""
DISPLAY RESPONSE
"""
print(response.content) 
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {}
}
```
This endpoint sets the track campaign open for a certain subscriber.

### HTTP Request

`GET API-URL/campaigns/CAMPAIGN-UID/track-opening/SUBSCRIBER-UID`

### Query Parameters

| Parameter            | Required | Description                   |
|----------------------|----------|-------------------------------|
| CAMPAIGN-UID         | Yes      | Campaign unique identifier.   |
| SUBSCRIBER-UNIQUE-ID | Yes      | Subscriber unique identifier. |

## Track subscriber unsubscribe
```php 
// Track subscriber unsubscribe for campaign
$response = $endpoint->trackUnsubscribe('CAMPAIGN-UNIQUE-ID', 'SUBSCRIBER-UNIQUE-ID', [
    'ip_address' => '123.123.123.123',
    'user_agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
    'reason'     => 'Reason for unsubscribe!',
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# Track subscriber unsubscribe for campaign
response = endpoint.track_unsubscribe('CAMPAIGN_UID', 'SUBSCRIBER_UID', {
    'ip_address': '123.123.123.123',
    'user_agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
    'reason': 'Reason for unsubscribe!',
})

# DISPLAY RESPONSE
puts response.body
```

```python
"""
Track subscriber unsubscribe for campaign
"""
response = endpoint.track_unsubscribe(campaign_uid='CAMPAIGN_UID', subscriber_uid='SUBSCRIBER_UID', data={
    'ip_address': '123.123.123.123',
    'user_agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
    'reason': 'Reason for unsubscribe!',
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
  "data": {}
}
```
This endpoint sets the track campaign unsubscribe for a certain subscriber.

### HTTP Request

`POST API-URL/campaigns/CAMPAIGN-UID/track-unsubscribe/SUBSCRIBER-UID`

### POST Parameters

| Parameter            | Required | Description                                       |
|----------------------|----------|---------------------------------------------------|
| CAMPAIGN-UID         | Yes      | Campaign unique identifier.                       |
| SUBSCRIBER-UNIQUE-ID | Yes      | Subscriber unique identifier.                     |
| ip_address           | No       | IP address from which the subscriber unsubscribes |
| user_agent           | No       | Subscriber user agent                             |
| reason               | No       | Unsubscribe reason                                |
