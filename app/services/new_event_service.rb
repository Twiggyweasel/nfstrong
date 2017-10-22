# Service Object to create new Event
class NewEventService
  def initilize(params)
    @event = params[:event]
  end

  def perform
    create_event
    send_confirmation_email
  end

  private

  def create_event
    assign_defaults if @event.save
  end

  def assign_defaults; end

  def send_confirmation_email
    EventMailer.event_creation(@event).deliver_later
  end
end
