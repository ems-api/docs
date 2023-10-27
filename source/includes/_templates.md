# Templates

## Templates endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\Templates();
```

```ruby
# CREATE THE ENDPOINT
endpoint = Templates.new
```

```python
from mailwizz.endpoint.templates import Templates

"""
CREATE THE ENDPOINT
"""
endpoint = Templates()
```

## Get all templates
```php
// GET ALL ITEMS
$response = $endpoint->getTemplates($pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ALL TEMPLATES
response = endpoint.get_templates(page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ALL TEMPLATES
"""
response = endpoint.get_templates(page=1, per_page=10)

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
    "records": [
      {
        "template_uid": "xxxxxxxxx",
        "name": "portfolio_html (1)",
        "screenshot": "https:\/\/domain.com\/frontend\/assets\/gallery\/ew055sq9tn97e\/img_ytStill.png"
     }
    ]
  }
}
```
This endpoint retrieves all the templates.

### HTTP Request

`GET API-URL/templates`

### Query Parameters

| Parameter  | Default | Description                 |
|------------|---------|-----------------------------|
| pageNumber | 1       | Current page to retrieve.   |
| perPage    | 10      | Items per page to retrieve. |

## Get one template
```php
// GET ONE ITEM
$response = $endpoint->getTemplate('TEMPLATE-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ONE ITEM
response = endpoint.get_template(template_uid = 'TEMPLATE-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET ONE ITEM
"""
response = endpoint.get_template(template_uid='TEMPLATE-UNIQUE-ID')

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
      "name": "portfolio_html (1)",
      "content": "HTML content...",
      "screenshot": "https:\/\/domain.com\/frontend\/assets\/gallery\/ew055sq9tn97e\/img_ytStill.png"
    }
  }
}
```
This endpoint retrieves the template with the given TEMPLATE-UNIQUE-ID.

### HTTP Request

`GET API-URL/templates/TEMPLATE-UNIQUE-ID`

### URL Segments

| Segment            | Required | Description                           |
|--------------------|----------|---------------------------------------|
| TEMPLATE-UNIQUE-ID | yes      | Template unique id which to retrieve. |

## Search templates
```php
// Search ALL ITEMS (available from MailWizz 1.4.4)
$response = $endpoint->searchTemplates($pageNumber = 1, $perPage = 10, [
    'name' => 'my template name'
]);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# SEARCH FOR TEMPLATES
response = endpoint.search_templates(page = 1, per_page = 10, filters = {
    'name': 'example-template'
})

# DISPLAY RESPONSE
puts response.body
```

```python
"""
SEARCH FOR TEMPLATES
"""
response = endpoint.search_templates(page=1, per_page=10, filters={
    'name': 'example-template'
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
    "records": [
      {
      "name": "portfolio_html (1)",
      "content": "HTML content...",
      "screenshot": "https:\/\/domain.com\/frontend\/assets\/gallery\/ew055sq9tn97e\/img_ytStill.png"
     }
    ]
  }
}
```
This endpoint retrieves the templates based on the filter keys values.

### HTTP Request

`GET API-URL/templates`

### Query Parameters

| Parameter | Type  | Required/Default | Description                                                    |
|-----------|-------|------------------|----------------------------------------------------------------|
| page      | int   | 1                | Current page to retrieve.                                      |
| per_page  | int   | 10               | Items per page to retrieve.                                    |
| filters   | array | yes              | Indexed array having template attributes as keys.(i.e.: name ) |

## Create a template

```php 
// CREATE A NEW TEMPLATE
$rand = rand();
$response = $endpoint->create([
    'name'          => 'My API template ' . $rand,
    'content'       => file_get_contents(__DIR__ . '/template-example.html'),
    //'archive'     => file_get_contents(__DIR__ . '/template-example.zip'),
    'inline_css'    => 'no',// yes|no
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# CREATE ONE TEMPLATE
response = endpoint.create(data = {
    'name': 'My API template ',
    # 'content': '<body>Hello</body>',
    # 'content': File.read('template-example.html'),
    # 'archive': File.read('template-example.zip'), - TODO - Request entity too large for zip in all the endpoints
    'inline_css': 'no', # yes|no
})

# DISPLAY RESPONSE
puts response.body
```

```python
"""
CREATE ONE TEMPLATE
"""
response = endpoint.create(data={
    'name': 'My API template ',
    # 'content': '<body>Hello</body>',
    # 'content': open('template-example.html', 'r').read(),
    'archive': open('template-example.zip', 'rb').read(),
    'inline_css': 'no',  # yes|no
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
  "template_uid": "jo441taeq281e"
}
```
This endpoint creates a template.

### HTTP Request

`POST API-URL/templates`

### POST Parameters

| Parameter | Type  | Required | Description                      |
|-----------|-------|----------|----------------------------------|
| template  | array | yes      | Array with the template details. |

**Data block - required**

| Parameter  | Type   | Required | Description                                                                         |
|------------|--------|----------|-------------------------------------------------------------------------------------|
| name       | string | yes      | Template name                                                                       |
| content    | string | yes      | The template content                                                                |
| archive    | string | no       | Zip archive name on the disk. This can be used when not using the plain content key |
| inline_css | Yes/No | no       | Allow/disallow inline css                                                           |

## Update a template

```php 
// UPDATE A TEMPLATE
$response = $endpoint->update('TEMPLATE-UNIQUE-ID', [
    'name'          => 'My API template - updated' . $rand,
    'content'       => file_get_contents(__DIR__ . '/template-example.html'),
    //'archive'     => file_get_contents(__DIR__ . '/template-example.zip'),
    'inline_css'    => 'no',// yes|no
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# UPDATE ONE TEMPLATE
response = endpoint.update(template_uid = 'TEMPLATE-UNIQUE-ID', data = {
    'name': 'My API template - Updated',
    # 'content': open('template-example.html', 'rb').read(),
    # 'archive': open('template-example.zip', 'rb').read(),
    'inline_css': 'no', # yes|no
})

# DISPLAY RESPONSE
puts response.body
```

```python
"""
UPDATE ONE TEMPLATE
"""
response = endpoint.update(template_uid='TEMPLATE-UNIQUE-ID', data={
    'name': 'My API template - Updated',
    # 'content': open('template-example.html', 'rb').read(),
    # 'archive': open('template-example.zip', 'rb').read(),
    'inline_css': 'no',  # yes|no
})

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
This endpoint updates a template.

### HTTP Request

`PUT API-URL/templates/TEMPLATE-UNIQUE-ID`

### URL Segments

| Segment            | Required | Description                                                         |
|--------------------|----------|---------------------------------------------------------------------|
| TEMPLATE-UNIQUE-ID | yes      | Template unique identifier                                          |

### PUT Parameters

| Parameter          | Type   | Required | Description                                                         |
|--------------------|--------|----------|---------------------------------------------------------------------|
| data               | array  | yes      | Array with the template details. See the create section for details |

## Delete a template
```php
// delete template
$response = $endpoint->delete('TEMPLATE-UNIQUE-ID');

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# DELETE A TEMPLATE
response = endpoint.delete('TEMPLATE-UNIQUE-ID')

# DISPLAY RESPONSE
puts response.body
```

```python
"""
DELETE A TEMPLATE
"""
response = endpoint.delete('TEMPLATE-UNIQUE-ID')

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
This endpoint will delete the template with the given TEMPLATE-UNIQUE-ID.

### HTTP Request

`DELETE API-URL/templates/TEMPLATE-UNIQUE-ID`

### URL Segments

| Segment            | Required | Description                   |
|--------------------|----------|-------------------------------|
| TEMPLATE-UNIQUE-ID | yes      | Template unique id to delete. |
