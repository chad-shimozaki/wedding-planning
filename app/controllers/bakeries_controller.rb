class BakeriesController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    matching_bakeries = Bakery.all

    @list_of_bakeries = matching_bakeries.order({ :contacted => :desc, :tried => :desc, :chosen => :desc, :name => :asc })

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    render({ :template => "bakeries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bakeries = Bakery.where({ :id => the_id })

    @the_bakery = matching_bakeries.at(0)

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    @the_bakery_neighborhood = Neighborhood.where({ :id => @the_bakery.neighborhood_id }).at(0)

    render({ :template => "bakeries/show" })
  end

  def create
    the_bakery = Bakery.new
    the_bakery.name = params.fetch("query_name")
    the_bakery.address = params.fetch("query_address")

    #lat & lng
      if the_bakery.address != ""

      maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_bakery.address + "&key=" + ENV.fetch("GMAPS_KEY")

      resp = HTTP.get(maps_url)
      raw_response = resp.to_s
      parsed_response = JSON.parse(raw_response)

      results = parsed_response.fetch("results")
      if results.empty?
      else
        first_result = results.at(0)
        geo = first_result.fetch("geometry")
        loc = geo.fetch("location")
  
        the_bakery.lat = loc.fetch("lat")
        the_bakery.lng = loc.fetch("lng")
      end
    end

    neighborhood_name = params.fetch("query_neighborhood_name")
    the_bakery.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_bakery.website = params.fetch("query_website")
    the_bakery.photo_url = params.fetch("query_photo_url")
    the_bakery.contact_name = params.fetch("query_contact_name")
    the_bakery.contact_email = params.fetch("query_contact_email")
    the_bakery.contacted = params.fetch("query_contacted", false)
    the_bakery.tried = params.fetch("query_tried", false)
    the_bakery.chosen = params.fetch("query_chosen", false)
    the_bakery.signed_contract = params.fetch("query_signed_contract", false)
    the_bakery.paid_deposit = params.fetch("query_paid_deposit", false)
    the_bakery.final_payment = params.fetch("query_final_payment", false)
    the_bakery.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_bakery.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_bakery.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_bakery.notes = params.fetch("query_notes")
    the_bakery.deposit = params.fetch("query_deposit")
    the_bakery.final_price = params.fetch("query_final_price")

    if the_bakery.valid?
      the_bakery.save
      redirect_to("/bakeries", { :notice => "Bakery created successfully." })
    else
      redirect_to("/bakeries", { :alert => the_bakery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bakery = Bakery.where({ :id => the_id }).at(0)

    the_bakery.name = params.fetch("query_name")
    the_bakery.address = params.fetch("query_address")

    #lat & lng
    if the_bakery.address != ""

      maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + the_bakery.address + "&key=" + ENV.fetch("GMAPS_KEY")

      resp = HTTP.get(maps_url)
      raw_response = resp.to_s
      parsed_response = JSON.parse(raw_response)

      results = parsed_response.fetch("results")
      if results.empty?
      else
        first_result = results.at(0)
        geo = first_result.fetch("geometry")
        loc = geo.fetch("location")
  
        the_bakery.lat = loc.fetch("lat")
        the_bakery.lng = loc.fetch("lng")
      end
    end

    neighborhood_name = params.fetch("query_neighborhood_name")
    the_bakery.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_bakery.website = params.fetch("query_website")
    the_bakery.photo_url = params.fetch("query_photo_url")
    the_bakery.contact_name = params.fetch("query_contact_name")
    the_bakery.contact_email = params.fetch("query_contact_email")
    the_bakery.contacted = params.fetch("query_contacted", false)
    the_bakery.tried = params.fetch("query_tried", false)
    the_bakery.chosen = params.fetch("query_chosen", false)
    the_bakery.signed_contract = params.fetch("query_signed_contract", false)
    the_bakery.paid_deposit = params.fetch("query_paid_deposit", false)
    the_bakery.final_payment = params.fetch("query_final_payment", false)
    the_bakery.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_bakery.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_bakery.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_bakery.notes = params.fetch("query_notes")
    the_bakery.deposit = params.fetch("query_deposit")
    the_bakery.final_price = params.fetch("query_final_price")


    if the_bakery.valid?
      the_bakery.save
      redirect_to("/bakeries/#{the_bakery.id}", { :notice => "Bakery updated successfully."} )
    else
      redirect_to("/bakeries/#{the_bakery.id}", { :alert => the_bakery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bakery = Bakery.where({ :id => the_id }).at(0)

    the_bakery.destroy

    redirect_to("/bakeries", { :notice => "Bakery deleted successfully."} )
  end
end
