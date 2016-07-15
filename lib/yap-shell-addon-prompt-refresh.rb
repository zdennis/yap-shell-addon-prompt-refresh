require 'yap/addon'
require 'yap-shell-addon-prompt-refresh/version'

module YapShellAddonPromptRefresh
  class Addon < ::Yap::Addon::Base
    self.export_as :'prompt-refresh'

    DEFAULT_REFRESH_INTERVAL_IN_MS = 100
    EVENT_NAME = 'addon:prompt-refresh'

    attr_accessor :refresh_interval_in_ms

    def initialize_world(world)
      @world = world
      self.refresh_interval_in_ms = DEFAULT_REFRESH_INTERVAL_IN_MS

      @last_fired_at = nil
      @world.subscribe EVENT_NAME do
        fired_at = Time.now

        message = "refreshing prompt"
        message << " #{fired_at - @last_fired_at} seconds since last fired" if @last_fired_at
        @last_fired_at = fired_at

        logger.puts message
        world.refresh_prompt
      end
    end

    def refresh_interval_in_ms=(milliseconds)
      logger.puts "setting refresh interval to #{milliseconds.inspect} ms"
      clear_recurring_event
      if milliseconds
        @refresh_interval_in_ms = milliseconds
        initialize_recurring_event
      end
    end

    private

    def clear_recurring_event
      if @event_id
        logger.puts "clearing previous refresh prompt event id=#{@event_id.inspect}"
        @world.events.clear @event_id
        @event_id = nil
      end
    end

    def initialize_recurring_event
      logger.puts "initializing recurring event for event #{EVENT_NAME.inspect}"
      @event_id = @world.events.recur \
        name: EVENT_NAME,
        interval_in_ms: refresh_interval_in_ms
    end
  end
end
