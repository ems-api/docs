---
title: MailWizz v2.x API documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - php
  - ruby
  - python

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - setup
  - lists
  - fields
  - segments
  - subscribers
  - campaigns
  - campaigns-tracking
  - campaigns-bounces
  - countries
  - customers
  - templates
  - transactional-emails
  
search: true

code_clipboard: true
---

# Introduction

This is the documentation for MailWizz 2.x API.

For MailWizz 1.x API documentation, please see this [link](/v1).  

In order to integrate MailWizz with 3rd-party apps or any custom apps, you can use its powerful API.

The API is providing the basic operations needed for your implementation. 

This document will drive you through the MailWizz available SDKs .

**Available implementations**:

[The PHP SDK](https://github.com/ems-api/php-client)

**Compatible implementations**:

[The Python SDK](https://github.com/twisted1919/mailwizz-python-sdk).

[The Ruby SDK](https://github.com/twisted1919/mailwizz-ruby-sdk).

[A small rest app that acts as a proxy between MailWizz and any other software](https://github.com/thangtx/mailwizzphpapi-wrap).

[Node.js implementations](https://www.npmjs.com/package/node-mailwizz).

**HTTP Methods used**

We follow the REST standards for MailWizz's API interaction, which means that we use following HTTP methods during communication:

* POST - when items are created

* GET - when items are listed

* PUT - when items are updated

* DELETE - when items are deleted

You will have to make sure your server supports all these methods.

If you are doing API calls and get HTTP Forbidden errors, when updating or deleting items, it means your server does not support PUT/DELETE and you must change it's configuration to allow these methods.

# Getting started

First you need to install the SDK. See each supported language for its way of installing
### PHP

You can either download the latest version of the code, or you can install it via composer as follows:

`composer require ems-api/php-client`

Then follow the instructions from examples/setup.php file.

### Python

You can either download the latest version of the code, or you can install it via pip as follows:

`pip install mailwizz-python-sdk`

Then follow the instructions from examples/setup_api.py file.

### Ruby

You can download or clone the latest version of the code.

`git clone https://github.com/twisted1919/mailwizz-ruby-sdk.git`

You will need to have Ruby installed:

`https://www.ruby-lang.org/en/documentation/installation/`

The following gem is required: `excon`

`sudo gem install excon`

Then, follow the instructions from `examples/setup_api.rb` file.

