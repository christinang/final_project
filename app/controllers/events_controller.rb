class EventsController < ApplicationController
  def index
    @events = Event.all

    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])

    @total_paid = @event.charges.where(payer_id: current_user.id).sum('amount')
    @total_owed = @event.charges.where(ower_id: current_user.id).sum('amount')

    totals_by_other_user = Hash.new {|h,k| h[k] = 0}

    @event.charges.each do |charge|
    if charge.ower.id == current_user.id
    totals_by_other_user[charge.payer_id] -= charge.amount
    elsif charge.payer.id == current_user.id
    totals_by_other_user[charge.ower_id] += charge.amount
    end
    end

    @totals_by_other_user = totals_by_other_user

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.event_name = params[:event_name]

    save_status = @event.save

    if save_status == true
      redirect_to("/events", :notice => "Event created successfully.")
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])

    @event.event_name = params[:event_name]

    save_status = @event.save

    if save_status == true
      redirect_to(:back, :notice => "Event updated successfully.")
    else
      render("events/edit.html.erb")
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "This event has been paid up and/or deleted.")
    else
      redirect_to(:back, :notice => "This event has been paid up and/or deleted.")
    end
  end
end
