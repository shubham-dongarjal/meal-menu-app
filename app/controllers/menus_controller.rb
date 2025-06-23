class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def new
    @menu = Menu.new
  end

  def index
    if params[:menu_date].present?
      date = Date.parse(params[:menu_date]) rescue Date.today
      @menus = current_user.organization.menus
                .includes(menu_responses: :user)
                .where(menu_date: date)
                .order(menu_date: :desc)
                .page(params[:page])
    else
      @menus = current_user.organization.menus
                .includes(menu_responses: :user)
                .where(menu_date: Date.today)
                .order(menu_date: :desc)
                .page(params[:page])
    end
  end

  def create
    @menu = current_user.organization.menus.new(menu_params)
    @menu.menu_date ||= Date.today

    if @menu.save

      @menu.organization.users.each do |user|
        MenuNotifierMailer.new_menu_email(user, @menu).deliver_later
      end

      redirect_to '/', notice: "Menu created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @responses = @menu.menu_responses.includes(:user)
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to '/', notice: "Menu updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to root_path, notice: "Menu deleted successfully."
  end

  def export_by_date
    date = Date.parse(params[:menu_date]) rescue Date.today
    @menus = current_user.organization.menus
                .includes(menu_responses: :user)
                .where(menu_date: date)
                .order(menu_date: :desc)

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=menus_#{date}.xlsx"
      }
    end
  end


  def export_all
    @menus = current_user.organization.menus.includes(menu_responses: :user).order(menu_date: :desc)

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=all_menus.xlsx"
      }
    end
  end




  private

  def menu_params
    params.require(:menu).permit(:description, :menu_date)
  end

  def require_admin!
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
