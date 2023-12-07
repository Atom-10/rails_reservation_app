class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.room = @room

    if @reservation.save
    redirect_to reservation_path(@reservation), notice: "予約しました"
    else
      render "rooms/show"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation), notice: "予約を変更しました"
    else
      render :edit
    end
  end
  

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guest)
  end
end
