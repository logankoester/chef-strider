# strider cookbook
> TODO: Enter the cookbook description here.

[![Build Status](http://ci.ldk.io/logankoester/chef-strider/badge)](http://ci.ldk.io/logankoester/chef-strider/)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

## Overview

TODO: Explain the cookbook.

## Installation

Using [Berkshelf](http://berkshelf.com/), add the `strider` cookbook to your Berksfile.

```ruby
cookbook 'strider', github: 'logankoester/chef-strider', branch: 'master'
```
Then run `berks` to install it.

## Usage

TODO: Include usage patterns of any providers or recipes.

### strider::default

Include `strider` in your run_list.

```json
{
  "run_list": [
    "recipe[strider::default]"
  ]
}
```
#
## Running the tests

This cookbook uses the [Foodcritic](http://www.foodcritic.io/) linter, [ChefSpec](http://sethvargo.github.io/chefspec/) for unit testing, and [ServerSpec](http://serverspec.org/) for integration testing via [Test Kitchen](http://kitchen.ci/) with the [kitchen-docker](https://github.com/portertech/kitchen-docker) driver.

It's not as complicated as it sounds, but you will need to have Docker installed.

1. `git clone git@github.com:logankoester/chef-strider.git`
2. `cd chef-strider`
3. `bundle install`
4. `bundle exec rake`

This will run all of the tests once. While developing, run `bundle exec guard start` and the relevant tests will run automatically when you save a file.

## Author

Copyright (c) 2015 [Logan Koester](http://logankoester.com). Released under the mit license. See `LICENSE` for details.
