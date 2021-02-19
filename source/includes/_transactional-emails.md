# Transactional Emails
 
> Please make sure to replace `API-URL` `PUBLIC-KEY` `PRIVATE-KEY`, with their proper values:

```php
//Require the autoloader class if you haven't used composer to install the package
require_once __DIR__ . '/../vendor/autoload.php';

//Configuration object (Get your API info from: https://kb.mailwizz.com/articles/find-api-info/) :
$config = new \EmsApi\Config([
    'apiUrl'    => 'API-URL',
    'apiKey'    => 'PUBLIC-KEY',

    // components
    'components' => [
        'cache' => [
            'class'     => \EmsApi\Cache\File::class,
            'filesPath' => __DIR__ . '/data/cache', // make sure it is writable by webserver
        ]
    ],
]);
//Now inject the configuration and we are ready to make api calls
\EmsApi\Base::setConfig($config);

//Start UTC
date_default_timezone_set('UTC');
```

```ruby
require '../mailwizz/mailwizz'

include Mailwizz
include Endpoint

# noinspection SpellCheckingInspection
config = Config.new({
                        'api_url': 'API-URL',
                        'public_key': 'PUBLIC-KEY',
                        'private_key': 'PRIVATE-KEY',
                        'charset': 'utf-8'
                    })

# now inject the configuration and we are ready to make api calls
Base.config = config
```

```python
from mailwizz.base import Base
from mailwizz.config import Config

def setup():
  
    # configuration object
    config = Config({
        'api_url': 'API-URL',
        'public_key': 'PUBLIC-KEY',
        'private_key': 'PRIVATE-KEY',
        'charset': 'utf-8'
    })

    # now inject the configuration and we are ready to make api calls
    Base.set_config(config)
```
See each language tab for the setup instructions.

**Notes**
<aside class="notice">
If SSL present on the webhost, the api can be accessed via SSL as well (https://...). A self signed SSL certificate will work just fine
</aside>

<aside class="notice">
If the MailWizz powered website doesn't use clean urls, make sure your apiUrl has the index.php part of url included, i.e: http://www.mailwizz-powered-website.tld/api/index.php
</aside>

<aside class="notice">
<b>Configuration components</b>: The api for the MailWizz EMA is designed to return proper etags when GET requests are made. We can use this to cache the request response in order to decrease loading time therefore improving performance. In this case, we will need to use a cache component that will store the responses and a file cache will do it just fine. Please see MailWizzApi/Cache for a list of available cache components and their usage.
</aside>
