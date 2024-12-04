class HotelsController < ApplicationController
  def index
    matching_hotels = Hotel.all

    @list_of_hotels = matching_hotels.order({ :created_at => :desc })

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    render({ :template => "hotels/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_hotels = Hotel.where({ :id => the_id })

    @the_hotel = matching_hotels.at(0)

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    @the_florist_neighborhood = Neighborhood.where({ :id => @the_florist.neighborhood_id }).at(0)

    render({ :template => "hotels/show" })
  end

  def create
    the_hotel = Hotel.new
    the_hotel.name = params.fetch("query_name")
    the_hotel.website = params.fetch("query_website")
    the_hotel.address = params.fetch("query_address")

        #lat & lng

        maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_hotel.address + "&key=" + ENV.fetch("GMAPS_KEY")

        resp = HTTP.get(maps_url)
        raw_response = resp.to_s
        parsed_response = JSON.parse(raw_response)
  
        results = parsed_response.fetch("results")
        first_result = results.at(0)
        geo = first_result.fetch("geometry")
        loc = geo.fetch("location")
  
        the_hotel.lat = loc.fetch("lat")
        the_hotel.lng = loc.fetch("lng")
 
    the_hotel.contacted = params.fetch("query_contacted", false)
    the_hotel.chosen = params.fetch("query_chosen", false)
    the_hotel.block_discount = params.fetch("query_block_discount", false)
    the_hotel.minimum_rooms = params.fetch("query_minimum_rooms")
    the_hotel.neighborhood_id = params.fetch("query_neighborhood_id")
    the_hotel.price_options = params.fetch("query_price_options")
    the_hotel.notes = params.fetch("query_notes")
    the_hotel.contact_name = params.fetch("query_contact_name")
    the_hotel.final_price = params.fetch("query_final_price")

    if the_hotel.valid?
      the_hotel.save
      redirect_to("/hotels", { :notice => "Hotel created successfully." })
    else
      redirect_to("/hotels", { :alert => the_hotel.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_hotel = Hotel.where({ :id => the_id }).at(0)

    the_hotel.name = params.fetch("query_name")
    the_hotel.website = params.fetch("query_website")
    the_hotel.address = params.fetch("query_address")
    the_hotel.lat = params.fetch("query_lat")
    the_hotel.lng = params.fetch("query_lng")
    the_hotel.contacted = params.fetch("query_contacted", false)
    the_hotel.chosen = params.fetch("query_chosen", false)
    the_hotel.block_discount = params.fetch("query_block_discount", false)
    the_hotel.minimum_rooms = params.fetch("query_minimum_rooms")
    the_hotel.neighborhood_id = params.fetch("query_neighborhood_id")
    the_hotel.price_options = params.fetch("query_price_options")
    the_hotel.notes = params.fetch("query_notes")
    the_hotel.contact_name = params.fetch("query_contact_name")
    the_hotel.final_price = params.fetch("query_final_price")

    if the_hotel.valid?
      the_hotel.save
      redirect_to("/hotels/#{the_hotel.id}", { :notice => "Hotel updated successfully."} )
    else
      redirect_to("/hotels/#{the_hotel.id}", { :alert => the_hotel.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_hotel = Hotel.where({ :id => the_id }).at(0)

    the_hotel.destroy

    redirect_to("/hotels", { :notice => "Hotel deleted successfully."} )
  end
end
