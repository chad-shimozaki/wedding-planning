class HomeController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:launch] })

  def launch

    render({ :template => "home" })
  end

end
