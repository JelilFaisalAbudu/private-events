class EventsController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :show, :destory]
  def index
    @events = Event.all
    @upcomming_events = @events.upcomming_events
    @previous_events = @events.previous_events
  end

  def new
    redirect_to login_path if session[:user_id].nil?
    @event = Event.new
  end

  def create
    
    @event = current_user.organized_events.build(event_params)
    if @event.save
      @event.attendances.create(attendee_id: @event.organizer.id)
      flash[:success] = 'You have successfully created your new event'
      redirect_to @event
    else
      flash.now[:alert] = 'Event rejected! Check and make sure all fields are filled with the correct information'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])

    @event_attendees = @event.event_attendees

  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
      if @event.update_attributes(params[:event])
        flash[:success] = "Event was successfully updated"
        redirect_to @event
      else
        flash[:error] = "Something went wrong"
        render :edit
      end
  end
  

  def attend_event
    redirect_to login_path if session[:user_id].nil?
    @event = Event.find(params[:id])
    register = @event.attendances.build
    register.attendee_id = current_user.id
    if register.save
      flash[:notice] = 'Thanks you for registering to attend this event'
      redirect_to event_path(@event)
    else
      flash.now[:alert] = 'Your registration for the event was unsuccessful. Plese try again'
      redirect_to root_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :details)
  end
end
