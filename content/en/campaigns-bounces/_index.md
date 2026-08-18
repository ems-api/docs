---
title: "Campaigns Bounces"
type: docs
weight: 80
description: >
  Campaigns Bounces endpoints of the MailWizz API.
---

## Campaigns bounces endpoint

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\CampaignBounces();
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# CREATE THE ENDPOINT
endpoint = CampaignBounces.new 
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
from mailwizz.endpoint.campaign_bounces import CampaignBounces

"""
CREATE THE ENDPOINT
"""
endpoint = CampaignBounces()
{{< /tab >}}
{{< /tabpane >}}



## Get all bounces

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// GET ALL ITEMS
$response = $endpoint->getBounces('CAMPAIGN-UNIQUE-ID, $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo "<pre>";
print_r($response->body);
echo "</pre>";
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# GET ALL ITEMS
response = endpoint.get_bounces(campaign_uid = 'CAMAPAIGN-UNIQUE-ID', page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
GET ALL ITEMS
"""
response = endpoint.get_bounces(campaign_uid='CAMAPAIGN-UNIQUE-ID', page=1, per_page=10)

"""
DISPLAY RESPONSE
"""
print(response.content)
{{< /tab >}}
{{< /tabpane >}}


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

`GET API-URL/campaigns/CAMPAIGN-UNIQUE-ID/bounces`

### URL Segments

| Segment            | Required | Description                                |
|--------------------|----------|--------------------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to retrieve the bounce. |

### Query Parameters

| Parameter | Default | Description                 |
|-----------|---------|-----------------------------|
| page      | 1       | Current page to retrieve.   |
| per_page  | 10      | Items per page to retrieve. |

## Create a bounce

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
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
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# CREATE BOUNCE
response = endpoint.create('CAMPAIGN-UNIQUE-ID', {
    # required
    'message': 'The reason why this email bounced',
    'bounce_type': 'hard',
    'subscriber_uid': 'SUBSCRIBER-UNIQUE-ID'
})

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
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
{{< /tab >}}
{{< /tabpane >}}

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

`POST API-URL/campaigns/CAMPAIGN-UNIQUE-ID/bounces`

### URL Segments

| Segment            | Required | Description                              |
|--------------------|----------|------------------------------------------|
| CAMPAIGN-UNIQUE-ID | yes      | Campaign unique id to create the bounce. |

### POST Parameters

| Parameter      | Required | Description                                   |
|----------------|----------|-----------------------------------------------|
| message        | yes      | The bounce message to be recorded.            |
| bounce_type    | yes      | Bounce type (hard, soft or internal).         |
| subscriber_uid | yes      | The subscriber for which we record the bounce |
