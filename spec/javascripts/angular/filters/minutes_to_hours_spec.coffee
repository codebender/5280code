describe 'minutes_to_hours', ->

  beforeEach module 'app.filters.minutes_to_hours'

  it 'returns the number of hours and minutes for a given number of minutes', inject (minutesToHoursFilter) ->
    expect(minutesToHoursFilter(456)).toBe '7hr 36min'

  it 'returns just the number of hours if the minutes are divisibile by 60', inject (minutesToHoursFilter) ->
    expect(minutesToHoursFilter(420)).toBe '7hr'

  it 'returns just the minutes if the minutes are less than 60', inject (minutesToHoursFilter) ->
    expect(minutesToHoursFilter(31)).toBe '31min'
