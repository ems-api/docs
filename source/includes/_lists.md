# Lists

## Create the lists endpoint
```php
/ CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\Lists();
```

```ruby
# CREATE THE ENDPOINT
endpoint = Lists.new
```

```python
from mailwizz.endpoint.lists import Lists

"""
CREATE THE ENDPOINT
"""
endpoint = Lists()
```

## Get all lists
```php
// GET ALL ITEMS
$response = $endpoint->getLists($pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ALL ITEMS
response = endpoint.get_lists(page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ALL ITEMS
"""
response = endpointLists.get_lists(page=1, per_page=10)

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
    "count": "12",
    "total_pages": 2,
    "current_page": 1,
    "next_page": 2,
    "prev_page": null,
    "records": [
      {
        "general": {
          "list_uid": "tz601yx7aa61b",
          "name": "Testing list #4",
          "display_name": "Testing list",
          "description": "Testing list"
        },
        "defaults": {
          "from_name": "Test user",
          "reply_to": "user@example.com",
          "subject": ""
        },
        "notifications": {
          "subscribe": "no",
          "unsubscribe": "no",
          "subscribe_to": "",
          "unsubscribe_to": ""
        },
        "company": {
          "name": "Support",
          "address_1": "Test",
          "address_2": "",
          "zone_name": "Constanta",
          "city": "Constanta",
          "zip_code": "1234x",
          "phone": "",
          "address_format": "[COMPANY_NAME]\n[COMPANY_ADDRESS_1] [COMPANY_ADDRESS_2]\n[COMPANY_CITY] [COMPANY_ZONE] [COMPANY_ZIP]\n[COMPANY_COUNTRY]\n[COMPANY_WEBSITE]",
          "country": {
            "country_id": "1",
            "name": "Afghanistan",
            "code": "AF"
          }
        }
      },
      {
        "general": {
          "list_uid": "zh103m6twfcd2",
          "name": "Testing list #5",
          "display_name": "Testing list",
          "description": "Testing list"
        },
        "defaults": {
          "from_name": "Test user",
          "reply_to": "user@example.com",
          "subject": ""
        },
        "notifications": {
          "subscribe": "no",
          "unsubscribe": "no",
          "subscribe_to": "",
          "unsubscribe_to": ""
        },
        "company": {
          "name": "Support",
          "address_1": "Test",
          "address_2": "",
          "zone_name": "Constanta",
          "city": "Constanta",
          "zip_code": "1234x",
          "phone": "",
          "address_format": "[COMPANY_NAME]\n[COMPANY_ADDRESS_1] [COMPANY_ADDRESS_2]\n[COMPANY_CITY] [COMPANY_ZONE] [COMPANY_ZIP]\n[COMPANY_COUNTRY]\n[COMPANY_WEBSITE]",
          "country": {
            "country_id": "1",
            "name": "Afghanistan",
            "code": "AF"
          }
        }
      }
    ]
  }
}
```
This endpoint retrieves all the lists.

### HTTP Request

`GET API-URL/lists`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
pageNumber | 1 | Current page to retrieve.
perPage | 10 | Items per page to retrieve.

## Get one list
```php
// get a single list
$response = $endpoint->getList('LIST-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ONE ITEM
response = endpoint.get_list('LIST-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ONE ITEM
"""
response = endpointLists.get_list('LIST-UNIQUE-ID')

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
      "general": {
        "list_uid": "cn417nrhmv922",
        "name": "Testing list #4",
        "display_name": "Testing list",
        "description": "Testing list"
      },
      "defaults": {
        "from_name": "User Test",
        "reply_to": "user@example.com",
        "subject": ""
      },
      "notifications": {
        "subscribe": "no",
        "unsubscribe": "no",
        "subscribe_to": "",
        "unsubscribe_to": ""
      },
      "company": {
        "name": "Support",
        "address_1": "Test",
        "address_2": "",
        "zone_name": "Constanta",
        "city": "Constanta",
        "zip_code": "1234x",
        "phone": "",
        "address_format": "[COMPANY_NAME]\n[COMPANY_ADDRESS_1] [COMPANY_ADDRESS_2]\n[COMPANY_CITY] [COMPANY_ZONE] [COMPANY_ZIP]\n[COMPANY_COUNTRY]\n[COMPANY_WEBSITE]",
        "country": {
          "country_id": "1",
          "name": "Afghanistan",
          "code": "AF"
        }
      }
    }
  }
}
```
This endpoint retrieves the list with the given LIST-UNIQUE-ID.

### HTTP Request

`GET API-URL/lists/LIST-UNIQUE-ID`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
LIST-UNIQUE-ID | yes | List unique id which to retrieve.

## Create a list

```php 
// create a new list
// please see countries.php example file for a list of allowed countries/zones for list company
$response = $endpoint->create([
    // required
    'general' => [
        'name'          => 'My list created from the API', // required
        'description'   => 'This is a test list, created from the API.', // required
    ],
    // required
    'defaults' => [
        'from_name' => 'John Doe', // required
        'from_email'=> 'johndoe@doe.com', // required
        'reply_to'  => 'johndoe@doe.com', // required
        'subject'   => 'Hello!',
    ],
    // optional
    'notifications' => [
        // notification when new subscriber added
        'subscribe'         => 'yes', // yes|no
        // notification when subscriber unsubscribes
        'unsubscribe'       => 'yes', // yes|no
        // where to send the notifications.
        'subscribe_to'      => 'johndoe@doe.com',
        'unsubscribe_to'    => 'johndoe@doe.com',
    ],
    // optional, if not set customer company data will be used
    'company' => [
        'name'      => 'John Doe INC', // required
        'country'   => 'United States', // required
        'zone'      => 'New York', // required
        'address_1' => 'Some street address', // required
        'address_2' => '',
        'zone_name' => '', // when country doesn't have required zone.
        'city'      => 'New York City',
        'zip_code'  => '10019',
    ],
]);

// and get the response
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# CREATE ONE LIST
response = endpoint.create({
     # required
     'general': {
         'name': 'My list created from the API', # required
         'description': 'This is a test list, created from the API.', # required
     },
     'defaults': {
         'from_name': 'John Doe', # required
         'from_email': 'johndoe@doe.com', # required
         'reply_to': 'johndoe@doe.com', # required
         'subject': 'Hello!',
     }
 })

# DISPLAY RESPONSE
puts response.body
```

```python
"""
CREATE ONE LIST
"""
response = endpointLists.create({
    # required
    'general': {
        'name': 'My list created from the API',  # required
        'description': 'This is a test list, created from the API.',  # required
    },
    'defaults': {
        'from_name': 'John Doe',  # required
        'from_email': 'johndoe@doe.com',  # required
        'reply_to': 'johndoe@doe.com',  # required
        'subject': 'Hello!',
    }
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
  "list_uid": "hv4163y076d84"
}
```
This endpoint creates a list. 

The $data param can contain following indexed arrays:

-> general - required

-> defaults - required

-> notifications - optional

-> company - optional, if not set customer company data will be used

Please see countries.php example file for a list of allowed countries/zones for list company

### HTTP Request

`POST API-URL/lists/create`

### POST Parameters

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
data | array | yes | Array with the list details. The following indexed arrays are accepted: general, defaults, notifications, company

**General block - required**

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
name | string | yes | List name
description | string | yes | List description

**Defaults block - required**

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
from_name | string | yes | From name
from_email | string | yes | From email
reply_to | string | yes | Reply to email
subject | string | no | List subject

**Notifications block - optional**

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
subscribe | Yes/No | no | Notification when new subscriber added
unsubscribe | Yes/No | no | Notification when new subscriber unsubscribe
subscribe_to | string | no | Where to send the notifications on subscribe
unsubscribe_to | string | no | Where to send the notifications on unsubscribe

**Company block - optional - if not set customer company data will be used**

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
name | string | yes | Company name
country | string | yes | Company country
zone | string | yes | Company zone
address_1 | string | yes | Company address
address_2 | string | no | Company address 2
zone_name | string | no | Company address - when country doesn't have required zone.
city | string | no | Company city
zipcode | string | no | Company zipcode

## Update a list

```php 
// update list
// please see countries.php example file for a list of allowed countries/zones for list company
$response = $endpoint->update('LIST-UNIQUE-ID', [
    // required
    'general' => [
        'name'          => 'My list created from the API - now updated!', // required
        'description'   => 'This is a test list, created from the API.', // required
    ],
    // required
    'defaults' => [
        'from_name' => 'John Doe', // required
        'from_email'=> 'johndoe@doe.com', // required
        'reply_to'  => 'johndoe@doe.com', // required
        'subject'   => 'Hello!',
    ],
    // optional
    'notifications' => [
        // notification when new subscriber added
        'subscribe'         => 'yes', // yes|no
        // notification when subscriber unsubscribes
        'unsubscribe'       => 'yes', // yes|no
        // where to send the notifications.
        'subscribe_to'      => 'johndoe@doe.com',
        'unsubscribe_to'    => 'johndoe@doe.com',
    ],
    // optional, if not set customer company data will be used
    'company' => [
        'name'      => 'John Doe INC', // required
        'country'   => 'United States', // required
        'zone'      => 'New York', // required
        'address_1' => 'Some street address', // required
        'address_2' => '',
        'zone_name' => '',
        'city'      => 'New York City',
        'zip_code'  => '10019',
    ],
]);

// and get the response
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# UPDATE ONE LIST
response = endpoint.update('LIST-UNIQUE-ID', {
    # required
    'general': {
        'name': 'My list created from the API and now updated', # required
        'description': 'This is a test list, created from the API.', # required
    },
    'defaults': {
        'from_name': 'John Doe', # required
        'from_email': 'johndoe@doe.com', # required
        'reply_to': 'johndoe@doe.com', # required
        'subject': 'Hello!',
    }
})

# DISPLAY RESPONSE
puts response.body
```

```python
"""
UPDATE ONE LIST
"""
response = endpointLists.update('LIST-UNIQUE-ID', {
    # required
    'general': {
        'name': 'My list created from the API and now updated',  # required
        'description': 'This is a test list, created from the API.',  # required
    },
    'defaults': {
        'from_name': 'John Doe',  # required
        'from_email': 'johndoe@doe.com',  # required
        'reply_to': 'johndoe@doe.com',  # required
        'subject': 'Hello!',
    }
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
This endpoint updates a list.

### HTTP Request

`PUT API-URL/lists/update/LIST-UNIQUE-ID`

### POST Parameters

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
LIST-UNIQUE-ID | string | yes | List unique identifier
data | array | yes | Array with the list details. The following indexed arrays are accepted: general, defaults, notifications, company. See the create section for details

## Copy a list
```php
// copy a list
$response = $endpoint->copy('LIST-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# COPY A LIST
response = endpoint.copy('LIST-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
COPY A LIST
"""
response = endpointLists.copy('LIST-UNIQUE-ID')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status":"success",
  "list_uid": "hv4163y076d84"
}
```

This endpoint copy the list with the given LIST-UNIQUE-ID.

### HTTP Request

`POST API-URL/lists/LIST-UNIQUE-ID/copy`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
LIST-UNIQUE-ID | yes | List unique id to copy.

## Delete a list
```php
// delete a list
$response = $endpoint->delete('LIST-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# DELETE A LIST
response = endpoint.delete('LIST-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
DELETE A LIST
"""
response = endpointLists.delete('LIST-UNIQUE-ID')

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

This endpoint will delete the list with the given LIST-UNIQUE-ID.

### HTTP Request

`DELETE API-URL/lists/LIST-UNIQUE-ID`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
LIST-UNIQUE-ID | yes | List unique id to delete.
