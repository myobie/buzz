# Buzz Lightyear

Buzz provides an incident reporting system. His api is email.

## Usage

Send an email to buzz@wunderfailover.com and an incident will be
created. Similar emails will be collated together into an incident
group.

There also will be a POST api for hipsters:

    POST https://buzz.wunderfailer.com/api/v1/incidents
    Content-Type: application/json
    Accept: application/json

    {
      subject: "Whydoicant?",
      from: "nathan@6wunderkinder.com",
      body: "A bunch of text"
    }

The `from` and `body` fields can be structured data, but must be
serialized as json:

    POST https://buzz.wunderfailer.com/api/v1/incidents
    Content-Type: application/json
    Accept: application/json

    {
      subject: "Whydoicant?",
      from: "{\"node\":{\"id\":\"i34abc4bb\",\"public-dns\":\"...\"}}",
      body: "{\"backtrace\":[\"stuff broke\"],\"params\":{}}"
    }

This allows us to always support email as a sending option.

## Alerting

Alerts can be sent to:

* Hipchat
* Slack
* Email
* Github Issues
* Pagerduty

## Implimentation ideas

* Use postgres json storage (and upgrade to 9.4 as soon as it comes out
  so we get the binary json storage).
* Build indexes in the json only when you need them
* Add regexes of backtrace lines (or body lines) to ignore when grouping
* Add priorities
* Add regexes for subjects that select a priority
* Add regexes for subjects that select a alert mechanism
* Build up rules over time based on usage for priorities, grouping,
  alerting, etc

## Contributing

Thanks for considering. Here's how to get started.

### Setup

```sh
$ gem install bundler
$ bundle
$ bin/rake
```

If all tests pass then you are good to go (:

### Where are things?

This is a [cuba][] app. All of the request handlers are in `app.rb`. Tests
are in `test/` and you should start with `test/app_test.rb` to get
familiar with what's going on. All the tests are written in [cutest][].

Configuration is **only** by `ENV` vars. If you didn't think to create a
`.env` file at first, then one would have been created for you. Feel
free to edit it to match your expected local dev environment. If you
test environment is very different from your development environment,
then feel free to add a `.env.test` which will superseed the normal
`.env` file.

Views should seem pretty normal, just follow along with how things are
currently going.

[cuba]: https://github.com/soveran/cuba
[cutest]: https://github.com/djanowski/cutest

### Why are things where they are?

Cuba allows one to build an app in scopes, which I think will be
important for this particular app. If the plan to build changable rules
over time goes well then these scopes could be useful for building the
urls to create, plan, and execute these rules. We'll see.

It's also nice to break out of one's comfort zone and since this project
is ambitious I think it warrents a different approach.
