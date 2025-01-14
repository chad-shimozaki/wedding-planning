class TransportationCompaniesController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    matching_transportation_companies = TransportationCompany.all

    @list_of_transportation_companies = matching_transportation_companies.order({ :contacted => :desc, :met_with => :asc, :chosen => :desc, :name => :asc })

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    render({ :template => "transportation_companies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_transportation_companies = TransportationCompany.where({ :id => the_id })

    @the_transportation_company = matching_transportation_companies.at(0)

    @list_of_neighborhoods = Neighborhood.all.order({ :name => :asc })

    @the_transportation_company_neighborhood = Neighborhood.where({ :id => @the_transportation_company.neighborhood_id }).at(0)

    render({ :template => "transportation_companies/show" })
  end

  def create
    the_transportation_company = TransportationCompany.new
    the_transportation_company.name = params.fetch("query_name")
    the_transportation_company.website = params.fetch("query_website")
    the_transportation_company.photo_url = params.fetch("query_photo_url")
    the_transportation_company.contact_name = params.fetch("query_contact_name")
    the_transportation_company.contact_email = params.fetch("query_contact_email")

    neighborhood_name = params.fetch("query_neighborhood_name")
    the_transportation_company.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_transportation_company.contacted = params.fetch("query_contacted", false)
    the_transportation_company.met_with = params.fetch("query_met_with", false)
    the_transportation_company.chosen = params.fetch("query_chosen", false)
    the_transportation_company.signed_contract = params.fetch("query_signed_contract", false)
    the_transportation_company.paid_deposit = params.fetch("query_paid_deposit", false)
    the_transportation_company.final_payment = params.fetch("query_final_payment", false)
    the_transportation_company.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_transportation_company.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_transportation_company.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_transportation_company.notes = params.fetch("query_notes")
    the_transportation_company.deposit = params.fetch("query_deposit")
    the_transportation_company.final_price = params.fetch("query_final_price")

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
    the_transportation_company.photo_url = params.fetch("query_photo_url")
    the_transportation_company.contact_name = params.fetch("query_contact_name")
    the_transportation_company.contact_email = params.fetch("query_contact_email")

    neighborhood_name = params.fetch("query_neighborhood_name")
    the_transportation_company.neighborhood_id = Neighborhood.where({ :name => neighborhood_name }).at(0).id

    the_transportation_company.contacted = params.fetch("query_contacted", false)
    the_transportation_company.met_with = params.fetch("query_met_with", false)
    the_transportation_company.chosen = params.fetch("query_chosen", false)
    the_transportation_company.signed_contract = params.fetch("query_signed_contract", false)
    the_transportation_company.paid_deposit = params.fetch("query_paid_deposit", false)
    the_transportation_company.final_payment = params.fetch("query_final_payment", false)
    the_transportation_company.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_transportation_company.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_transportation_company.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_transportation_company.notes = params.fetch("query_notes")
    the_transportation_company.deposit = params.fetch("query_deposit")
    the_transportation_company.final_price = params.fetch("query_final_price")


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
