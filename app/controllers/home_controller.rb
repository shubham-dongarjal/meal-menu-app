class HomeController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @today_menu = Menu.find_by(menu_date: Date.today)

    if @today_menu
      @responses = @today_menu.menu_responses.includes(:user)
    else
      @responses = []
    end

    # if user is authenticated and current user is not admin it goes in
    # then inside the block it check if todays menu present then @existing_response stores any response for that user for todays menu
    # if no @existing_response then it creates new MenuResponse object, allowing user to submit a new response for todays menu
    if current_user && !current_user.admin?
      @existing_response = current_user.menu_responses.find_by(menu: @today_menu) if @today_menu
      @menu_response = MenuResponse.new if @existing_response.nil?
    end
  end
end
