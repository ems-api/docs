# Campaigns

## Create the endpoint
```php
// require the setup which has registered the autoloader
require_once __DIR__ . '/setup.php';

// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\Campaigns();
```

```ruby
# SETUP THE API
require '../examples/setup_api'

# CREATE THE ENDPOINT
endpoint = Campaigns.new 
```

```python
from setup_api import setup
from mailwizz.endpoint.campaigns import Campaigns

"""
SETUP THE API
"""
setup()

"""
CREATE THE ENDPOINT
"""
endpoint = Campaigns()
```

<aside class="success">Do not forget to require the setup</aside>

## Get all campaigns
```php
// GET ALL ITEMS
$response = $endpoint->getCampaigns($pageNumber = 1, $perPage = 10);

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
This endpoint retrieves all the campaigns.

### HTTP Request

`GET API-URL/campaigns`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
pageNumber | 1 | Current page to retrieve.
perPage | 10 | Items per page to retrieve.

## Get one campaign
```php
// GET ONE ITEM
$response = $endpoint->getCampaign('CAMPAIGN-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
// 

```

```python
// 

```
This endpoint retrieves the campaign with the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`GET API-URL/campaigns`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
CAMPAIGN-UNIQUE-ID | yes | Campaign unique id to retrieve.

## Create a campaign

```php 
// CREATE CAMPAIGN
$response = $endpoint->create([
    'name'          => 'My API Campaign', // required
    'type'          => 'regular', // optional: regular or autoresponder
    'from_name'     => 'John Doe', // required
    'from_email'    => 'john.doe@doe.com', // required
    'subject'       => 'Hey, i am testing the campaigns via API', // required
    'reply_to'      => 'john.doe@doe.com', // required
    'send_at'       => date('Y-m-d H:i:s', strtotime('+10 hours')), // required, this will use the timezone which customer selected
    'list_uid'      => 'LIST-UNIQUE-ID', // required
    'segment_uid'   => 'SEGMENT-UNIQUE-ID',// optional, only to narrow down
    
    // optional block, defaults are shown
    'options' => [
        'url_tracking'      => 'no', // yes | no
        'json_feed'         => 'no', // yes | no
        'xml_feed'          => 'no', // yes | no
        'plain_text_email'  => 'yes',// yes | no
        'email_stats'       => null, // a valid email address where we should send the stats after campaign done
        
        // - if autoresponder uncomment bellow:
        //'autoresponder_event'            => 'AFTER-SUBSCRIBE', // AFTER-SUBSCRIBE or AFTER-CAMPAIGN-OPEN
        //'autoresponder_time_unit'        => 'hour', // minute, hour, day, week, month, year
        //'autoresponder_time_value'       => 1, // 1 hour after event
        //'autoresponder_open_campaign_id' => 1, // INT id of campaign, only if event is AFTER-CAMPAIGN-OPEN,
        
        // - if this campaign is advanced recurring, you can set a cron job style frequency.
        // - please note that this applies only for regular campaigns.
        //'cronjob'         => '0 0 * * *', // once a day
        //'cronjob_enabled' => 1, // 1 or 0
    ],
    
    // required block, archive or template_uid or content => required.
    'template' => [
        //'archive'         => file_get_contents(__DIR__ . '/template-example.zip'),
        //'template_uid'    => 'TEMPLATE-UNIQUE-ID',
        'content'           => file_get_contents(__DIR__ . '/template-example.html'),
        'inline_css'        => 'no', // yes | no
        'plain_text'        => null, // leave empty to auto generate
        'auto_plain_text'   => 'yes', // yes | no
    ],
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

`POST API-URL/campaigns`

### POST Parameters

Parameter | Required | Description
--------- | ------- | -----------
message | yes | The bounce message to be recorded.
bounce_type | yes | Bounce type (hard, soft or internal).
subscriber_uid | yes | The subscriber for which we record the bounce

