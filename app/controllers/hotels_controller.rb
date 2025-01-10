class HotelsController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    matching_hotels = Hotel.all

    @list_of_hotels = matching_hotels.order({ :contacted => :desc, :chosen => :desc, :name => :asc })

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    render({ :template => "hotels/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_hotels = Hotel.where({ :id => the_id })

    @the_hotel = matching_hotels.at(0)

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    @the_hotel_neighborhood = Neighborhood.where({ :id => @the_hotel.neighborhood_id }).at(0)

    render({ :template => "hotels/show" })
  end

  def create
    the_hotel = Hotel.new
    the_hotel.name = params.fetch("query_name")
    the_hotel.address = params.fetch("query_address")

        #lat & lng
        if the_hotel.address != ""
          maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_hotel.address + "&key=" + ENV.fetch("GMAPS_KEY")

          resp = HTTP.get(maps_url)
          raw_response = resp.to_s
          parsed_response = JSON.parse(raw_response)
    
          results = parsed_response.fetch("results")
          if results.empty?
          else
            first_result = results.at(0)
            geo = first_result.fetch("geometry")
            loc = geo.fetch("location")
      
            the_hotel.lat = loc.fetch("lat")
            the_hotel.lng = loc.fetch("lng")
          end
        end
 
    neighborhood_name = params.fetch("query_neighborhood_name")
    the_hotel.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_hotel.website = params.fetch("query_website")
    the_hotel.photo_url = params.fetch("query_photo_url")
    the_hotel.contact_name = params.fetch("query_contact_name")
    the_hotel.contact_email = params.fetch("query_contact_email")
    the_hotel.contacted = params.fetch("query_contacted", false)
    the_hotel.block_discount = params.fetch("query_block_discount", false)
    the_hotel.chosen = params.fetch("query_chosen", false)
    the_hotel.signed_contract = params.fetch("query_signed_contract", false)
    the_hotel.minimum_rooms = params.fetch("query_minimum_rooms")
    the_hotel.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_hotel.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_hotel.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_hotel.notes = params.fetch("query_notes")

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
    the_hotel.address = params.fetch("query_address")

        #lat & lng
        if the_hotel.address != ""
          maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_hotel.address + "&key=" + ENV.fetch("GMAPS_KEY")

          resp = HTTP.get(maps_url)
          raw_response = resp.to_s
          parsed_response = JSON.parse(raw_response)
    
          results = parsed_response.fetch("results")
          if results.empty?
          else
            first_result = results.at(0)
            geo = first_result.fetch("geometry")
            loc = geo.fetch("location")
      
            the_hotel.lat = loc.fetch("lat")
            the_hotel.lng = loc.fetch("lng")
          end
        end
 
    neighborhood_name = params.fetch("query_neighborhood_name")
    the_hotel.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_hotel.website = params.fetch("query_website")
    the_hotel.photo_url = params.fetch("query_photo_url")
    the_hotel.contact_name = params.fetch("query_contact_name")
    the_hotel.contact_email = params.fetch("query_contact_email")
    the_hotel.contacted = params.fetch("query_contacted", false)
    the_hotel.block_discount = params.fetch("query_block_discount", false)
    the_hotel.chosen = params.fetch("query_chosen", false)
    the_hotel.signed_contract = params.fetch("query_signed_contract", false)
    the_hotel.minimum_rooms = params.fetch("query_minimum_rooms")
    the_hotel.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_hotel.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_hotel.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_hotel.notes = params.fetch("query_notes")

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
