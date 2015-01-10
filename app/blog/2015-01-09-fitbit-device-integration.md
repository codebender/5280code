---
title:  'Fitbit Device Integration'
created_at: '2015-01-09'
---

### Fitbit and health device data
I currently work as a Lead Software Engineer at
[Welltok](http://welltok.com)/[CaféWell](https://cafewell.com) which is a
company that specializes in health device data for its users.  I have been a
major part of the company's device integrations from the start.  So I have an
innate passion for health devices and data.  This is what drove me to integrate
my personal [Fitbit](http://fitbit.com) into my personal sandbox website
http://5280code.com - http://www.5280code.com/fitness.

### Fitgem!
Thankfully the majority of the
[Fitbit API and OAuth](https://wiki.fitbit.com/display/API/Fitbit+API)
integration has already been created by the ruby community.
[whazzmaster](https://github.com/whazzmaster) has done a great job at keeping
[fitgem](https://github.com/whazzmaster/fitgem)(ruby API client) up to date with
Fitbit API changes/deprecations. He also has a good wiki about how to OAuth with
Fitbit https://github.com/whazzmaster/fitgem/wiki/The-OAuth-Process

### The Fitbit API
The Fitbit API is not perfect but what API is? My biggest gripes are that they
don't [return timestamps in UTC]
(https://wiki.fitbit.com/display/API/API+Time+Zones), they return the data in
the user's timezone which requires an extra API call and they don't give finer
grained data without a [partner agreement]
(https://wiki.fitbit.com/display/API/API-Get-Intraday-Time-Series). The API is
documented pretty well and their support team is responsive, at least when you
have a partner agreement. The [pubsub service]
(https://wiki.fitbit.com/display/API/Fitbit+Subscriptions+API) they provide is
superb, they pass minimal data and can handle high user load.

### The Integration
I first created a developer account on the [fitbit dev website]
(https://dev.fitbit.com) and register a new application. That creates a client
key and secre. I then created user OAuth tokens by hand by following
whazzmaster's tutorial. I then set those tokens/secrets to environment variables
. My integration is fairly simple. The [fitness angular controller](https://github.com/codebender/5280code/blob/master/app/assets/javascripts/angular/app/controllers/fitness_ctrl.coffee)
makes 4 separate requests to the rails API controller in order to populate the
page.

```coffeescript
angular.module('app.controllers.fitness', ['resources.fitbit'])
.controller 'fitnessCtrl', ($scope, Fitbit) ->
Fitbit.user_info().then (fitbit_data) ->
$scope.user = fitbit_data

Fitbit.device_info().then (fitbit_data) ->
$scope.device = fitbit_data

Fitbit.activity_data().then (fitbit_data) ->
$scope.activity = fitbit_data

Fitbit.sleep_data().then (fitbit_data) ->
$scope.sleep = fitbit_data
```
Each of the 4 actions on the rails side then call fitbit's API
https://github.com/codebender/5280code/tree/master/app/controllers/api/fitbit
The rails side weights heavily on the fitgem for API data as I mention
https://github.com/codebender/5280code/blob/master/app/models/fitbit/service.rb
I just do a little manipulation of the data after it comes in for each API call.

### Future
I would love to do some D3 or charting library but I don't have access to time
series data. :-( I also only show today's data. Perhaps in the future I can
integrate a chart of multiple day's of data into a fancy chart. If I every
switch to another device, I would probably replace all of this functionality on
the site.

### Questions?
If you want more details, hit me up on twitter [@5280code]
(https://twitter.com/5280code)!
