# Campaigns

## Campaigns endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\Campaigns();
```

```ruby
# CREATE THE ENDPOINT
endpoint = Campaigns.new 
```

```python
from datetime import datetime, timedelta
from mailwizz.endpoint.campaigns import Campaigns

"""
CREATE THE ENDPOINT
"""
endpoint = Campaigns()
```

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
# GET ALL ITEMS
response = endpoint.get_campaigns(page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ALL ITEMS
"""
response = endpoint.get_campaigns(page=1, per_page=10)

"""
DISPLAY RESPONSE
"""
print(response.content) 
```
> The above command returns an object structured like this JSON:

```json
[
  {
    "status": "success",
    "data": {
      "count": "12",
      "total_pages": 2,
      "current_page": 1,
      "next_page": 2,
      "prev_page": null,
      "records": [
        {
          "campaign_uid": "og943e5q6e158",
          "campaign_id": "12",
          "name": "My API Campaign UPDATED #3",
          "status": "sent",
          "group": []
        },
        {
          "campaign_uid": "gp5420ve90f3e",
          "campaign_id": "13",
          "name": "My API Campaign UPDATED #2",
          "status": "sent",
          "group": []
        },
        {
          "campaign_uid": "hv4163y076d84",
          "campaign_id": "14",
          "name": "My API Campaign UPDATED #1",
          "status": "sent",
          "group": []
        },
        {
          "campaign_uid": "xk906nd8fn506",
          "campaign_id": "15",
          "name": "My API Campaign UPDATED",
          "status": "sent",
          "group": []
        },
        {
          "campaign_uid": "eh477yfos0258",
          "campaign_id": "16",
          "name": "API campaing #1",
          "status": "draft",
          "group": []
        },
        {
          "campaign_uid": "db516xtc45237",
          "campaign_id": "17",
          "name": "API campaing #2",
          "status": "draft",
          "group": []
        },
        {
          "campaign_uid": "ld526wjke1ff4",
          "campaign_id": "18",
          "name": "API campaing #1",
          "status": "draft",
          "group": []
        },
        {
          "campaign_uid": "bx831rctawf92",
          "campaign_id": "19",
          "name": "API campaing",
          "status": "paused",
          "group": []
        },
        {
          "campaign_uid": "tk459h475l8ef",
          "campaign_id": "20",
          "name": "Test #1",
          "status": "sent",
          "group": []
        },
        {
          "campaign_uid": "go896lnslz8ae",
          "campaign_id": "21",
          "name": "Test",
          "status": "sent",
          "group": []
        }
      ]
    }
  }
]
```

This endpoint retrieves all the campaigns.

### HTTP Request

`GET API-URL/campaigns`

### Query Parameters

| Parameter | Default | Description                 |
|-----------|---------|-----------------------------|
| page      | 1       | Current page to retrieve.   |
| per_page  | 10      | Items per page to retrieve. |

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
# GET ONE ITEM
response = endpoint.get_campaign('CAMPAIGN_UID')

# DISPLAY RESPONSE
puts response.body 
```

```python
"""
GET ONE ITEM
"""
response = endpoint.get_campaign('CAMPAIGN_UID')

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
      "campaign_uid": "og943e5q6e158",
      "campaign_id": "12",
      "name": "My API Campaign UPDATED #3",
      "type": "regular",
      "from_name": "John Doe",
      "from_email": "john.doe@doe.com",
      "to_name": "[EMAIL]",
      "reply_to": "john.doe@doe.com",
      "subject": "Hey, i am testing the campaigns via API",
      "status": "sent",
      "date_added": "2\/24\/21, 11:38 PM",
      "send_at": "2\/24\/21, 11:39 PM",
      "list": {
        "list_uid": "ra5026psrjeb5",
        "name": "Testing list",
        "subscribers_count": 0
      },
      "segment": [],
      "group": []
    }
  }
}
```
This endpoint retrieves the campaign with the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`GET API-URL/campaigns/CAMPAIGN-UNIQUE-ID`

### URL Segments

| Segment            | Required | Description                     |
|--------------------|----------|---------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to retrieve. |

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
# CREATE ONE CAMPAIGN
response = endpoint.create({
    'name': 'My API Campaign', # required
    'type': 'regular', # optional: regular or autoresponder
    'from_name': 'John Doe', # required
    'from_email': 'john.doe@doe.com', # required
    'subject': 'Hey, i am testing the campaigns via API', # required
    'reply_to': 'john.doe@doe.com', # required
    #required, this will use the timezone which customer selected
    'send_at': Time.now.strftime('%Y-%m-%d %H:%M:%S'),
    'list_uid': 'LIST_UID', # required
    #'segment_uid'   : 'SEGMENT-UNIQUE-ID',# optional, only to narrow down
    
    #optional block, defaults are shown
    'options': {
       'url_tracking': 'no', # yes | no
       'json_feed': 'no', # yes | no
       'xml_feed': 'no', # yes | no
       'plain_text_email': 'yes', # yes | no
       'email_stats': nil, # a valid email address where we should send the stats after campaign done
    
       # - if autoresponder uncomment bellow:
       # 'autoresponder_event'            : 'AFTER-SUBSCRIBE', # AFTER-SUBSCRIBE or AFTER-CAMPAIGN-OPEN
       # 'autoresponder_time_unit'        : 'hour', # minute, hour, day, week, month, year
       # 'autoresponder_time_value'       : 1, # 1 hour after event
       # 'autoresponder_open_campaign_id' : 1, # INT id of campaign, only if event is AFTER-CAMPAIGN-OPEN,
    
       # - if this campaign is advanced recurring, you can set a cron job style frequency.
       # - please note that this applies only for regular campaigns.
       # 'cronjob'         : '0 0 * * *', # once a day
       # 'cronjob_enabled' : 1, # 1 or 0
    },
    
    # required block, archive or template_uid or content : required.
    # the templates examples can be found here: Examples
    'template': {
       # 'archive': File.read('template-example.zip'),
       # # 'template_uid': 'template_uid',
       'content': File.read('template-example.html'),
       'inline_css': 'no', # yes | no
       # 'plain_text': nil, # leave empty to auto generate
       'auto_plain_text': 'yes', # yes | no
    },
    })
# DISPLAY RESPONSE
puts response.body
```

```python
"""
CREATE ONE CAMPAIGN
"""
response = endpoint.create({
    'name': 'My API Campaign',  # required
    'type': 'regular',  # optional: regular or autoresponder
    'from_name': 'John Doe',  # required
    'from_email': 'john.doe@doe.com',  # required
    'subject': 'Hey, i am testing the campaigns via API',  # required
    'reply_to': 'john.doe@doe.com',  # required
    'send_at': (datetime.now() + timedelta(hours=10)).strftime('%Y-%m-%d %H:%M:%S'),
    # required, this will use the timezone which customer selected
    'list_uid': 'LIST_UID',  # required
    # 'segment_uid'   : 'SEGMENT-UNIQUE-ID',# optional, only to narrow down

    # optional block, defaults are shown
    'options': {
        'url_tracking': 'no',  # yes | no
        'json_feed': 'no',  # yes | no
        'xml_feed': 'no',  # yes | no
        'plain_text_email': 'yes',  # yes | no
        'email_stats': None,  # a valid email address where we should send the stats after campaign done

        # - if autoresponder uncomment bellow:
        # 'autoresponder_event'            : 'AFTER-SUBSCRIBE', # AFTER-SUBSCRIBE or AFTER-CAMPAIGN-OPEN
        # 'autoresponder_time_unit'        : 'hour', # minute, hour, day, week, month, year
        # 'autoresponder_time_value'       : 1, # 1 hour after event
        # 'autoresponder_open_campaign_id' : 1, # INT id of campaign, only if event is AFTER-CAMPAIGN-OPEN,

        # - if this campaign is advanced recurring, you can set a cron job style frequency.
        # - please note that this applies only for regular campaigns.
        # 'cronjob'         : '0 0 * * *', # once a day
        # 'cronjob_enabled' : 1, # 1 or 0
    },

    # required block, archive or template_uid or content : required.
    # the templates examples can be found here: Examples
    'template': {
        # 'archive'        : open('template-example.zip', 'r').read(),
        'template_uid': 'TEMPLATE_UID',
        # 'content'         : open('template-example.html', 'rb').read(),
        'inline_css': 'no',  # yes | no
        # 'plain_text'      : None, # leave empty to auto generate
        'auto_plain_text': 'yes',  # yes | no
    },
})

"""
DISPLAY RESPONSE
"""
print(response.content) 
```
> The above command returns an object structured like this JSON:

```json
{
  "status":"success",
  "campaign_uid": "hv4163y076d84"
}
```
This endpoint creates a campaign

### HTTP Request

`POST API-URL/campaigns`

### POST Parameters


| Parameter | Type  | Required | Description                     |
|-----------|-------|----------|---------------------------------|
| campaign  | array | yes      | Array with the email details.   |

**Campaign block**

| Parameter   | Type                   | Required | Description                                                                        |
|-------------|------------------------|----------|------------------------------------------------------------------------------------|
| name        | string                 | yes      | Campaign name.                                                                     |
| type        | string                 | no       | Campaign type: regular or autoresponder. Default is regular.                       |
| from_name   | string                 | yes      | The campaign from name                                                             |
| from_email  | string                 | yes      | The campaign from email address                                                    |
| subject     | string                 | yes      | The campaign subject                                                               |
| from_name   | string                 | yes      | The subscriber for which we record the bounce                                      |
| reply_to    | string                 | yes      | The campaign reply to email address                                                |
| send_at     | datetime (Y-m-d H:i:s) | yes      | This will use the timezone which customer selected                                 |
| list_uid    | string                 | yes      | The list uid to which this campaign will be sent                                   |
| segment_uid | string                 | no       | Narrow down the campaign recipients                                                |
| template    | array                  | yes      | The campaign template object block. Archive or template_uid or content => required |
| options     | array                  | no       | The campaign optional block, defaults are shown                                    |

**Template block**

| Parameter       | Type        | Required | Description                          |
|-----------------|-------------|----------|--------------------------------------|
| archive         | filePath    | yes      | Template file zip location           |
| template_uid    | string      | yes      | Template unique id from MailWizz     |
| content         | string      | yes      | Template content                     |
| inline_css      | yes/no      | yes      | Accept inline css                    |
| plain_text      | null/string | no       | Send null to autogenerate as default |
| auto_plain_text | yes/no      | yes      | Generate plain text template         |

**Options block**

| Parameter                      | Type        | Required | Description                                                                    |
|--------------------------------|-------------|----------|--------------------------------------------------------------------------------|
| url_tracking                   | yes/no      | no       | Enable/Disable url tracking                                                    |
| json_feed                      | yes/no      | no       | Enable/Disable json feed                                                       |
| xml_feed                       | yes/no      | no       | Enable/Disable xml feed                                                        |
| plain_text_email               | yes/no      | no       | Enable/Disable the plain text email                                            |
| email_stats                    | string/null | no       | A valid email address where the stats will be sent                             |
| autoresponder_event            | string      | no       | Possible values: AFTER-SUBSCRIBE or AFTER-CAMPAIGN-OPEN                        |
| autoresponder_event            | string      | no       | Possible values: AFTER-SUBSCRIBE or AFTER-CAMPAIGN-OPEN                        |
| autoresponder_time_unit        | string      | no       | Possible values: minute, hour, day, week, month, year                          |
| autoresponder_time_value       | integer     | no       | The unit time value                                                            |
| autoresponder_time_value       | integer     | no       | The unit time value                                                            |
| autoresponder_open_campaign_id | integer     | no       | Id of the campaign, only if event is AFTER-CAMPAIGN-OPEN                       |
| cronjob                        | string      | no       | If this campaign is advanced recurring, you can set a cron job style frequency |
| cronjob_enabled                | integer     | no       | Possible values 1 or 0                                                         |

## Update a campaign
```php
// UPDATE CAMPAIGN
$response = $endpoint->update('CAMPAIGN-UNIQUE-ID', [
    'name'          => 'My API Campaign UPDATED', // optional at update
    'from_name'     => 'John Doe', // optional at update
    'from_email'    => 'john.doe@doe.com', // optional at update
    'subject'       => 'Hey, i am testing the campaigns via API', // optional at update
    'reply_to'      => 'john.doe@doe.com', // optional at update
    'send_at'       => date('Y-m-d H:i:s', strtotime('+1 hour')), //optional at update, this will use the timezone which customer selected
    'list_uid'      => 'LIST-UNIQUE-ID', // optional at update
    'segment_uid'   => 'SEGMENT-UNIQUE-ID',// optional, only to narrow down
    
    // optional block, defaults are shown
    'options' => [
        'url_tracking'      => 'no', // yes | no
        'json_feed'         => 'no', // yes | no
        'xml_feed'          => 'no', // yes | no
        'plain_text_email'  => 'yes',// yes | no
        'email_stats'       => null, // a valid email address where we should send the stats after campaign done
    ],
    
    // optional block at update, archive or template_uid or content => required.
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
# UPDATE ONE CAMPAIGN
response = endpoint.update('CAMPAIGN_UID', {
    'name': 'My API Campaign - UPDATED', # required
    'from_name': 'John Doe', # required
    'from_email': 'john.doe@doe.com', # required
    'subject': 'Hey, i am testing the campaigns via API', # required
    'reply_to': 'john.doe@doe.com', # required
    'send_at': Time.now.strftime('%Y-%m-%d %H:%M:%S'),
    # required, this will use the timezone which customer selected
    'list_uid': 'LIST_UID', # required
    # 'segment_uid'   : 'SEGMENT-UNIQUE-ID',# optional, only to narrow down

    # optional block, defaults are shown
    'options': {
        'url_tracking': 'no', # yes | no
        'json_feed': 'no', # yes | no
        'xml_feed': 'no', # yes | no
        'plain_text_email': 'yes', # yes | no
        'email_stats': nil, # a valid email address where we should send the stats after campaign done

        # - if autoresponder uncomment bellow:
        # 'autoresponder_event'            : 'AFTER-SUBSCRIBE', # AFTER-SUBSCRIBE or AFTER-CAMPAIGN-OPEN
        # 'autoresponder_time_unit'        : 'hour', # minute, hour, day, week, month, year
        # 'autoresponder_time_value'       : 1, # 1 hour after event
        # 'autoresponder_open_campaign_id' : 1, # INT id of campaign, only if event is AFTER-CAMPAIGN-OPEN,

        # - if this campaign is advanced recurring, you can set a cron job style frequency.
        # - please note that this applies only for regular campaigns.
        # 'cronjob'         : '0 0 * * *', # once a day
        # 'cronjob_enabled' : 1, # 1 or 0
    },

    # required block, archive or template_uid or content : required.
    # the templates examples can be found here: Examples
    'template': {
        # 'archive': File.read('template-example.zip'),
        'template_uid': 'TEMPLATE_UID',
        # 'content': File.read('template-example.html'),
        'inline_css': 'no', # yes | no
        # 'plain_text': nil, # leave empty to auto generate
        'auto_plain_text': 'yes', # yes | no
    },
})

# DISPLAY RESPONSE
puts response.body
```

```python
"""
UPDATE ONE CAMPAIGN
"""
response = endpoint.update('CAMPAIGN_UID', {
    'name': 'My API Campaign - UPDATED',  # required
    'from_name': 'John Doe',  # required
    'from_email': 'john.doe@doe.com',  # required
    'subject': 'Hey, i am testing the campaigns via API',  # required
    'reply_to': 'john.doe@doe.com',  # required
    'send_at': (datetime.now() + timedelta(hours=10)).strftime('%Y-%m-%d %H:%M:%S'),
    # required, this will use the timezone which customer selected
    'list_uid': 'LIST_UID',  # required
    # 'segment_uid'   : 'SEGMENT-UNIQUE-ID',# optional, only to narrow down

    # optional block, defaults are shown
    'options': {
        'url_tracking': 'no',  # yes | no
        'json_feed': 'no',  # yes | no
        'xml_feed': 'no',  # yes | no
        'plain_text_email': 'yes',  # yes | no
        'email_stats': None,  # a valid email address where we should send the stats after campaign done

        # - if autoresponder uncomment bellow:
        # 'autoresponder_event'            : 'AFTER-SUBSCRIBE', # AFTER-SUBSCRIBE or AFTER-CAMPAIGN-OPEN
        # 'autoresponder_time_unit'        : 'hour', # minute, hour, day, week, month, year
        # 'autoresponder_time_value'       : 1, # 1 hour after event
        # 'autoresponder_open_campaign_id' : 1, # INT id of campaign, only if event is AFTER-CAMPAIGN-OPEN,

        # - if this campaign is advanced recurring, you can set a cron job style frequency.
        # - please note that this applies only for regular campaigns.
        # 'cronjob'         : '0 0 * * *', # once a day
        # 'cronjob_enabled' : 1, # 1 or 0
    },

    # required block, archive or template_uid or content : required.
    # the templates examples can be found here: Examples
    'template': {
        # 'archive'        : open('template-example.zip', 'r').read(),
        'template_uid': 'TEMPLATE_UID',
        # 'content'         : open('template-example.html', 'rb').read(),
        'inline_css': 'no',  # yes | no
        # 'plain_text'      : None, # leave empty to auto generate
        'auto_plain_text': 'yes',  # yes | no
    },
})

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```

This endpoint update the campaign with the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`PUT API-URL/campaigns/CAMPAIGN-UNIQUE-ID`

### URL Segments

| Segment            | Required | Description                   |
|--------------------|----------|-------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to update. |

### POST Parameters
Same as for the create campaign call.

## Copy a campaign
```php
// Copy CAMPAIGN
$response = $endpoint->copy('CAMPAIGN-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# COPY ONE CAMPAIGN
response = endpoint.copy('CAMPAIGN_UID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
COPY ONE CAMPAIGN
"""
response = endpoint.copy('CAMPAIGN_UID')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status":"success",
  "campaign_uid": "hv4163y076d84"
}
```

This endpoint copy the campaign with the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`POST API-URL/campaigns/CAMPAIGN-UNIQUE-ID/copy`

### URL Segments

| Segment            | Required | Description                 |
|--------------------|----------|-----------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to copy. |

## Pause/Unpause a campaign
```php
// Pause/Unpause CAMPAIGN
$response = $endpoint->pauseUnpause('CAMPAIGN-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# PAUSE/UNPAUSE ONE CAMPAIGN
response = endpoint.pause_unpause('CAMPAIGN_UID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
PAUSE/UNPAUSE ONE CAMPAIGN
"""
response = endpoint.pause_unpause('CAMPAIGN_UID')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "campaign": {
    "status": "sending"
  }
}
```
This endpoint pause/unpause the campaign with the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`PUT API-URL/campaigns/CAMPAIGN-UNIQUE-ID/pause-unpause`

### URL Segments

| Segment            | Required | Description                          |
|--------------------|----------|--------------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to pause/unpause. |

## Mark a campaign as SENT
```php
// Mark CAMPAIGN as sent
$response = $endpoint->markSent('CAMPAIGN-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# MARK ONE CAMPAIGN AS SENT
response = endpoint.mark_sent('CAMPAIGN_UID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
MARK ONE CAMPAIGN AS SENT
"""
response = endpoint.mark_sent('CAMPAIGN_UID')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "campaign": {
    "status": "sent"
  }
}
```

This endpoint mark as SENT the campaign with the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`PUT API-URL/campaigns/CAMPAIGN-UNIQUE-ID/mark-sent`

### URL Segments

| Segment            | Required | Description                         |
|--------------------|----------|-------------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to mark as sent. |

## Delete a campaign
```php
// Delete CAMPAIGN
$response = $endpoint->delete('CAMPAIGN-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# DELETE ONE CAMPAIGN
response = endpoint.delete('CAMPAIGN_UID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
DELETE ONE CAMPAIGN
"""
response = endpoint.delete('CAMPAIGN_UID')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```

This endpoint will delete the campaign with the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`DELETE API-URL/campaigns/CAMPAIGN-UNIQUE-ID`

### URL Segments

| Segment            | Required | Description                   |
|--------------------|----------|-------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to delete. |

## Get stats of a campaign
```php
// GET STATS
$response = $endpoint->getStats('CAMPAIGN-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# TODO - Implement
```

```python
"""
TODO - Implement
"""
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "campaign_status": "sent",
    "subscribers_count": 0,
    "processed_count": 0,
    "delivery_success_count": 0,
    "delivery_success_rate": 0,
    "delivery_error_count": 0,
    "delivery_error_rate": 0,
    "opens_count": 0,
    "opens_rate": 0,
    "unique_opens_count": 0,
    "unique_opens_rate": 0,
    "clicks_count": 0,
    "clicks_rate": 0,
    "unique_clicks_count": 0,
    "unique_clicks_rate": 0,
    "unsubscribes_count": 0,
    "unsubscribes_rate": 0,
    "complaints_count": 0,
    "complaints_rate": 0,
    "bounces_count": 0,
    "bounces_rate": 0,
    "hard_bounces_count": 0,
    "hard_bounces_rate": 0,
    "soft_bounces_count": 0,
    "soft_bounces_rate": 0,
    "internal_bounces_count": 0,
    "internal_bounces_rate": 0
  }
}
```

This endpoint retrieves the campaign stats the given CAMPAIGN-UNIQUE-ID.

### HTTP Request

`GET API-URL/campaigns/CAMPAIGN-UNIQUE-ID/stats`

### URL Segments

| Segment            | Required | Description                     |
|--------------------|----------|---------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to retrieve. |
