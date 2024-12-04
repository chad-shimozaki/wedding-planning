class CaterersController < ApplicationController
  def index
    matching_caterers = Caterer.all

    @list_of_caterers = matching_caterers.order({ :created_at => :desc })

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    @list_of_cuisines = Cuisine.all.order({ :name => :desc })

    render({ :template => "caterers/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_caterers = Caterer.where({ :id => the_id })

    @the_caterer = matching_caterers.at(0)

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    @the_caterer_neighborhood = Neighborhood.where({ :id => @the_caterer.neighborhood_id }).at(0)

    render({ :template => "caterers/show" })
  end

  def create
    the_caterer = Caterer.new
    the_caterer.name = params.fetch("query_name")
    the_caterer.address = params.fetch("query_address")

        #lat & lng
        if the_bakery.address != ""
          maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_caterer.address + "&key=" + ENV.fetch("GMAPS_KEY")

          resp = HTTP.get(maps_url)
          raw_response = resp.to_s
          parsed_response = JSON.parse(raw_response)
    
          results = parsed_response.fetch("results")
          first_result = results.at(0)
          geo = first_result.fetch("geometry")
          loc = geo.fetch("location")
    
          the_caterer.lat = loc.fetch("lat")
          the_caterer.lng = loc.fetch("lng")
        end

    the_caterer.website = params.fetch("query_website")
    the_caterer.photo_url = params.fetch("query_photo_url")
    the_caterer.pdf = params.fetch("query_pdf")
    the_caterer.contacted = params.fetch("query_contacted", false)
    the_caterer.tried = params.fetch("query_tried", false)
    the_caterer.chosen = params.fetch("query_chosen", false)
    the_caterer.contact_name = params.fetch("query_contact_name")
    the_caterer.price_options = params.fetch("query_price_options")
    the_caterer.preferred = params.fetch("query_preferred", false)
    the_caterer.notes = params.fetch("query_notes")
    the_caterer.deposit = params.fetch("query_deposit")
    the_caterer.final_price = params.fetch("query_final_price")

    neighborhood_name = params.fetch("query_neighborhood_name")
    the_caterer.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    cuisine_name = params.fetch("query_cuisine_name")
    the_caterer.cuisine_id = Cuisine.where({ :name => cuisine_name }).at(0).id

    if the_caterer.valid?
      the_caterer.save
      redirect_to("/caterers", { :notice => "Caterer created successfully." })
    else
      redirect_to("/caterers", { :alert => the_caterer.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_caterer = Caterer.where({ :id => the_id }).at(0)

    the_caterer.name = params.fetch("query_name")
    the_caterer.address = params.fetch("query_address")
    the_caterer.lat = params.fetch("query_lat")
    the_caterer.lng = params.fetch("query_lng")
    the_caterer.website = params.fetch("query_website")
    the_caterer.photo_url = params.fetch("query_photo_url")
    the_caterer.pdf = params.fetch("query_pdf")
    the_caterer.contacted = params.fetch("query_contacted", false)
    the_caterer.tried = params.fetch("query_tried", false)
    the_caterer.chosen = params.fetch("query_chosen", false)
    the_caterer.contact_name = params.fetch("query_contact_name")
    the_caterer.price_options = params.fetch("query_price_options")
    the_caterer.cuisine_id = params.fetch("query_cuisine_id")
    the_caterer.preferred = params.fetch("query_preferred", false)
    the_caterer.notes = params.fetch("query_notes")
    the_caterer.deposit = params.fetch("query_deposit")
    the_caterer.final_price = params.fetch("query_final_price")
    the_caterer.neighborhood_id = params.fetch("query_neighborhood_id")

    if the_caterer.valid?
      the_caterer.save
      redirect_to("/caterers/#{the_caterer.id}", { :notice => "Caterer updated successfully."} )
    else
      redirect_to("/caterers/#{the_caterer.id}", { :alert => the_caterer.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_caterer = Caterer.where({ :id => the_id }).at(0)

    the_caterer.destroy

    redirect_to("/caterers", { :notice => "Caterer deleted successfully."} )
  end
end
