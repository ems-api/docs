---
title: "Subscribers"
type: docs
weight: 50
description: >
  Subscribers endpoints of the MailWizz API.
---

## Subscribers endpoint

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
/ CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\ListSubscribers();
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# CREATE THE ENDPOINT
endpoint = ListSubscribers.new
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
from mailwizz.endpoint.list_subscribers import ListSubscribers

"""
CREATE THE ENDPOINT
"""
endpoint = ListSubscribers()
{{< /tab >}}
{{< /tabpane >}}



## Get all subscribers

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// GET ALL ITEMS
$response = $endpoint->getSubscribers('LIST-UNIQUE-ID', $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# GET ALL SUBSCRIBERS OF A LIST
response = endpoint.get_subscribers(list_uid = 'LIST-UNIQUE-ID', page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
GET ALL SUBSCRIBERS OF A LIST
"""
response = endpoint.get_subscribers(list_uid='LIST-UNIQUE-ID', page=1, per_page=10)

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
    "count": "13",
    "total_pages": 2,
    "current_page": 1,
    "next_page": 2,
    "prev_page": null,
    "records": [
      {
        "subscriber_uid": "ll381bxshm01e",
        "EMAIL": "dmacmeartyd@jugem.jp",
        "FNAME": "",
        "LNAME": "",
        "status": "unsubscribed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:18"
      },
      {
        "subscriber_uid": "tl269bw0ol42e",
        "EMAIL": "gsteblesc@hp.com",
        "FNAME": "",
        "LNAME": "",
        "status": "unsubscribed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:18"
      },
      {
        "subscriber_uid": "gs870cmwgve71",
        "EMAIL": "lruterb@prlog.org",
        "FNAME": "",
        "LNAME": "",
        "status": "unsubscribed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:17"
      },
      {
        "subscriber_uid": "nz753vyrm0f86",
        "EMAIL": "kwheildona@tmall.com",
        "FNAME": "",
        "LNAME": "",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:17"
      },
      {
        "subscriber_uid": "sf449a4k7n193",
        "EMAIL": "dshorrock9@hp.com",
        "FNAME": "",
        "LNAME": "",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:16"
      },
      {
        "subscriber_uid": "op6219zx1s149",
        "EMAIL": "slorenz8@drupal.org",
        "FNAME": "",
        "LNAME": "",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:16"
      },
      {
        "subscriber_uid": "zz449poqsr2af",
        "EMAIL": "mhanlon7@wikispaces.com",
        "FNAME": "",
        "LNAME": "",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:16"
      },
      {
        "subscriber_uid": "jl349100yda86",
        "EMAIL": "elacroutz6@youku.com",
        "FNAME": "",
        "LNAME": "",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "kw647a5n8l516",
        "EMAIL": "mstephenson5@trellian.com",
        "FNAME": "",
        "LNAME": "",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "vo155s4b0d0ad",
        "EMAIL": "ldefew4@dailymail.co.uk",
        "FNAME": "",
        "LNAME": "",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:14"
      }
    ]
  }
}
```
This endpoint retrieves all the subscribers of a list.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers`

### URL Segments

| Segment        | Required | Description                                                      |
|----------------|----------|------------------------------------------------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier for which we retrieve the subscribers |

### Query Parameters

| Parameter | Default | Description                 |
|-----------|---------|-----------------------------|
| page      | 1       | Current page to retrieve.   |
| per_page  | 10      | Items per page to retrieve. |

## Get one subscriber

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// GET ONE ITEM
$response = $endpoint->getSubscriber('LIST-UNIQUE-ID', 'SUBSCRIBER-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# GET ONE SUBSCRIBER FROM A LIST
response = endpoint.get_subscriber(list_uid = 'LIST-UNIQUE-ID', subscriber_uid = 'SUBSCRIBER-UNIQUE_ID')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
GET ONE SUBSCRIBER FROM A LIST
"""
response = endpoint.get_subscriber(list_uid='LIST-UNIQUE-ID', subscriber_uid='SUBSCRIBER-UNIQUE_ID')

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
    "subscriber_uid": "ll381bxshm01e",
    "EMAIL": "dmacmeartyd@jugem.jp",
    "FNAME": "",
    "LNAME": "",
    "status": "unsubscribed",
    "source": "import",
    "ip_address": "",
    "date_added": "2021-02-20 17:26:18"
  }
}
```
This endpoint retrieves the subscriber with the given SUBSCRIBER-UNIQUE-ID from the given LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID`

### URL Segments

| Segment              | Required | Description                                                 |
|----------------------|----------|-------------------------------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique id to which the subscriber to retrieve belongs. |
| SUBSCRIBER-UNIQUE-ID | yes      | Subscriber unique id to retrieve.                           |

## Search by email

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// SEARCH BY EMAIL
$response = $endpoint->emailSearch('LIST-UNIQUE-ID', 'john.doe@doe.com');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# SEARCH BY EMAIL
response = endpoint.email_search(list_uid = 'LIST-UNIQUE-ID', email_address = 'john.doe@example.com')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
SEARCH BY EMAIL
"""
response = endpoint.email_search(list_uid='LIST-UNIQUE-ID', email_address='john.doe@example.com')

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
    "subscriber_uid": "sf449a4k7n193",
    "status": "confirmed",
    "date_added": "2021-02-20 17:26:16"
  }
}
```
This endpoint searches a subscriber by his email within the list having the LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers/search-by-email`

### URL Segments

| Segment        | Required | Description                                                 |
|----------------|----------|-------------------------------------------------------------|
| LIST-UNIQUE-ID | yes      | List unique id to which the subscriber to retrieve belongs. |

### Query Parameters

| Parameter      | Required | Description                                                 |
|----------------|----------|-------------------------------------------------------------|
| email          | yes      | Subscriber email to retrieve.                               |

## Search by email in all lists

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// SEARCH BY EMAIL IN ALL LISTS
$response = $endpoint->emailSearchAllLists('john.doe@doe.com');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# SEARCH BY EMAIL IN ALL LISTS
response = endpoint.email_search_all_lists(email_address = 'john.doe@example.com')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
SEARCH BY EMAIL IN ALL LISTS
"""
response = endpoint.email_search_all_lists(email_address='john.doe@example.com')

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
    "records": [
      {
        "subscriber_uid": "sf449a4k7n193",
        "email": "dshorrock9@hp.com",
        "status": "confirmed",
        "source": "import",
        "ip_address": "",
        "list": {
          "list_uid": "cn417nrhmv922",
          "display_name": "Testing list",
          "name": "Testing list #4"
        },
        "date_added": "2021-02-20 17:26:16"
      }
    ],
    "count": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "total_pages": 1
  }
}
```
This endpoint searches a subscriber by his email within the all lists.

### HTTP Request

`GET API-URL/lists/subscribers/search-by-email-in-all-lists`

### Query Parameters

| Parameter | Required | Description                   |
|-----------|----------|-------------------------------|
| email     | yes      | Subscriber email to retrieve. |


## Search by custom fields in a list

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// SEARCH BY CUSTOM FIELDS IN A LIST
$response = $endpoint->searchByCustomFields('LIST-UNIQUE-ID', [
    'EMAIL' => 'john.doe@doe.com'
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# SEARCH BY CUSTOM FIELDS IN A LIST
response = endpoint.search_by_custom_fields(list_uid = 'LIST-UNIQUE-ID', fields = {
    'EMAIL': 'john.doe@example.com'
}, page = 1, per_page = 10)
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
SEARCH BY CUSTOM FIELDS IN A LIST
"""
response = endpoint.search_by_custom_fields(list_uid='LIST-UNIQUE-ID', fields={
    'EMAIL': 'john.doe@example.com'
}, page=1, per_page=10)

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
    "subscriber_uid": "ll381bxshm01e",
    "EMAIL": "dmacmeartyd@jugem.jp",
    "FNAME": "",
    "LNAME": "",
    "status": "unsubscribed",
    "source": "import",
    "ip_address": "",
    "date_added": "2021-02-20 17:26:18"
  }
}
```
This endpoint searches a subscriber by his custom fields values within a list given by LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers/search-by-custom-fields`

### URL Segments

| Segment        | Required | Description                                        |
|----------------|----------|----------------------------------------------------|
| LIST-UNIQUE-ID | yes      | List to search in.                                 |

### Query Parameters

| Parameter | Required/Default | Description                                        |
|-----------|------------------|----------------------------------------------------|
| array     | yes              | Array of custom fields {'CUSTOM_FIELD' => 'VALUE'} |
| page      | 1                | Current page to retrieve.                          |
| per_page  | 10               | Items per page to retrieve.                        |

## Search by status

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// SEARCH BY STATUS
$response = $endpoint->searchByStatus('LIST-UNIQUE-ID', 'confirmed', $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# TODO - Implement
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
TODO - implement
"""
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "count": "3",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "subscriber_uid": "jl349100yda86",
        "EMAIL": "elacroutz6@youku.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "confirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "kw647a5n8l516",
        "EMAIL": "mstephenson5@trellian.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "confirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "vo155s4b0d0ad",
        "EMAIL": "ldefew4@dailymail.co.uk",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "confirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:14"
      }
    ]
  }
}
```
This endpoint search for the subscribers having a certain status within the list having the LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers`

### URL Segments

| Segment        | Required | Description                                                      |
|----------------|----------|------------------------------------------------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier for which we retrieve the subscribers |

### Query Parameters

| Parameter | Required | Description                     |
|-----------|----------|---------------------------------|
| page      | 1        | Current page to retrieve.       |
| per_page  | 10       | Items per page to retrieve.     |
| status    | yes      | Subscribers status to retrieve. |

## Get blacklisted subscribers

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// Get only the blacklisted subscribers
$response = $endpoint->getBlacklistedSubscribers('LIST-UNIQUE-ID', 'active', $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# TODO - Implement
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
TODO - implement
"""
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "count": "3",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "subscriber_uid": "jl349100yda86",
        "EMAIL": "elacroutz6@youku.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "blacklisted",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "kw647a5n8l516",
        "EMAIL": "mstephenson5@trellian.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "blacklisted",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "vo155s4b0d0ad",
        "EMAIL": "ldefew4@dailymail.co.uk",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "blacklisted",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:14"
      }
    ]
  }
}
```
This endpoint returns all the subscribers with the status blacklisted within the list having the LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers`

### URL Segments

| Segment        | Required | Description                                                      |
|----------------|----------|------------------------------------------------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier for which we retrieve the subscribers |

### Query Parameters

| Parameter | Required    | Description                   |
|-----------|-------------|-------------------------------|
| page      | 1           | Current page to retrieve.     |
| per_page  | 10          | Items per page to retrieve.   |
| status    | blacklisted | The blacklisted status value. |

## Get confirmed subscribers

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// GET ALL ITEMS
$response = $endpoint->getConfirmedSubscribers('LIST-UNIQUE-ID', $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# TODO - Implement
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
TODO - Implement
"""
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "count": "3",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "subscriber_uid": "jl349100yda86",
        "EMAIL": "elacroutz6@youku.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "confirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "kw647a5n8l516",
        "EMAIL": "mstephenson5@trellian.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "confirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "vo155s4b0d0ad",
        "EMAIL": "ldefew4@dailymail.co.uk",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "confirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:14"
      }
    ]
  }
}
```
This endpoint retrieves all the confirmed subscribers of a list.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers`

### URL Segments

| Segment        | Required | Description                                                      |
|----------------|----------|------------------------------------------------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier for which we retrieve the subscribers |

### Query Parameters

| Parameter | Default   | Description                 |
|-----------|-----------|-----------------------------|
| page      | 1         | Current page to retrieve.   |
| per_page  | 10        | Items per page to retrieve. |
| status    | confirmed | The confirmed status value  |

## Get unconfirmed subscribers

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// GET ALL ITEMS
$response = $endpoint->getUnconfirmedSubscribers('LIST-UNIQUE-ID', $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# TODO - Implement
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
TODO - Implement
"""
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "count": "3",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "subscriber_uid": "jl349100yda86",
        "EMAIL": "elacroutz6@youku.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "unconfirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "kw647a5n8l516",
        "EMAIL": "mstephenson5@trellian.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "unconfirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "vo155s4b0d0ad",
        "EMAIL": "ldefew4@dailymail.co.uk",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "unconfirmed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:14"
      }
    ]
  }
}
```
This endpoint retrieves all the unconfirmed subscribers of a list.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers`

### URL Segments

| Segment        | Required | Description                                                      |
|----------------|----------|------------------------------------------------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier for which we retrieve the subscribers |

### Query Parameters

| Parameter | Default     | Description                  |
|-----------|-------------|------------------------------|
| page      | 1           | Current page to retrieve.    |
| per_page  | 10          | Items per page to retrieve.  |
| status    | unconfirmed | The unconfirmed status value |

## Get unsubscribed subscribers

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// GET ALL ITEMS
$response = $endpoint->getUnsubscribedSubscribers('LIST-UNIQUE-ID', $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# TODO - Implement
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
TODO - Implement
"""
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status": "success",
  "data": {
    "count": "3",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "subscriber_uid": "jl349100yda86",
        "EMAIL": "elacroutz6@youku.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "unsubscribed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "kw647a5n8l516",
        "EMAIL": "mstephenson5@trellian.com",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "unsubscribed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:15"
      },
      {
        "subscriber_uid": "vo155s4b0d0ad",
        "EMAIL": "ldefew4@dailymail.co.uk",
        "FNAME": "",
        "LNAME": "",
        "source": "import",
        "status": "unsubscribed",
        "ip_address": "",
        "date_added": "2021-02-20 17:26:14"
      }
    ]
  }
}
```
This endpoint retrieves all the unsubscribed subscribers of a list.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers`

### URL Segments

| Segment        | Required | Description                                                      |
|----------------|----------|------------------------------------------------------------------|
| LIST-UNIQUE-ID | yes      | The list unique identifier for which we retrieve the subscribers |

### Query Parameters

| Parameter | Default      | Description                  |
|-----------|--------------|------------------------------|
| page      | 1            | Current page to retrieve.    |
| per_page  | 10           | Items per page to retrieve.  |
| status    | unsubscribed | The unsubscribe status value |

## Create a subscriber

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// ADD SUBSCRIBER
$response = $endpoint->create('LIST-UNIQUE-ID', [
    'EMAIL'    => 'john.doe@doe.com', // the confirmation email will be sent!!! Use valid email address
    'FNAME'    => 'John',
    'LNAME'    => 'Doe'
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# ADD SUBSCRIBER
response = endpoint.create(list_uid = 'LIST-UNIQUE-ID', data = {
    'EMAIL': 'john.doe@example.com', # the confirmation email will be sent!!! Use valid email address
    'FNAME': 'John',
    'LNAME': 'Doe'
})
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
ADD SUBSCRIBER
"""
response = endpoint.create(list_uid='LIST-UNIQUE-ID', data={
    'EMAIL': 'john.doe@example.com',  # the confirmation email will be sent!!! Use valid email address
    'FNAME': 'John',
    'LNAME': 'Doe'
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
  "status":"success",
  "data": {
    "record": {
      "subscriber_uid": "bm421c3lwe043",
      "email": "john.doe@doe.com",
      "ip_address": "5.13.134.200",
      "source": "api",
      "date_added": {
        "expression": "NOW()",
        "params": {}
      }
    }
  }
}
```
This endpoint creates a subscriber

### HTTP Request

`POST API-URL/lists/LIST-UNIQUE-ID/subscribers`

### URL Segments

| Segment        | Required | Description             |
|----------------|----------|-------------------------|
| LIST-UNIQUE-ID | yes      | List unique identifier. |

### POST Parameters

| Parameter      | Type   | Required | Description                                                              |
|----------------|--------|----------|--------------------------------------------------------------------------|
| data           | array  | yes      | Array with the custom fields {name => value}. The EMAIL key is required. |

## Create subscribers in bulk

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// ADD SUBSCRIBERS IN BULK (since MailWizz 1.8.1)
$response = $endpoint->createBulk('LIST-UNIQUE-ID', [
    [
        'EMAIL'    => 'john.doe-1@doe.com',
        'FNAME'    => 'John',
        'LNAME'    => 'Doe'
    ],
    [
        'EMAIL'    => 'john.doe-2@doe.com',
        'FNAME'    => 'John',
        'LNAME'    => 'Doe'
    ],
    [
        'EMAIL'    => 'john.doe-3@doe.com',
        'FNAME'    => 'John',
        'LNAME'    => 'Doe'
    ]
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# ADD SUBSCRIBERS IN BULK (since MailWizz 1.8.1)
response = endpoint.create_bulk(list_uid = 'LIST-UNIQUE-ID', data = [
    {
        'EMAIL': 'john.doe1111@example.com', # the confirmation email will be sent!!! Use valid email address
        'FNAME': 'John111',
        'LNAME': 'Doe111'
    },
    {
        'EMAIL': 'john.doe2222@example.com', # the confirmation email will be sent!!! Use valid email address
        'FNAME': 'John222',
        'LNAME': 'Doe222'
    },
    {
        'EMAIL': 'john.doe3333@example.com', # the confirmation email will be sent!!! Use valid email address
        'FNAME': 'John333',
        'LNAME': 'Doe333'
    },
])
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
ADD SUBSCRIBERS IN BULK (since MailWizz 1.8.1)
"""
response = endpoint.create_bulk(list_uid='LIST-UNIQUE-ID', data=[
    {
        'EMAIL': 'john.doe1@example.com',  # the confirmation email will be sent!!! Use valid email address
        'FNAME': 'John1',
        'LNAME': 'Doe1'
    },
    {
        'EMAIL': 'john.doe2@example.com',  # the confirmation email will be sent!!! Use valid email address
        'FNAME': 'John2',
        'LNAME': 'Doe2'
    },
    {
        'EMAIL': 'john.doe3@example.com',  # the confirmation email will be sent!!! Use valid email address
        'FNAME': 'John3',
        'LNAME': 'Doe3'
    },
])

"""
DISPLAY RESPONSE
"""
print(response.content)
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status":"success",
  "data": {
    "records": [
      {
        "data": {
          "subscriber_uid": "kw647a5n8l516",
          "EMAIL": "john.doe1@example.com",
          "FNAME": "John1",
          "LNAME": "Doe1",
          "status": "confirmed",
          "source": "import",
          "ip_address": "",
          "date_added": "2021-02-20 17:26:14"
        }
      },
      {
        "data": {
          "subscriber_uid": "fy287b32cs054",
          "EMAIL": "john.doe1@example.com",
          "FNAME": "John2",
          "LNAME": "Doe2",
          "status": "confirmed",
          "source": "import",
          "ip_address": "",
          "date_added": "2021-02-20 17:26:14"
        }
      },
      {
        "data": {
          "subscriber_uid": "vo155s4b0d0ad",
          "EMAIL": "john.doe3@example.com",
          "FNAME": "John3",
          "LNAME": "Doe3",
          "status": "confirmed",
          "source": "import",
          "ip_address": "",
          "date_added": "2021-02-20 17:26:14"
        }
      }
    ]
  }
}
```
This endpoint creates subscribers in bulk

### HTTP Request

`POST API-URL/lists/LIST-UNIQUE-ID/subscribers/bulk`

### URL Segments

| Segment        | Required | Description             |
|----------------|----------|-------------------------|
| LIST-UNIQUE-ID | yes      | List unique identifier. |

### POST Parameters

| Parameter      | Type   | Required | Description                                                                        |
|----------------|--------|----------|------------------------------------------------------------------------------------|
| array          | string | yes      | Array of arrays with the custom fields {name => value}. The EMAIL key is required. |

## Update a subscriber

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// UPDATE EXISTING SUBSCRIBER
$response = $endpoint->update('LIST-UNIQUE-ID', 'SUBSCRIBER-UNIQUE-ID', [
    'EMAIL'    => 'john.doe@doe.com',
    'FNAME'    => 'John',
    'LNAME'    => 'Doe Updated'
]);

// DISPLAY RESPONSE
echo '<hr />';
echo '<pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# UPDATE EXISTING SUBSCRIBER
response = endpoint.update(list_uid = 'LIST-UNIQUE-ID', subscriber_uid = 'SUBSCRIBER-UNIQUE_ID', data = {
    'EMAIL': 'john.doe.updated@example.com', # the confirmation email will be sent!!! Use valid email address
    'FNAME': 'John Updated',
    'LNAME': 'Doe Updated'
})

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
UPDATE EXISTING SUBSCRIBER
"""
response = endpoint.update(list_uid='LIST-UNIQUE-ID', subscriber_uid='SUBSCRIBER-UNIQUE_ID', data={
    'EMAIL': 'john.doe.updated@example.com',  # the confirmation email will be sent!!! Use valid email address
    'FNAME': 'John Updated',
    'LNAME': 'Doe Updated'
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
      "subscriber_uid": "kw647a5n8l516",
      "email": "john.doe.updated@example.com",
      "ip_address": "10.10.10.10",
      "source": "api",
      "date_added": "2021-02-20 17:26:14"
    }
  }
}
```
This endpoint update the subscriber with the given SUBSCRIBER-UNIQUE-ID from the given list LIST-UNIQUE-ID.

### HTTP Request

`PUT API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID`

### URL Segments

| Parameter            | Required | Description                                                 |
|----------------------|----------|-------------------------------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique identifier                                      |
| SUBSCRIBER-UNIQUE-ID | yes      | Subscriber unique identifier                                |

### PUT Parameters

| Parameter            | Type   | Required | Description                                                 |
|----------------------|--------|----------|-------------------------------------------------------------|
| data                 | array  | yes      | Array with the custom fields {name => value} to be updated. |

## Update a subscriber by email

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// UPDATE EXISTING SUBSCRIBER BY EMAIL
$response = $endpoint->updateByEmail('LIST-UNIQUE-ID', 'john@doe.com', [
    'EMAIL'    => 'john.doe@doe.com',
    'FNAME'    => 'John',
    'LNAME'    => 'Doe Updated'
]);

// DISPLAY RESPONSE
echo '<hr />';
echo '<pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# TODO - to be implemented
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
TODO - to be implemented
"""
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status":"success",
  "data": {
    "record": {
      "subscriber_uid": "kw647a5n8l516",
      "email": "john.doe@doe.com",
      "ip_address": "10.10.10.10",
      "source": "api",
      "date_added": "2021-02-20 17:26:14"
    }
  }
}
```
This endpoint update the subscriber with the given EMAIL from the given list LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers/search-by-email`

`PUT API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID`

### URL Segments

| Segment              | Required | Description                        |
|----------------------|----------|------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique identifier             |
| SUBSCRIBER-UNIQUE-ID | yes      | Found subscriber unique identifier |

### GET/PUT Parameters

| Parameter      | Type   | Required | Description                                                 |
|----------------|--------|----------|-------------------------------------------------------------|
| EMAIL          | string | yes      | Email to be searched                                        |
| data           | array  | yes      | Array with the custom fields {name => value} to be updated. |

## Create/Update a subscriber

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// CREATE / UPDATE EXISTING SUBSCRIBER
$response = $endpoint->createUpdate('LIST-UNIQUE-ID', [
    'EMAIL'    => 'john.doe@doe.com',
    'FNAME'    => 'John',
    'LNAME'    => 'Doe Updated Second time'
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# CREATE / UPDATE EXISTING SUBSCRIBER
response = endpoint.create_update(list_uid = 'LIST-UNIQUE-ID', data = {
    'EMAIL': 'john.doe@doe.com', # the confirmation email will be sent!!! Use valid email address
    'FNAME': 'John Updated ah',
    'LNAME': 'Doe Updated'
})


# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
CREATE / UPDATE EXISTING SUBSCRIBER
"""
response = endpoint.create_update(list_uid='LIST-UNIQUE-ID', data={
    'EMAIL': 'john.doe@doe.com',  # the confirmation email will be sent!!! Use valid email address
    'FNAME': 'John Updated',
    'LNAME': 'Doe Updated'
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
  "status":"success",
  "data": {
    "record": {
      "subscriber_uid": "kw647a5n8l516",
      "email": "john.doe@doe.com",
      "ip_address": "10.10.10.10",
      "source": "api",
      "date_added": "2021-02-20 17:26:14"
    }
  }
}
```
This endpoint update the subscriber if exists and created it otherwise, from the given list LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers/search-by-email`  

`PUT API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID`  

`POST API-URL/lists/LIST-UNIQUE-ID/subscribers`  

### URL Segments

| Segment              | Required | Description                        |
|----------------------|----------|------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique identifier             |
| SUBSCRIBER-UNIQUE-ID | yes      | Found subscriber unique identifier |

### GET/PUT/POST Parameters

| Parameter      | Type   | Required | Description                                                 |
|----------------|--------|----------|-------------------------------------------------------------|
| data           | array  | yes      | Array with the custom fields {name => value} to be updated. |
| EMAIL          | string | yes      | Email to be searched                                        |

## Unsubscribe a subscriber

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// UNSUBSCRIBE existing subscriber, no email is sent, unsubscribe is silent
$response = $endpoint->unsubscribe('LIST-UNIQUE-ID', 'SUBSCRIBER-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';

{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# UNSUBSCRIBE existing subscriber, no email is sent, unsubscribe is silent
response = endpoint.unsubscribe(list_uid = 'LIST-UNIQUE-ID', subscriber_uid = 'SUBSCRIBER-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
UNSUBSCRIBE existing subscriber, no email is sent, unsubscribe is silent
"""
response = endpoint.unsubscribe(list_uid='LIST-UNIQUE-ID', subscriber_uid='SUBSCRIBER-UNIQUE-ID')

"""
DISPLAY RESPONSE
"""
print(response.content)
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```
This endpoint unsubscribes the subscriber with the given SUBSCRIBER-UNIQUE-ID from the given LIST-UNIQUE-ID.

### HTTP Request

`PUT API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID/unsubscribe`

### URL Segments

| Segment              | Required | Description                                     |
|----------------------|----------|-------------------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique id to which the subscriber belongs. |
| SUBSCRIBER-UNIQUE-ID | yes      | Subscriber unique id to unsubscribe.            |

## Unsubscribe a subscriber by email address

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// UNSUBSCRIBE existing subscriber by email address, no email is sent, unsubscribe is silent
$response = $endpoint->unsubscribeByEmail('LIST-UNIQUE-ID', 'john@doe.com');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# UNSUBSCRIBE existing subscriber by email address, no email is sent, unsubscribe is silent
response = endpoint.unsubscribe_by_email(list_uid = 'LIST-UNIQUE-ID', email_address = 'john.doe@example.com')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
UNSUBSCRIBE existing subscriber by email address, no email is sent, unsubscribe is silent
"""
response = endpoint.unsubscribe_by_email(list_uid='LIST-UNIQUE-ID', email_address='john.doe@example.com')

"""
DISPLAY RESPONSE
"""
print(response.content)
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```
This endpoint unsubscribes the subscriber with the given EMAIL from the given LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers/search-by-email`

`PUT API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID/unsubscribe`

### URL Segments

| Segment              | Required | Description                                     |
|----------------------|----------|-------------------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique id to which the subscriber belongs. |
| SUBSCRIBER-UNIQUE-ID | yes      | Subscriber unique id to unsubscribe.            |

### Query Parameters

| Parameter      | Required | Description                                     |
|----------------|----------|-------------------------------------------------|
| EMAIL          | yes      | Subscriber email to unsubscribe.                |

## Unsubscribe a subscriber by email address from all the lists

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// UNSUBSCRIBE existing subscriber from all lists, no email is sent, unsubscribe is silent
$response = $endpoint->unsubscribeByEmailFromAllLists('john@doe.com');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# UNSUBSCRIBE existing subscriber by email address from all lists, no email is sent, unsubscribe is silent
response = endpoint.unsubscribe_by_email_from_all_lists(email_address = 'john.doe@example.com')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
UNSUBSCRIBE existing subscriber by email address from all lists, no email is sent, unsubscribe is silent
"""
response = endpoint.unsubscribe_by_email_from_all_lists(email_address='john.doe@example.com')

"""
DISPLAY RESPONSE
"""
print(response.content)
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```
This endpoint unsubscribes the subscriber with the given EMAIL from all the lists.

### HTTP Request

`PUT API-URL/lists/subscribers/unsubscribe-by-email-from-all-lists`

### PUT Parameters

| Parameter | Required | Description                      |
|-----------|----------|----------------------------------|
| EMAIL     | yes      | Subscriber email to unsubscribe. |

## Delete one subscriber

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// DELETE SUBSCRIBER, no email is sent, delete is silent
$response = $endpoint->delete('LIST-UNIQUE-ID', 'SUBSCRIBER-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# DELETE SUBSCRIBER, no email is sent, delete is silent
response = endpoint.delete(list_uid = 'LIST-UNIQUE-ID', subscriber_uid = 'SUBSCRIBER-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
DELETE SUBSCRIBER, no email is sent, delete is silent
"""
response = endpoint.delete(list_uid='LIST-UNIQUE-ID', subscriber_uid='SUBSCRIBER-UNIQUE-ID')

"""
DISPLAY RESPONSE
"""
print(response.content)
{{< /tab >}}
{{< /tabpane >}}


> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```
This endpoint deletes the subscriber with the given SUBSCRIBER-UNIQUE-ID from the given LIST-UNIQUE-ID.

### HTTP Request

`DELETE API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID`

### URL Segments

| Segment              | Required | Description                                     |
|----------------------|----------|-------------------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique id to which the subscriber belongs. |
| SUBSCRIBER-UNIQUE-ID | yes      | Subscriber unique id to delete.                 |

## Delete by email

{{< tabpane >}}
{{< tab header="PHP" lang="php" >}}
// DELETE SUBSCRIBER by email address, no email is sent, delete is silent
$response = $endpoint->deleteByEmail('LIST-UNIQUE-ID', 'john@doe.com');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
{{< /tab >}}
{{< tab header="Ruby" lang="ruby" >}}
# DELETE SUBSCRIBER by email address, no email is sent, delete is silent
response = endpoint.delete_by_email(list_uid = 'LIST-UNIQUE-ID', email_address = 'john.doe@example.com')

# DISPLAY RESPONSE
puts response.body
{{< /tab >}}
{{< tab header="Python" lang="python" >}}
"""
DELETE SUBSCRIBER by email address, no email is sent, delete is silent
"""
response = endpoint.delete_by_email(list_uid='LIST-UNIQUE-ID', email_address='john.doe@example.com')

"""
DISPLAY RESPONSE
"""
print(response.content)
{{< /tab >}}
{{< /tabpane >}}

> The above command returns an object structured like this JSON:

```json
{
  "status":"success"
}
```
This endpoint deletes a subscriber by his email within the list having the LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID/subscribers/search-by-email`

`DELETE API-URL/lists/LIST-UNIQUE-ID/subscribers/SUBSCRIBER-UNIQUE-ID`

### URL Segments

| Segment              | Required | Description                                     |
|----------------------|----------|-------------------------------------------------|
| LIST-UNIQUE-ID       | yes      | List unique id to which the subscriber belongs. |
| SUBSCRIBER-UNIQUE-ID | yes      | Subscriber unique id to delete.                 |

### GET Parameters

| Parameter      | Required | Description                                                 |
|----------------|----------|-------------------------------------------------------------|
| email          | yes      | Subscriber email to retrieve.                               |
