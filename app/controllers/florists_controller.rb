class FloristsController < ApplicationController
  def index
    matching_florists = Florist.all

    @list_of_florists = matching_florists.order({ :created_at => :desc })

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    render({ :template => "florists/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_florists = Florist.where({ :id => the_id })

    @the_florist = matching_florists.at(0)

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :desc })

    @the_florist_neighborhood = Neighborhood.where({ :id => @the_florist.neighborhood_id }).at(0)

    render({ :template => "florists/show" })
  end

  def create
    the_florist = Florist.new
    the_florist.name = params.fetch("query_name")
    the_florist.website = params.fetch("query_website")
    the_florist.address = params.fetch("query_address")
    the_florist.lat = params.fetch("query_lat")
    the_florist.lng = params.fetch("query_lng")
    the_florist.contacted = params.fetch("query_contacted", false)
    the_florist.chosen = params.fetch("query_chosen", false)
    the_florist.price_options = params.fetch("query_price_options")
    the_florist.notes = params.fetch("query_notes")
    the_florist.deposit = params.fetch("query_deposit")
    the_florist.contact_name = params.fetch("query_contact_name")
    the_florist.final_price = params.fetch("query_final_price")
    the_florist.neighborhood_id = params.fetch("query_neighborhood_id")

    if the_florist.valid?
      the_florist.save
      redirect_to("/florists", { :notice => "Florist created successfully." })
    else
      redirect_to("/florists", { :alert => the_florist.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_florist = Florist.where({ :id => the_id }).at(0)

    the_florist.name = params.fetch("query_name")
    the_florist.website = params.fetch("query_website")
    the_florist.address = params.fetch("query_address")
    the_florist.lat = params.fetch("query_lat")
    the_florist.lng = params.fetch("query_lng")
    the_florist.contacted = params.fetch("query_contacted", false)
    the_florist.chosen = params.fetch("query_chosen", false)
    the_florist.price_options = params.fetch("query_price_options")
    the_florist.notes = params.fetch("query_notes")
    the_florist.deposit = params.fetch("query_deposit")
    the_florist.contact_name = params.fetch("query_contact_name")
    the_florist.final_price = params.fetch("query_final_price")
    the_florist.neighborhood_id = params.fetch("query_neighborhood_id")

    if the_florist.valid?
      the_florist.save
      redirect_to("/florists/#{the_florist.id}", { :notice => "Florist updated successfully."} )
    else
      redirect_to("/florists/#{the_florist.id}", { :alert => the_florist.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_florist = Florist.where({ :id => the_id }).at(0)

    the_florist.destroy

    redirect_to("/florists", { :notice => "Florist deleted successfully."} )
  end
end
