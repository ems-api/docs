# Countries

## Create the countries endpoint
```php
// CREATE THE ENDPOINT
$endpoint = new EmsApi\Endpoint\Countries();
```

```ruby
# CREATE THE ENDPOINT
endpoint = Countries.new
```

```python
from mailwizz.endpoint.countries import Countries

"""
CREATE THE ENDPOINT
"""
endpoint = Countries()
```

## Get all countries
```php
// GET ALL ITEMS
$response = $endpoint->getCountries($pageNumber = 23, $perPage = 10);

// DISPLAY RESPONSE
echo '<pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET ALL ITEMS
response = endpoint.get_countries(page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body 
```

```python
"""
GET ALL ITEMS
"""
response = endpoint.get_countries(page=1, per_page=10)

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
    "count": "240",
    "total_pages": 24,
    "current_page": 23,
    "next_page": 24,
    "prev_page": 22,
    "records": [
      {
        "country_id": "218",
        "name": "Tuvalu",
        "code": "TV"
      },
      {
        "country_id": "219",
        "name": "Uganda",
        "code": "UG"
      },
      {
        "country_id": "220",
        "name": "Ukraine",
        "code": "UA"
      },
      {
        "country_id": "221",
        "name": "United Arab Emirates",
        "code": "AE"
      },
      {
        "country_id": "222",
        "name": "United Kingdom",
        "code": "GB"
      },
      {
        "country_id": "223",
        "name": "United States",
        "code": "US"
      },
      {
        "country_id": "224",
        "name": "United States Minor Outlying Islands",
        "code": "UM"
      },
      {
        "country_id": "225",
        "name": "Uruguay",
        "code": "UY"
      },
      {
        "country_id": "226",
        "name": "Uzbekistan",
        "code": "UZ"
      },
      {
        "country_id": "227",
        "name": "Vanuatu",
        "code": "VU"
      }
    ]
  }
}
```
This endpoint retrieves all the countries.

### HTTP Request

`GET API-URL/countries`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
pageNumber | 1 | Current page to retrieve.
perPage | 10 | Items per page to retrieve.

## Get all zones of a country
```php
// get country zones
$response = $endpoint->getZones(COUNTRY-ID, $pageNumber = 1, $perPage = 10);

// DISPLAY RESPONSE
echo '<hr /><pre>';
print_r($response->body);
echo '</pre>';
```

```ruby
# GET COUNTRY ZONES
response = endpoint.get_zones(country_id = COUNTRY-ID, page = 1, per_page = 10)

# DISPLAY RESPONSE
puts response.body
```

```python
"""
GET COUNTRY ZONES
"""
response = endpoint.get_zones(country_id=COUNTRY-ID, page=1, per_page=10)

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
    "count": "65",
    "total_pages": 7,
    "current_page": 1,
    "next_page": 2,
    "prev_page": null,
    "records": [
      {
        "zone_id": "3613",
        "name": "Alabama",
        "code": "AL"
      },
      {
        "zone_id": "3614",
        "name": "Alaska",
        "code": "AK"
      },
      {
        "zone_id": "3615",
        "name": "American Samoa",
        "code": "AS"
      },
      {
        "zone_id": "3616",
        "name": "Arizona",
        "code": "AZ"
      },
      {
        "zone_id": "3617",
        "name": "Arkansas",
        "code": "AR"
      },
      {
        "zone_id": "3618",
        "name": "Armed Forces Africa",
        "code": "AF"
      },
      {
        "zone_id": "3619",
        "name": "Armed Forces Americas",
        "code": "AA"
      },
      {
        "zone_id": "3620",
        "name": "Armed Forces Canada",
        "code": "AC"
      },
      {
        "zone_id": "3621",
        "name": "Armed Forces Europe",
        "code": "AE"
      },
      {
        "zone_id": "3622",
        "name": "Armed Forces Middle East",
        "code": "AM"
      }
    ]
  }
}
```
This endpoint retrieves all the zones of a country.

### HTTP Request

`GET API-URL/countries/COUNTRY-ID/zones`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
pageNumber | 1 | Current page to retrieve.
perPage | 10 | Items per page to retrieve.
COUNTRY-ID | | Country MailWizz ID to retrieve zones for 
