class LightingProductionCompaniesController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    matching_lighting_production_companies = LightingProductionCompany.all

    @list_of_lighting_production_companies = matching_lighting_production_companies.order({ :contacted => :desc, :met_with => :asc, :chosen => :desc, :name => :asc })

    render({ :template => "lighting_production_companies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_lighting_production_companies = LightingProductionCompany.where({ :id => the_id })

    @the_lighting_production_company = matching_lighting_production_companies.at(0)

    render({ :template => "lighting_production_companies/show" })
  end

  def create
    the_lighting_production_company = LightingProductionCompany.new
    the_lighting_production_company.name = params.fetch("query_name")
    the_lighting_production_company.website = params.fetch("query_website")
    the_lighting_production_company.photo_url = params.fetch("query_photo_url")
    the_lighting_production_company.contact_name = params.fetch("query_contact_name")
    the_lighting_production_company.contact_email = params.fetch("query_contact_email")
    the_lighting_production_company.contacted = params.fetch("query_contacted", false)
    the_lighting_production_company.met_with = params.fetch("query_met_with", false)
    the_lighting_production_company.chosen = params.fetch("query_chosen", false)
    the_lighting_production_company.signed_contract = params.fetch("query_signed_contract", false)
    the_lighting_production_company.paid_deposit = params.fetch("query_paid_deposit", false)
    the_lighting_production_company.final_payment = params.fetch("query_final_payment", false)
    the_lighting_production_company.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_lighting_production_company.pdf = params.fetch("query_pdf")    
      the_lighting_production_company.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_lighting_production_company.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_lighting_production_company.notes = params.fetch("query_notes")
    the_lighting_production_company.deposit = params.fetch("query_deposit")
    the_lighting_production_company.final_price = params.fetch("query_final_price")

    if the_lighting_production_company.valid?
      the_lighting_production_company.save
      redirect_to("/lighting_production_companies", { :notice => "Lighting & Production Company created successfully." })
    else
      redirect_to("/lighting_production_companies", { :alert => the_lighting_production_company.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_lighting_production_company = LightingProductionCompany.where({ :id => the_id }).at(0)

    the_lighting_production_company.name = params.fetch("query_name")
    the_lighting_production_company.website = params.fetch("query_website")
    the_lighting_production_company.photo_url = params.fetch("query_photo_url")
    the_lighting_production_company.contact_name = params.fetch("query_contact_name")
    the_lighting_production_company.contact_email = params.fetch("query_contact_email")
    the_lighting_production_company.contacted = params.fetch("query_contacted", false)
    the_lighting_production_company.met_with = params.fetch("query_met_with", false)
    the_lighting_production_company.chosen = params.fetch("query_chosen", false)
    the_lighting_production_company.signed_contract = params.fetch("query_signed_contract", false)
    the_lighting_production_company.paid_deposit = params.fetch("query_paid_deposit", false)
    the_lighting_production_company.final_payment = params.fetch("query_final_payment", false)
    the_lighting_production_company.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_lighting_production_company.pdf = params.fetch("query_pdf")    
      the_lighting_production_company.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_lighting_production_company.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end
    
    the_lighting_production_company.notes = params.fetch("query_notes")
    the_lighting_production_company.deposit = params.fetch("query_deposit")
    the_lighting_production_company.final_price = params.fetch("query_final_price")

    if the_lighting_production_company.valid?
      the_lighting_production_company.save
      redirect_to("/lighting_production_companies/#{the_lighting_production_company.id}", { :notice => "Lighting production company updated successfully."} )
    else
      redirect_to("/lighting_production_companies/#{the_lighting_production_company.id}", { :alert => the_lighting_production_company.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_lighting_production_company = LightingProductionCompany.where({ :id => the_id }).at(0)

    the_lighting_production_company.destroy

    redirect_to("/lighting_production_companies", { :notice => "Lighting & Production Company deleted successfully."} )
  end
end
