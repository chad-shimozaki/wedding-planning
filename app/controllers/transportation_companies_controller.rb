class TransportationCompaniesController < ApplicationController
  def index
    matching_transportation_companies = TransportationCompany.all

    @list_of_transportation_companies = matching_transportation_companies.order({ :created_at => :desc })

    render({ :template => "transportation_companies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_transportation_companies = TransportationCompany.where({ :id => the_id })

    @the_transportation_company = matching_transportation_companies.at(0)

    render({ :template => "transportation_companies/show" })
  end

  def create
    the_transportation_company = TransportationCompany.new
    the_transportation_company.name = params.fetch("query_name")
    the_transportation_company.website = params.fetch("query_website")
    the_transportation_company.contacted = params.fetch("query_contacted", false)
    the_transportation_company.chosen = params.fetch("query_chosen", false)
    the_transportation_company.price_options = params.fetch("query_price_options")
    the_transportation_company.deposit = params.fetch("query_deposit", false)
    the_transportation_company.notes = params.fetch("query_notes")
    the_transportation_company.contact_name = params.fetch("query_contact_name")
    the_transportation_company.final_price = params.fetch("query_final_price")
    the_transportation_company.neighborhood_id = params.fetch("query_neighborhood_id")

    if the_transportation_company.valid?
      the_transportation_company.save
      redirect_to("/transportation_companies", { :notice => "Transportation company created successfully." })
    else
      redirect_to("/transportation_companies", { :alert => the_transportation_company.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_transportation_company = TransportationCompany.where({ :id => the_id }).at(0)

    the_transportation_company.name = params.fetch("query_name")
    the_transportation_company.website = params.fetch("query_website")
    the_transportation_company.contacted = params.fetch("query_contacted", false)
    the_transportation_company.chosen = params.fetch("query_chosen", false)
    the_transportation_company.price_options = params.fetch("query_price_options")
    the_transportation_company.deposit = params.fetch("query_deposit", false)
    the_transportation_company.notes = params.fetch("query_notes")
    the_transportation_company.contact_name = params.fetch("query_contact_name")
    the_transportation_company.final_price = params.fetch("query_final_price")
    the_transportation_company.neighborhood_id = params.fetch("query_neighborhood_id")

    if the_transportation_company.valid?
      the_transportation_company.save
      redirect_to("/transportation_companies/#{the_transportation_company.id}", { :notice => "Transportation company updated successfully."} )
    else
      redirect_to("/transportation_companies/#{the_transportation_company.id}", { :alert => the_transportation_company.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_transportation_company = TransportationCompany.where({ :id => the_id }).at(0)

    the_transportation_company.destroy

    redirect_to("/transportation_companies", { :notice => "Transportation company deleted successfully."} )
  end
end