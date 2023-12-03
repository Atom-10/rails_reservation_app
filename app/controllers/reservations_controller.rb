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
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.save
    redirect_to reservation_path(@reservation)
  end

  def edit
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guest)
  end
end
