class UsersController < ApplicationController
  def index
    @schedules = Schedule.all
    render layout: 'total.html.erb'
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :users
    else
      flash[:notice] = "スケジュールを登録できませんでした"
      render action: :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :users
    else
      flash[:notice] = "スケジュールを更新できませんでした"
      render action: :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :users
  end
end
