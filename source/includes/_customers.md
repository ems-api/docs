# Customers

## Customers endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\Customers();
```

```ruby
# CREATE THE ENDPOINT
endpoint = Customers.new
```

```python
from mailwizz.endpoint.customers import Customers

"""
CREATE THE ENDPOINT
"""
endpoint = Customers()
```

## Create a customer

```php 
// CREATE CUSTOMER
$response = $endpoint->create([
    'customer' => [
        'first_name' => 'John',
        'last_name'  => 'Doe',
        'email'      => 'john.doe@doe.com',
        'password'   => 'superDuperPassword',
        'timezone'   => 'UTC',
        'birthDate'  => 'Y-m-d'
    ],
    // company is optional, unless required from app settings
    'company'  => [
        'name'     => 'John Doe LLC',
        'country'  => 'United States', // see the countries endpoint for available countries and their zones
        'zone'     => 'New York', // see the countries endpoint for available countries and their zones
        'city'     => 'Brooklyn',
        'zip_code' => 11222,
        'address_1'=> 'Some Address',
        'address_2'=> 'Some Other Address',
    ],
]);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# CREATE CUSTOMER
response = endpoint.create(data = {
    'customer': {
        'first_name': 'John',
        'last_name': 'Doe',
        'email': 'john.doe@doe.com',
        'password': 'superDuperPassword',
        'timezone': 'UTC',
        'birthDate': '1979-07-30'
    },
    # company is optional, unless required from app settings
    'company': {
        'name': 'John Doe LLC',
        'country': 'United States', # see the countries endpoint for available countries and their zones
        'zone': 'New York', # see the countries endpoint for available countries and their zones
        'city': 'Brooklyn',
        'zip_code': 11222,
        'address_1': 'Some Address',
        'address_2': 'Some Other Address',
    },
})

# DISPLAY RESPONSE
puts response.body
```
```python
"""
CREATE CUSTOMER
"""
response = endpoint.create({
    'customer': {
        'first_name': 'John',
        'last_name': 'Doe',
        'email': 'john.doe@doe.com',
        'password': 'superDuperPassword',
        'timezone': 'UTC',
        'birthDate': '1979-07-30'
    },
    # company is optional, unless required from app settings
    'company': {
        'name': 'John Doe LLC',
        'country': 'United States',  # see the countries endpoint for available countries and their zones
        'zone': 'New York',  # see the countries endpoint for available countries and their zones
        'city': 'Brooklyn',
        'zip_code': 11222,
        'address_1': 'Some Address',
        'address_2': 'Some Other Address',
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
  "status": "success",
  "customer_uid": "wc149l7wdm9be"
}
```
This endpoint creates a customer

### HTTP Request

`POST API-URL/customers`

### POST Parameters

| Parameter | Type  | Required | Description                                                              |
|-----------|-------|----------|--------------------------------------------------------------------------|
| customer  | array | yes      | The array with the customer details.                                     |
| company   | array | no       | The array with the company details if required by the MailWizz settings. |

**Customer block**

| Parameter  | Type   | Required | Description                      |
|------------|--------|----------|----------------------------------|
| first_name | string | yes      | Customer first name              |
| last_name  | string | yes      | Customer last name               |
| email      | string | yes      | Customer email                   |
| password   | string | yes      | Customer password                |
| timezone   | string | yes      | Customer timezone(i.e. UTC)      |
| birthDate  | string | yes      | Customer birth date (YYYY-MM-DD) |

**Company block**

| Parameter | Type   | Required | Description                                                                    |
|-----------|--------|----------|--------------------------------------------------------------------------------|
| name      | string | yes      | Company name                                                                   |
| country   | string | yes      | Company country (See the Countries endpoint for available countries and zones) |
| zone      | string | yes      | Company zone                                                                   |
| city      | string | yes      | Company city                                                                   |
| zip_code  | string | yes      | Company zipcode                                                                |
| address_1 | string | yes      | Company address                                                                |
| address_2 | string | yes      | Company another address                                                        |
