angular.module('app.filters.minutes_to_hours', [])
  .filter 'minutesToHours', ->
    (input) ->
      hours = Math.floor(input / 60)
      minutes = input % 60
      text = ""
      if hours > 0
        text += "#{hours}hr "
      if minutes > 0
        text += "#{minutes}min"
      return text.trim()
