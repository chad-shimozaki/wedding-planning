class EventsController < ApplicationController
  def index
    matching_events = Event.all

    @list_of_events = matching_events.order({ :created_at => :desc })

    @list_of_bakeries = Bakery.all.order({ :name => :desc })
    @list_of_coordinators = Coordinator.all.order({ :name => :desc })
    @list_of_djs = Dj.all.order({ :name => :desc })
    @list_of_florists = Florist.all.order({ :name => :desc })
    @list_of_hotels = Hotel.all.order({ :name => :desc })
    @list_of_lighting_production_companies = LightingProductionCompany.all.order({ :name => :desc })
    @list_of_photographers = Photographer.all.order({ :name => :desc })
    @list_of_transportation_companies = TransportationCompany.all.order({ :name => :desc })
    @list_of_venues = Venue.all.order({ :name => :desc })
    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    render({ :template => "events/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events = Event.where({ :id => the_id })

    @the_event = matching_events.at(0)

    @list_of_bakeries = Bakery.all.order({ :name => :desc })
    @list_of_coordinators = Coordinator.all.order({ :name => :desc })
    @list_of_djs = Dj.all.order({ :name => :desc })
    @list_of_florists = Florist.all.order({ :name => :desc })
    @list_of_hotels = Hotel.all.order({ :name => :desc })
    @list_of_lighting_production_companies = LightingProductionCompany.all.order({ :name => :desc })
    @list_of_photographers = Photographer.all.order({ :name => :desc })
    @list_of_transportation_companies = TransportationCompany.all.order({ :name => :desc })
    @list_of_venues = Venue.all.order({ :name => :desc })
    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    @the_event_bakery = Bakery.where({ :id => @the_event.bakery_id }).at(0)
    @the_event_coordinator = Coordinator.where({ :id => @the_event.coordinator_id }).at(0)
    @the_event_dj = Dj.where({ :id => @the_event.dj_id }).at(0)
    @the_event_florist = Florist.where({ :id => @the_event.florist_id }).at(0)
    @the_event_hotel = Hotel.where({ :id => @the_event.hotel_id }).at(0)
    @the_event_lighting_production_company = LightingProductionCompany.where({ :id => @the_event.lighting_production_company_id }).at(0)
    @the_event_photographer = Photographer.where({ :id => @the_event.photographer_id }).at(0)
    @the_event_transportation_company = TransportationCompany.where({ :id => @the_event.transportation_company_id }).at(0)
    @the_event_venue = Venue.where({ :id => @the_event.venue_id }).at(0)
    @the_event_neighborhood = Neighborhood.where({ :id => @the_event.neighborhood_id }).at(0)

    render({ :template => "events/show" })
  end

  def create
    the_event = Event.new
    the_event.name = params.fetch("query_name")
    the_event.chronological_order = params.fetch("query_chronological_order")

    the_event.bakery_id = Bakery.where({ :name => params.fetch("query_bakery_name") }).at(0).id
    the_event.coordinator_id = Coordinator.where({ :name => params.fetch("query_coordinator_name") }).at(0).id
    the_event.dj_id = Dj.where({ :name => params.fetch("query_dj_name") }).at(0).id
    the_event.florist_id = Florist.where({ :name => params.fetch("query_florist_name") }).at(0).id
    the_event.hotel_id = Hotel.where({ :name => params.fetch("query_hotel_name") }).at(0).id
    the_event.lighting_production_company_id = LightingProductionCompany.where({ :name => params.fetch("query_lighting_production_company_name") }).at(0).id
    the_event.photographer_id = Photographer.where({ :name => params.fetch("query_photographer_name") }).at(0).id
    the_event.transportation_company_id = TransportationCompany.where({ :name => params.fetch("query_transportation_company_name") }).at(0).id
    the_event.venue_id = Venue.where({ :name => params.fetch("query_venue_name") }).at(0).id
    the_event.neighborhood_id = Neighborhood.where({ :name => params.fetch("query_neighborhood_name") }).at(0).id

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

    the_event.bakery_id = Bakery.where({ :name => params.fetch("query_bakery_name") }).at(0).id
    the_event.coordinator_id = Coordinator.where({ :name => params.fetch("query_coordinator_name") }).at(0).id
    the_event.dj_id = Dj.where({ :name => params.fetch("query_dj_name") }).at(0).id
    the_event.florist_id = Florist.where({ :name => params.fetch("query_florist_name") }).at(0).id
    the_event.hotel_id = Hotel.where({ :name => params.fetch("query_hotel_name") }).at(0).id
    the_event.lighting_production_company_id = LightingProductionCompany.where({ :name => params.fetch("query_lighting_production_company_name") }).at(0).id
    the_event.photographer_id = Photographer.where({ :name => params.fetch("query_photographer_name") }).at(0).id
    the_event.transportation_company_id = TransportationCompany.where({ :name => params.fetch("query_transportation_company_name") }).at(0).id
    the_event.venue_id = Venue.where({ :name => params.fetch("query_venue_name") }).at(0).id
    the_event.neighborhood_id = Neighborhood.where({ :name => params.fetch("query_neighborhood_name") }).at(0).id

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
