class DjsController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    matching_djs = Dj.all

    @list_of_djs = matching_djs.order({ :chosen => :desc, :name => :asc })

    render({ :template => "djs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_djs = Dj.where({ :id => the_id })

    @the_dj = matching_djs.at(0)

    render({ :template => "djs/show" })
  end

  def create
    the_dj = Dj.new
    the_dj.name = params.fetch("query_name")
    the_dj.contact_name = params.fetch("query_contact_name")
    the_dj.contact_email = params.fetch("query_contact_email")
    the_dj.website = params.fetch("query_website")
    the_dj.photo_url = params.fetch("query_photo_url")
    the_dj.contacted = params.fetch("query_contacted", false)
    the_dj.met_with = params.fetch("query_met_with", false)
    the_dj.chosen = params.fetch("query_chosen", false)
    the_dj.signed_contract = params.fetch("query_signed_contract", false)
    the_dj.paid_deposit = params.fetch("query_paid_deposit", false)
    the_dj.final_payment = params.fetch("query_final_payment", false)
    the_dj.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_dj.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_dj.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_dj.notes = params.fetch("query_notes")
    the_dj.deposit = params.fetch("query_deposit")
    the_dj.final_price = params.fetch("query_final_price")

    if the_dj.valid?
      the_dj.save
      redirect_to("/djs", { :notice => "DJ created successfully." })
    else
      redirect_to("/djs", { :alert => the_dj.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_dj = Dj.where({ :id => the_id }).at(0)

    the_dj.name = params.fetch("query_name")
    the_dj.contact_name = params.fetch("query_contact_name")
    the_dj.contact_email = params.fetch("query_contact_email")
    the_dj.website = params.fetch("query_website")
    the_dj.photo_url = params.fetch("query_photo_url")
    the_dj.contacted = params.fetch("query_contacted", false)
    the_dj.met_with = params.fetch("query_met_with", false)
    the_dj.chosen = params.fetch("query_chosen", false)
    the_dj.signed_contract = params.fetch("query_signed_contract", false)
    the_dj.paid_deposit = params.fetch("query_paid_deposit", false)
    the_dj.final_payment = params.fetch("query_final_payment", false)
    the_dj.price_options = params.fetch("query_price_options")
    
    if params[:query_pdf].present?
      uploaded_file = params.fetch("query_pdf")
      the_dj.pdf = uploaded_file.original_filename
      if uploaded_file
        save_path = Rails.root.join('public', 'pdfs', the_dj.pdf)
        File.open(save_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    the_dj.notes = params.fetch("query_notes")
    the_dj.deposit = params.fetch("query_deposit")
    the_dj.final_price = params.fetch("query_final_price")

    if the_dj.valid?
      the_dj.save
      redirect_to("/djs/#{the_dj.id}", { :notice => "DJ updated successfully."} )
    else
      redirect_to("/djs/#{the_dj.id}", { :alert => the_dj.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dj = Dj.where({ :id => the_id }).at(0)

    the_dj.destroy

    redirect_to("/djs", { :notice => "DJ deleted successfully."} )
  end
end
