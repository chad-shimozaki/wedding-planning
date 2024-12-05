class EventsController < ApplicationController
  def index
    matching_events = Event.all

    @list_of_events = matching_events.order({ :created_at => :desc })

    @list_of_venues = Venue.all.order({ :name => :desc })

    render({ :template => "events/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events = Event.where({ :id => the_id })

    @the_event = matching_events.at(0)

    render({ :template => "events/show" })
  end

  def create
    the_event = Event.new
    the_event.name = params.fetch("query_name")
    the_event.chronological_order = params.fetch("query_chronological_order")
    the_event.bakery_id = params.fetch("query_bakery_id")
    the_event.coordinator_id = params.fetch("query_coordinator_id")
    the_event.dj_id = params.fetch("query_dj_id")
    the_event.florist_id = params.fetch("query_florist_id")
    the_event.hotel_id = params.fetch("query_hotel_id")
    the_event.lighting_production_company_id = params.fetch("query_lighting_production_company_id")
    the_event.photographer_id = params.fetch("query_photographer_id")
    the_event.transportation_company_id = params.fetch("query_transportation_company_id")
    the_event.venue_id = params.fetch("query_venue_id")

    if the_event.valid?
      the_event.save
      redirect_to("/events", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.name = params.fetch("query_name")
    the_event.chronological_order = params.fetch("query_chronological_order")
    the_event.bakery_id = params.fetch("query_bakery_id")
    the_event.coordinator_id = params.fetch("query_coordinator_id")
    the_event.dj_id = params.fetch("query_dj_id")
    the_event.florist_id = params.fetch("query_florist_id")
    the_event.hotel_id = params.fetch("query_hotel_id")
    the_event.lighting_production_company_id = params.fetch("query_lighting_production_company_id")
    the_event.photographer_id = params.fetch("query_photographer_id")
    the_event.transportation_company_id = params.fetch("query_transportation_company_id")
    the_event.venue_id = params.fetch("query_venue_id")

    if the_event.valid?
      the_event.save
      redirect_to("/events/#{the_event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{the_event.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.destroy

    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end
end
