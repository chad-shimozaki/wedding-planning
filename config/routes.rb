Rails.application.routes.draw do
  devise_for :people

  # get("/", { :controller => "home", :action => "launch"})
  root to: "home#launch"

end
