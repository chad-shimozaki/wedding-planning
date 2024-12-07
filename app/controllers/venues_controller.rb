class VenuesController < ApplicationController
  def index
    matching_venues = Venue.all

    @list_of_venues = matching_venues.order({ :chosen => :desc, :created_at => :desc })

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    render({ :template => "venues/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_venues = Venue.where({ :id => the_id })

    @the_venue = matching_venues.at(0)

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    @the_venue_neighborhood = Neighborhood.where({ :id => @the_venue.neighborhood_id }).at(0)

    render({ :template => "venues/show" })
  end

  def create
    the_venue = Venue.new
    the_venue.name = params.fetch("query_name")
    the_venue.address = params.fetch("query_address")

        #lat & lng
        if the_venue.address != ""
          maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_venue.address + "&key=" + ENV.fetch("GMAPS_KEY")

          resp = HTTP.get(maps_url)
          raw_response = resp.to_s
          parsed_response = JSON.parse(raw_response)
    
          results = parsed_response.fetch("results")
          first_result = results.at(0)
          geo = first_result.fetch("geometry")
          loc = geo.fetch("location")
    
          the_venue.lat = loc.fetch("lat")
          the_venue.lng = loc.fetch("lng")
        end

    neighborhood_name = params.fetch("query_neighborhood_name")
    the_venue.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_venue.capacity = params.fetch("query_capacity")
    the_venue.venue_type = params.fetch("query_venue_type")
    the_venue.website = params.fetch("query_website")
    the_venue.contact_name = params.fetch("query_contact_name")
    the_venue.contact_email = params.fetch("query_contact_email")
    the_venue.contacted = params.fetch("query_contacted", false)
    the_venue.visited = params.fetch("query_visited", false)
    the_venue.chosen = params.fetch("query_chosen", false)
    the_venue.signed_contract = params.fetch("query_signed_contract", false)
    the_venue.paid_deposit = params.fetch("query_paid_deposit", false)
    the_venue.final_payment = params.fetch("query_final_payment", false)
    the_venue.price_options = params.fetch("query_price_options")
    the_venue.photo_url = params.fetch("query_photo_url")
    the_venue.pdf = params.fetch("query_pdf")
    the_venue.notes = params.fetch("query_notes")
    the_venue.deposit = params.fetch("query_deposit")
    the_venue.final_price = params.fetch("query_final_price")
    the_venue.events_count = params.fetch("query_events_count")

    if the_venue.valid?
      the_venue.save
      redirect_to("/venues", { :notice => "Venue created successfully." })
    else
      redirect_to("/venues", { :alert => the_venue.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_venue = Venue.where({ :id => the_id }).at(0)

    the_venue.name = params.fetch("query_name")
    the_venue.address = params.fetch("query_address")

        #lat & lng
        if the_venue.address != ""
          maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_venue.address + "&key=" + ENV.fetch("GMAPS_KEY")

          resp = HTTP.get(maps_url)
          raw_response = resp.to_s
          parsed_response = JSON.parse(raw_response)
    
          results = parsed_response.fetch("results")
          first_result = results.at(0)
          geo = first_result.fetch("geometry")
          loc = geo.fetch("location")
    
          the_venue.lat = loc.fetch("lat")
          the_venue.lng = loc.fetch("lng")
        end

    neighborhood_name = params.fetch("query_neighborhood_name")
    the_venue.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_venue.capacity = params.fetch("query_capacity")
    the_venue.venue_type = params.fetch("query_venue_type")
    the_venue.website = params.fetch("query_website")
    the_venue.contact_name = params.fetch("query_contact_name")
    the_venue.contact_email = params.fetch("query_contact_email")
    the_venue.contacted = params.fetch("query_contacted", false)
    the_venue.visited = params.fetch("query_visited", false)
    the_venue.chosen = params.fetch("query_chosen", false)
    the_venue.signed_contract = params.fetch("query_signed_contract", false)
    the_venue.paid_deposit = params.fetch("query_paid_deposit", false)
    the_venue.final_payment = params.fetch("query_final_payment", false)
    the_venue.price_options = params.fetch("query_price_options")
    the_venue.photo_url = params.fetch("query_photo_url")
    the_venue.pdf = params.fetch("query_pdf")
    the_venue.notes = params.fetch("query_notes")
    the_venue.deposit = params.fetch("query_deposit")
    the_venue.final_price = params.fetch("query_final_price")
    the_venue.events_count = params.fetch("query_events_count")

    if the_venue.valid?
      the_venue.save
      redirect_to("/venues/#{the_venue.id}", { :notice => "Venue updated successfully."} )
    else
      redirect_to("/venues/#{the_venue.id}", { :alert => the_venue.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_venue = Venue.where({ :id => the_id }).at(0)

    the_venue.destroy

    redirect_to("/venues", { :notice => "Venue deleted successfully."} )
  end
end
