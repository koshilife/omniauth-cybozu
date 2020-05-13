# Omniauth::Cybozu

[![Gem Version](https://badge.fury.io/rb/omniauth-cybozu.svg)](http://badge.fury.io/rb/omniauth-cybozu)

This gem contains the [Cybozu](https://cybozu.com/)([Kintone](https://www.kintone.com/)/[Garoon](https://garoon.cybozu.co.jp/)) strategy for OmniAuth.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

Now sign into the [Kintone Developer Program](https://developer.kintone.io/hc/en-us/) and create an application. Take note of your API keys and refer to the following [How to add OAuth clients](https://developer.kintone.io/hc/en-us/articles/360001562353).

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-cybozu'
```

If you need to use the latest HEAD version, you can do so with:

```ruby
gem 'omniauth-cybozu', :github => 'koshilife/omniauth-cybozu'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do

  # when access Kintone records
  provider :cybozu, "CLIENT_ID", "CLIENT_SECRET",{ scope: ['k:app_record:read', 'k:app_record:write'], client_options: { site: "https://{subdomain}.kintone.com"}}

  # when access Garoon schedules
  provider :cybozu, "CLIENT_ID", "CLIENT_SECRET",{ scope: ['k:app_record:read', 'k:app_record:write'], client_options: { site: "https://{subdomain}.cybozu.com"}}

end
```

Replace `"CLIENT_ID"` and `"CLIENT_SECRET"` with the appropriate values you obtained.
Refer to the [Kintone Scopes](https://developer.kintone.io/hc/en-us/articles/360001562353#scope) or [All Scopes (include Garoon)](https://developer.cybozu.io/hc/ja/articles/360015955171#step3) for more details on the scope.

## Auth Hash Example

The auth hash `request.env['omniauth.auth']` would look like this:

```js
{
    "provider": "tanita",
    "uid": null, // uid will be empty, because there is no apis to get.
    "credentials": {
        "token": "ACCESS_TOKEN",
        "refresh_token": "REFRESH_TOKEN",
        "expires_at": 1581419031,
        "expires": true
    },
    "extra": {}
}
```

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/koshilife/omniauth-cybozu). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the omniauth-cybozu project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/koshilife/omniauth-cybozu/blob/master/CODE_OF_CONDUCT.md).
