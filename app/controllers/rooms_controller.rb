class RoomsController < ApplicationController
  def index
    if params[:area_search].present?
      @rooms = Room.search_by_place(params[:area_search])
    elsif params[:free_word_search].present?
      @rooms = Room.search_by_name_or_details(params[:free_word_search])
    else
      @rooms = Room.all
    end

    @room_count = @rooms.count
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to room_path(@room)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def user_room
    @rooms = Room.all
  end

  def confirm_reservation
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_form_params)
    session[:reservation_data] = @reservation.attributes
    render "reservations/confirmation"
  end

  def reservation_form_params
    params.require(:reservation).permit(:check_in, :check_out, :guest)
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_details, :image, :price, :place)
  end
end
