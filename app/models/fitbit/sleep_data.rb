module Fitbit
  class SleepData
    attr_reader :minutes_asleep,
                :minutes_in_bed,
                :minutes_to_fall_asleep,
                :efficiency

    def initialize(args)
      return if args['sleep'].empty?

      main_sleep = args['sleep'].select{|s| s['isMainSleep'] }.first
      @minutes_asleep = main_sleep['minutesAsleep']
      @minutes_in_bed = main_sleep['timeInBed']
      @minutes_to_fall_asleep = main_sleep['minutesToFallAsleep']
      @efficiency = main_sleep['efficiency']
    end
  end
end
