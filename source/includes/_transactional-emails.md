# Transactional Emails

## Transactional emails endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\TransactionalEmails();
```

```ruby
# CREATE THE ENDPOINT
endpoint = TransactionalEmails.new
```

```python
"""
CREATE THE ENDPOINT
"""
endpoint = TransactionalEmails()
```

## Get all transactional emails
```php
// GET ALL ITEMS
$response = $endpoint->getEmails($pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ALL ITEMS
response = endpoint.get_emails(page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ALL ITEMS
"""
response = endpoint.get_emails(page=1, per_page=10)

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
    "count": "3",
    "total_pages": 1,
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "records": [
      {
        "email_uid": "pc939rqfc16c5",
        "customer_id": "1",
        "to_email": "john@doe.com",
        "to_name": "John Doe",
        "from_email": "jane@doe.com",
        "from_name": "Jane Doe",
        "reply_to_email": "jane@doe.com",
        "reply_to_name": "Jane Doe",
        "subject": "This is the email subject",
        "body": "<strong>Hello world!<\/strong>",
        "plain_text": "HELLO WORLD!",
        "priority": "5",
        "retries": "0",
        "max_retries": "3",
        "send_at": "2021-02-25 11:00:58",
        "fallback_system_servers": "no",
        "status": "sent",
        "date_added": "2021-02-25 11:01:00",
        "last_updated": "2021-02-25 11:02:01",
        "attachments": []
      },
      {
        "email_uid": "ja646gs7w3d09",
        "customer_id": "1",
        "to_email": "laurennntiu.zorila@gmail.com",
        "to_name": "John Doe",
        "from_email": "jane@doe.com",
        "from_name": "Jane Doe",
        "reply_to_email": "jane@doe.com",
        "reply_to_name": "Jane Doe",
        "subject": "This is the email subject",
        "body": "<strong>Hello world!<\/strong>",
        "plain_text": "HELLO WORLD!",
        "priority": "5",
        "retries": "0",
        "max_retries": "3",
        "send_at": "2021-02-23 08:57:13",
        "fallback_system_servers": "no",
        "status": "sent",
        "date_added": "2021-02-23 08:57:18",
        "last_updated": "2021-02-23 08:58:01",
        "attachments": []
      },
      {
        "email_uid": "zd716gnx0y1a1",
        "customer_id": "1",
        "to_email": "john@doe.com",
        "to_name": "John Doe",
        "from_email": "jane@doe.com",
        "from_name": "Jane Doe",
        "reply_to_email": "jane@doe.com",
        "reply_to_name": "Jane Doe",
        "subject": "This is the email subject",
        "body": "<strong>Hello world!<\/strong>",
        "plain_text": "HELLO WORLD!",
        "priority": "5",
        "retries": "0",
        "max_retries": "3",
        "send_at": "2021-02-23 08:53:10",
        "fallback_system_servers": "no",
        "status": "sent",
        "date_added": "2021-02-23 08:53:15",
        "last_updated": "2021-02-23 08:54:01",
        "attachments": []
      }
    ]
  }
}
```
This endpoint retrieves all the transactional emails.

### HTTP Request

`GET API-URL/transactional-emails`

### Query Parameters

| Parameter  | Default | Description                 |
|------------|---------|-----------------------------|
| pageNumber | 1       | Current page to retrieve.   |
| perPage    | 10      | Items per page to retrieve. |

## Get one transactional email
```php
// GET ONE ITEM
$response = $endpoint->getEmail('EMAIL-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ONE ITEM
response = endpoint.get_email(email_uid = 'EMAIL-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ONE ITEM
"""
response = endpoint.get_email(email_uid='EMAIL-UNIQUE-ID')

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
      "email_uid": "pc939rqfc16c5",
      "customer_id": "1",
      "to_email": "john@doe.com",
      "to_name": "John Doe",
      "from_email": "jane@doe.com",
      "from_name": "Jane Doe",
      "reply_to_email": "jane@doe.com",
      "reply_to_name": "Jane Doe",
      "subject": "This is the email subject",
      "body": "<strong>Hello world!<\/strong>",
      "plain_text": "HELLO WORLD!",
      "priority": "5",
      "retries": "0",
      "max_retries": "3",
      "send_at": "2021-02-25 11:00:58",
      "fallback_system_servers": "no",
      "status": "sent",
      "date_added": "2021-02-25 11:01:00",
      "last_updated": "2021-02-25 11:02:01",
      "attachments": [
        {
          "type": "application/pdf",
          "name": "filename",
          "data": "Email attachment content blob"
        }
      ]
    }
  }
}
```
This endpoint retrieves the transactional email with the given EMAIL-UNIQUE-ID.

### HTTP Request

`GET API-URL/transactional-emails/EMAIL-UNIQUE-ID`

### URL Segment

| Segment         | Required | Description                        |
|-----------------|----------|------------------------------------|
| EMAIL-UNIQUE-ID | yes      | Email unique id which to retrieve. |

## Create a transactional email

```php 
// CREATE A NEW EMAIL
$response = $endpoint->create([
    'to_name'           => 'John Doe', // required
    'to_email'          => 'john@doe.com', // required
    'from_name'         => 'Jane Doe', // required
    'from_email'        => 'jane@doe.com', // optional
    'reply_to_name'     => 'Jane Doe', // optional
    'reply_to_email'    => 'jane@doe.com', // optional
    'subject'           => 'This is the email subject', // required
    'body'              => '<strong>Hello world!</strong>', // required
    'plain_text'        => 'Hello world!', // optional, will be autogenerated if missing
    'send_at'           => date('Y-m-d H:i:s'),  // required, UTC date time in same format!,
    'attachments'       => [
        [
            'type' => 'image/png',
            'name' => basename(__DIR__ . '/PATH_TO_YOUR_FILE/file.png'),
            'data' => base64_encode((string)file_get_contents(__DIR__ . '/PATH_TO_YOUR_FILE/file.png')),
        ],
        [
            'type' => 'image/jpeg',
            'name' => basename(__DIR__ . '/PATH_TO_YOUR_FILE/file.jpg'),
            'data' => base64_encode((string)file_get_contents(__DIR__ . '/PATH_TO_YOUR_FILE/file.jpg')),
        ],
        [
            'type' => 'application/pdf',
            'name' => basename(__DIR__ . '/PATH_TO_YOUR_FILE/file.pdf'),
            'data' => base64_encode((string)file_get_contents(__DIR__ . '/PATH_TO_YOUR_FILE/file.pdf')),
        ],
    ]
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# CREATE A NEW EMAIL
response = endpoint.create(data = {
    'to_name': 'John Doe', # required
    'to_email': 'john@doe.com', # required
    'from_name': 'Jane Doe', # required
    'from_email': 'jane@doe.com', # optional
    'reply_to_name': 'Jane Doe', # optional
    'reply_to_email': 'jane@doe.com', # optional
    'subject': 'This is the email subject', # required
    'body': 'Hello world!', # required
    'plain_text': 'Hello world!', # optional, will be autogenerated if missing
    'send_at': Time.now.strftime('%Y-%m-%d %H:%M:%S'), # required, UTC date time in same format!
})

# DISPLAY RESPONSE
puts response.body
```

```python
"""
CREATE A NEW EMAIL
"""
response = endpoint.create(data={
    'to_name': 'John Doe',  # required
    'to_email': 'john@doe.com',  # required
    'from_name': 'Jane Doe',  # required
    'from_email': 'jane@doe.com',  # optional
    'reply_to_name': 'Jane Doe',  # optional
    'reply_to_email': 'jane@doe.com',  # optional
    'subject': 'This is the email subject',  # required
    'body': 'Hello world!',  # required
    'plain_text': 'Hello world!',  # optional, will be autogenerated if missing
    'send_at': (datetime.now()).strftime('%Y-%m-%d %H:%M:%S'),  # required, UTC date time in same format!
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
  "email_uid": "vy348j4jqn1d1"
}
```
This endpoint creates a transactional email.

### HTTP Request

`POST API-URL/transactional-emails`

### POST Parameters

| Parameter | Type  | Required | Description                   |
|-----------|-------|----------|-------------------------------|
| data      | array | yes      | Array with the email details. |

**Data block - required**

| Parameter      | Type     | Required | Description                                               |
|----------------|----------|----------|-----------------------------------------------------------|
| to_name        | string   | yes      | Recipient name                                            |
| to_email       | string   | yes      | Recipient email                                           |
| from_name      | string   | yes      | Sender name                                               |
| subject        | string   | yes      | Email subject                                             |
| body           | string   | yes      | Email body                                                |
| send_at        | datetime | yes      | UTC datetime (Y-m-d H:i:s format)                         |
| plain_text     | string   | no       | Email plain text. Auto generated if missing               |
| from_email     | string   | no       | Sender email                                              |
| reply_to_name  | string   | no       | Reply to name                                             |
| reply_to_email | string   | no       | Reply to email                                            |
| attachments    | array    | no       | Array of attachments in the form ['type', 'name', 'data'] |

## Delete a transactional email
```php
// delete email
$response = $endpoint->delete('EMAIL-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# DELETE EMAIL
response = endpoint.delete('EMAIL-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
DELETE EMAIL
"""
response = endpoint.delete('EMAIL-UNIQUE-ID')

"""
DISPLAY RESPONSE
"""
print(response.content)
```
> The above command returns an object structured like this JSON:

```json
{
  "status": "success"
}
```
This endpoint will delete the transactional email with the given TEMPLATE-UNIQUE-ID.

### HTTP Request

`DELETE API-URL/transactional-emails/EMAIL-UNIQUE-ID`

### URL Segments

| Segment         | Required | Description                |
|-----------------|----------|----------------------------|
| EMAIL-UNIQUE-ID | yes      | Email unique id to delete. |
