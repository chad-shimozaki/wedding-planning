class HomeController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:launch, :katsu] })

  def launch
    render({ :template => "home" })
  end

  def katsu
    render({ :template => "katsu" })
  end

end
