# Campaign delivery logs

## Campaign delivery logs endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\CampaignDeliveryLogs();
```

## Get all delivery logs
```php
// GET ALL ITEMS
$response = $endpoint->getDeliveryLogs($campaignUid = 'CAMPAIGN-UNIQUE-ID', $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo "<pre>";
print_r($response->body);
echo "</pre>";
```

> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "count": "2",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "campaign": {
          "campaign_uid": "so5554wgk2cd6",
          "list": {
            "list_uid": "ab5554xyz2cd6"
          }
        },
        "subscriber": {
          "subscriber_uid": "gz589po8oz3af",
          "email": "subscriber87@example.gov"
        },
        "message": "OK",
        "retries": "0",
        "max_retries": "3",
        "email_message_id": "38de121ef62e8c9c2a12fa63679f764f7c3a259c@onetwist.com",
        "delivery_confirmed": "yes",
        "status": "success",
        "date_added": "2021-12-20 09:29:31"
      },
      {
        "campaign": {
          "campaign_uid": "so5554wgk2cd6",
          "list": {
            "list_uid": "ab5554xyz2cd6"
          }
        },
        "subscriber": {
          "subscriber_uid": "rs727cybga6d0",
          "email": "subscriber68@gmail.net"
        },
        "message": "OK",
        "retries": "0",
        "max_retries": "3",
        "email_message_id": "1174caa36efedc6d6c91e0ea4cce5fdda9bc7a4a@onetwist.com",
        "delivery_confirmed": "yes",
        "status": "success",
        "date_added": "2021-12-20 09:29:27"
      }
    ]
  }
}
```

This endpoint retrieves all the delivery logs of a campaign.

### HTTP Request

`GET API-URL/campaigns/CAMAPAIGN-UNIQUE-ID/delivery-logs`

### Query Parameters

| Parameter  | Default | Description                 |
|------------|---------|-----------------------------|
| pageNumber | 1       | Current page to retrieve.   |
| perPage    | 10      | Items per page to retrieve. |


## Get a delivery log based on its unique email message id
```php
// GET A DELIVERY LOG BY THE EMAIL MESSAGE ID
$response = $endpoint->getDeliveryLogByEmailMessageId('EMAIL-MESSAGE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "record": {
      "campaign": {
        "campaign_uid": "so5554wgk2cd6",
        "list": {
          "list_uid": "ab5554xyz2cd6"
        }
      },
      "subscriber": {
        "subscriber_uid": "nh567s19hw8a0",
        "email": "subscriber38@gmail.mil"
      },
      "message": "OK",
      "retries": "0",
      "max_retries": "3",
      "email_message_id": "e79019a2b9cad8c73cd0d3137913378005a69fc1@onetwist.com",
      "delivery_confirmed": "yes",
      "status": "success",
      "date_added": "2021-12-20 09:29:26"
    }
  }
}
```

This endpoint retrieves a delivery log based on its unique email message id.

### HTTP Request

`GET API-URL/campaigns/delivery-logs/email-message-id/EMAIL-MESSAGE-ID`

### Query Parameters

| Parameter        | Required | Description                   |
|------------------|----------|-------------------------------|
| EMAIL-MESSAGE-ID | yes      | Email message id to retrieve. |
