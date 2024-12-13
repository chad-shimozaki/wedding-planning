class InvitesController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    matching_invites = Invite.all

    @list_of_invites = matching_invites.order({ :created_at => :desc })

    render({ :template => "invites/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_invites = Invite.where({ :id => the_id })

    @the_invite = matching_invites.at(0)

    render({ :template => "invites/show" })
  end

  def create
    the_invite = Invite.new
    the_invite.people_id = params.fetch("query_people_id")

    if the_invite.valid?
      the_invite.save
      redirect_to("/invites", { :notice => "Invite created successfully." })
    else
      redirect_to("/invites", { :alert => the_invite.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_invite = Invite.where({ :id => the_id }).at(0)

    the_invite.people_id = params.fetch("query_people_id")

    if the_invite.valid?
      the_invite.save
      redirect_to("/invites/#{the_invite.id}", { :notice => "Invite updated successfully."} )
    else
      redirect_to("/invites/#{the_invite.id}", { :alert => the_invite.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_invite = Invite.where({ :id => the_id }).at(0)

    the_invite.destroy

    redirect_to("/invites", { :notice => "Invite deleted successfully."} )
  end
end
