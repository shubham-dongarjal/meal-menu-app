class MenuResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu
  before_action :set_menu_response, only: [:edit, :update]

  def create
    snacks_value = ActiveModel::Type::Boolean.new.cast(params[:menu_response][:snacks])
    dinner_value = ActiveModel::Type::Boolean.new.cast(params[:menu_response][:dinner])

    @menu_response = @menu.menu_responses.new(
      user: current_user,
      snacks: snacks_value,
      dinner: dinner_value,
      chapatis_count: dinner_value ? params[:menu_response][:chapatis_count] : nil,
      submitted_at: Time.current
    )

    if @menu_response.save
      redirect_to root_path, notice: "Response submitted successfully."
    else
      redirect_to root_path, alert: "Failed to submit response: #{@menu_response.errors.full_messages.join(', ')}"
    end
  end

  def update
    snacks_value = ActiveModel::Type::Boolean.new.cast(params[:menu_response][:snacks])
    dinner_value = ActiveModel::Type::Boolean.new.cast(params[:menu_response][:dinner])

    if @menu_response.update(
        snacks: snacks_value,
        dinner: dinner_value,
        chapatis_count: dinner_value ? params[:menu_response][:chapatis_count] : nil
      )
      redirect_to root_path, notice: "Response updated successfully."
    else
      redirect_to root_path, alert: "Failed to update response: #{@menu_response.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @menu_response = current_user.menu_responses.find(params[:id])
    @menu_response.destroy
    redirect_to root_path, notice: "Response deleted successfully."
  end


  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def set_menu_response
    @menu_response = current_user.menu_responses.find(params[:id])
  end
end
