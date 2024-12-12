# class RsvpsController < ApplicationController
#   skip_before_action(:authenticate_user!, { :only => [:index] })

#   def index
#     matching_rsvps = Rsvp.all

#     @list_of_rsvps = matching_rsvps.order({ :created_at => :desc })

#     render({ :template => "rsvps/index" })
#   end

#   def show
#     the_id = params.fetch("path_id")

#     matching_rsvps = Rsvp.where({ :id => the_id })

#     @the_rsvp = matching_rsvps.at(0)

#     render({ :template => "rsvps/show" })
#   end

#   def create
#     the_rsvp = Rsvp.new
#     the_rsvp.invite_id = params.fetch("query_invite_id")
#     the_rsvp.event_id = params.fetch("query_event_id")
#     the_rsvp.people_id = params.fetch("query_people_id")

#     if the_rsvp.valid?
#       the_rsvp.save
#       redirect_to("/rsvps", { :notice => "Rsvp created successfully." })
#     else
#       redirect_to("/rsvps", { :alert => the_rsvp.errors.full_messages.to_sentence })
#     end
#   end

#   def update
#     the_id = params.fetch("path_id")
#     the_rsvp = Rsvp.where({ :id => the_id }).at(0)

#     the_rsvp.invite_id = params.fetch("query_invite_id")
#     the_rsvp.event_id = params.fetch("query_event_id")
#     the_rsvp.people_id = params.fetch("query_people_id")

#     if the_rsvp.valid?
#       the_rsvp.save
#       redirect_to("/rsvps/#{the_rsvp.id}", { :notice => "Rsvp updated successfully."} )
#     else
#       redirect_to("/rsvps/#{the_rsvp.id}", { :alert => the_rsvp.errors.full_messages.to_sentence })
#     end
#   end

#   def destroy
#     the_id = params.fetch("path_id")
#     the_rsvp = Rsvp.where({ :id => the_id }).at(0)

#     the_rsvp.destroy

#     redirect_to("/rsvps", { :notice => "Rsvp deleted successfully."} )
#   end
# end
