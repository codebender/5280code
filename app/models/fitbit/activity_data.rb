module Fitbit
  class ActivityData
    attr_reader :steps,
                :distance,
                :calories_out,
                :active_calories,
                :active_minutes

    def initialize(args)
      @steps = args['summary']['steps']
      @distance = args['summary']['distances'].
        select{|d| d['activity'] == 'tracker'}.first['distance']
      @calories_out = args['summary']['caloriesOut']
      @active_calories = args['summary']['activityCalories']
      @active_minutes = args['summary']['fairlyActiveMinutes'] +
                        args['summary']['lightlyActiveMinutes'] +
                        args['summary']['veryActiveMinutes']

    end
  end
end
