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
