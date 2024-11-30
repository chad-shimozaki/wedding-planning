Rails.application.routes.draw do
  # Routes for the Rsvp resource:

  # CREATE
  post("/insert_rsvp", { :controller => "rsvps", :action => "create" })
          
  # READ
  get("/rsvps", { :controller => "rsvps", :action => "index" })
  
  get("/rsvps/:path_id", { :controller => "rsvps", :action => "show" })
  
  # UPDATE
  
  post("/modify_rsvp/:path_id", { :controller => "rsvps", :action => "update" })
  
  # DELETE
  get("/delete_rsvp/:path_id", { :controller => "rsvps", :action => "destroy" })

  #------------------------------

  # Routes for the Invite resource:

  # CREATE
  post("/insert_invite", { :controller => "invites", :action => "create" })
          
  # READ
  get("/invites", { :controller => "invites", :action => "index" })
  
  get("/invites/:path_id", { :controller => "invites", :action => "show" })
  
  # UPDATE
  
  post("/modify_invite/:path_id", { :controller => "invites", :action => "update" })
  
  # DELETE
  get("/delete_invite/:path_id", { :controller => "invites", :action => "destroy" })

  #------------------------------

  # Routes for the Meal resource:

  # CREATE
  post("/insert_meal", { :controller => "meals", :action => "create" })
          
  # READ
  get("/meals", { :controller => "meals", :action => "index" })
  
  get("/meals/:path_id", { :controller => "meals", :action => "show" })
  
  # UPDATE
  
  post("/modify_meal/:path_id", { :controller => "meals", :action => "update" })
  
  # DELETE
  get("/delete_meal/:path_id", { :controller => "meals", :action => "destroy" })

  #------------------------------

  # Routes for the Neighborhood resource:

  # CREATE
  post("/insert_neighborhood", { :controller => "neighborhoods", :action => "create" })
          
  # READ
  get("/neighborhoods", { :controller => "neighborhoods", :action => "index" })
  
  get("/neighborhoods/:path_id", { :controller => "neighborhoods", :action => "show" })
  
  # UPDATE
  
  post("/modify_neighborhood/:path_id", { :controller => "neighborhoods", :action => "update" })
  
  # DELETE
  get("/delete_neighborhood/:path_id", { :controller => "neighborhoods", :action => "destroy" })

  #------------------------------

  # Routes for the Cuisine resource:

  # CREATE
  post("/insert_cuisine", { :controller => "cuisines", :action => "create" })
          
  # READ
  get("/cuisines", { :controller => "cuisines", :action => "index" })
  
  get("/cuisines/:path_id", { :controller => "cuisines", :action => "show" })
  
  # UPDATE
  
  post("/modify_cuisine/:path_id", { :controller => "cuisines", :action => "update" })
  
  # DELETE
  get("/delete_cuisine/:path_id", { :controller => "cuisines", :action => "destroy" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the Hotel resource:

  # CREATE
  post("/insert_hotel", { :controller => "hotels", :action => "create" })
          
  # READ
  get("/hotels", { :controller => "hotels", :action => "index" })
  
  get("/hotels/:path_id", { :controller => "hotels", :action => "show" })
  
  # UPDATE
  
  post("/modify_hotel/:path_id", { :controller => "hotels", :action => "update" })
  
  # DELETE
  get("/delete_hotel/:path_id", { :controller => "hotels", :action => "destroy" })

  #------------------------------

  # Routes for the Lighting production company resource:

  # CREATE
  post("/insert_lighting_production_company", { :controller => "lighting_production_companies", :action => "create" })
          
  # READ
  get("/lighting_production_companies", { :controller => "lighting_production_companies", :action => "index" })
  
  get("/lighting_production_companies/:path_id", { :controller => "lighting_production_companies", :action => "show" })
  
  # UPDATE
  
  post("/modify_lighting_production_company/:path_id", { :controller => "lighting_production_companies", :action => "update" })
  
  # DELETE
  get("/delete_lighting_production_company/:path_id", { :controller => "lighting_production_companies", :action => "destroy" })

  #------------------------------

  # Routes for the Transportation company resource:

  # CREATE
  post("/insert_transportation_company", { :controller => "transportation_companies", :action => "create" })
          
  # READ
  get("/transportation_companies", { :controller => "transportation_companies", :action => "index" })
  
  get("/transportation_companies/:path_id", { :controller => "transportation_companies", :action => "show" })
  
  # UPDATE
  
  post("/modify_transportation_company/:path_id", { :controller => "transportation_companies", :action => "update" })
  
  # DELETE
  get("/delete_transportation_company/:path_id", { :controller => "transportation_companies", :action => "destroy" })

  #------------------------------

  # Routes for the Coordinator resource:

  # CREATE
  post("/insert_coordinator", { :controller => "coordinators", :action => "create" })
          
  # READ
  get("/coordinators", { :controller => "coordinators", :action => "index" })
  
  get("/coordinators/:path_id", { :controller => "coordinators", :action => "show" })
  
  # UPDATE
  
  post("/modify_coordinator/:path_id", { :controller => "coordinators", :action => "update" })
  
  # DELETE
  get("/delete_coordinator/:path_id", { :controller => "coordinators", :action => "destroy" })

  #------------------------------

  # Routes for the Photographer resource:

  # CREATE
  post("/insert_photographer", { :controller => "photographers", :action => "create" })
          
  # READ
  get("/photographers", { :controller => "photographers", :action => "index" })
  
  get("/photographers/:path_id", { :controller => "photographers", :action => "show" })
  
  # UPDATE
  
  post("/modify_photographer/:path_id", { :controller => "photographers", :action => "update" })
  
  # DELETE
  get("/delete_photographer/:path_id", { :controller => "photographers", :action => "destroy" })

  #------------------------------

  # Routes for the Dj resource:

  # CREATE
  post("/insert_dj", { :controller => "djs", :action => "create" })
          
  # READ
  get("/djs", { :controller => "djs", :action => "index" })
  
  get("/djs/:path_id", { :controller => "djs", :action => "show" })
  
  # UPDATE
  
  post("/modify_dj/:path_id", { :controller => "djs", :action => "update" })
  
  # DELETE
  get("/delete_dj/:path_id", { :controller => "djs", :action => "destroy" })

  #------------------------------

  # Routes for the Florist resource:

  # CREATE
  post("/insert_florist", { :controller => "florists", :action => "create" })
          
  # READ
  get("/florists", { :controller => "florists", :action => "index" })
  
  get("/florists/:path_id", { :controller => "florists", :action => "show" })
  
  # UPDATE
  
  post("/modify_florist/:path_id", { :controller => "florists", :action => "update" })
  
  # DELETE
  get("/delete_florist/:path_id", { :controller => "florists", :action => "destroy" })

  #------------------------------

  # Routes for the Bakery resource:

  # CREATE
  post("/insert_bakery", { :controller => "bakeries", :action => "create" })
          
  # READ
  get("/bakeries", { :controller => "bakeries", :action => "index" })
  
  get("/bakeries/:path_id", { :controller => "bakeries", :action => "show" })
  
  # UPDATE
  
  post("/modify_bakery/:path_id", { :controller => "bakeries", :action => "update" })
  
  # DELETE
  get("/delete_bakery/:path_id", { :controller => "bakeries", :action => "destroy" })

  #------------------------------

  # Routes for the Caterer resource:

  # CREATE
  post("/insert_caterer", { :controller => "caterers", :action => "create" })
          
  # READ
  get("/caterers", { :controller => "caterers", :action => "index" })
  
  get("/caterers/:path_id", { :controller => "caterers", :action => "show" })
  
  # UPDATE
  
  post("/modify_caterer/:path_id", { :controller => "caterers", :action => "update" })
  
  # DELETE
  get("/delete_caterer/:path_id", { :controller => "caterers", :action => "destroy" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  post("/insert_venue", { :controller => "venues", :action => "create" })
          
  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  
  get("/venues/:path_id", { :controller => "venues", :action => "show" })
  
  # UPDATE
  
  post("/modify_venue/:path_id", { :controller => "venues", :action => "update" })
  
  # DELETE
  get("/delete_venue/:path_id", { :controller => "venues", :action => "destroy" })

  #------------------------------



  # get("/", { :controller => "home", :action => "launch"})
  root to: "home#launch"

end
