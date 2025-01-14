class PhotographersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    matching_photographers = Photographer.all

    @list_of_photographers = matching_photographers.order({ :contacted => :desc, :met_with => :desc, :chosen => :desc, :name => :asc })

    render({ :template => "photographers/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_photographers = Photographer.where({ :id => the_id })

    @the_photographer = matching_photographers.at(0)

    render({ :template => "photographers/show" })
  end

  def create
    the_photographer = Photographer.new
    the_photographer.name = params.fetch("query_name")
    the_photographer.instagram = params.fetch("query_instagram")
    the_photographer.contact_email = params.fetch("query_contact_email")
    the_photographer.website = params.fetch("query_website")
    the_photographer.photo_url = params.fetch("query_photo_url")
    the_photographer.contacted = params.fetch("query_contacted", false)
    the_photographer.met_with = params.fetch("query_met_with", false)
    the_photographer.chosen = params.fetch("query_chosen", false)
    the_photographer.signed_contract = params.fetch("query_signed_contract", false)
    the_photographer.paid_deposit = params.fetch("query_paid_deposit", false)
    the_photographer.final_payment = params.fetch("query_final_payment", false)
    the_photographer.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_photographer.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_photographer.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_photographer.notes = params.fetch("query_notes")
    the_photographer.deposit = params.fetch("query_deposit")
    the_photographer.final_price = params.fetch("query_final_price")

    if the_photographer.valid?
      the_photographer.save
      redirect_to("/photographers", { :notice => "Photographer created successfully." })
    else
      redirect_to("/photographers", { :alert => the_photographer.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_photographer = Photographer.where({ :id => the_id }).at(0)

    the_photographer.name = params.fetch("query_name")
    the_photographer.instagram = params.fetch("query_instagram")
    the_photographer.contact_email = params.fetch("query_contact_email")
    the_photographer.website = params.fetch("query_website")
    the_photographer.photo_url = params.fetch("query_photo_url")
    the_photographer.contacted = params.fetch("query_contacted", false)
    the_photographer.met_with = params.fetch("query_met_with", false)
    the_photographer.chosen = params.fetch("query_chosen", false)
    the_photographer.signed_contract = params.fetch("query_signed_contract", false)
    the_photographer.paid_deposit = params.fetch("query_paid_deposit", false)
    the_photographer.final_payment = params.fetch("query_final_payment", false)
    the_photographer.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_photographer.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_photographer.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_photographer.notes = params.fetch("query_notes")
    the_photographer.deposit = params.fetch("query_deposit")
    the_photographer.final_price = params.fetch("query_final_price")


    if the_photographer.valid?
      the_photographer.save
      redirect_to("/photographers/#{the_photographer.id}", { :notice => "Photographer updated successfully."} )
    else
      redirect_to("/photographers/#{the_photographer.id}", { :alert => the_photographer.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_photographer = Photographer.where({ :id => the_id }).at(0)

    the_photographer.destroy

    redirect_to("/photographers", { :notice => "Photographer deleted successfully."} )
  end
end
