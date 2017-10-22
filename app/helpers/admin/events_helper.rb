module Admin
  # Event Helpers for admin namespace
  module EventsHelper
    def event_name(event)
      event.category + ' ' + event.city + ' ' + event.state
    end

    def categories
      [
        ['5k Walk', '5k Walk'],
        ['5k Walk/Run', '5k Walk/Run'],
        %w[Bowling Bowling],
        %w[Doctor Doctor]
      ]
    end
  end
end
