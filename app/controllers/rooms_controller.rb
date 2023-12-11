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
    if @room.save
      flash[:notice] = "施設を登録しました"
      redirect_to user_room_path
    else
      flash[:alert] = "入力内容を確認してください"
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "施設情報を更新しました"
      redirect_to user_room_path
    else
      flash[:alert] = "入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to user_room_path
  end

  def user_room
    @rooms = Room.all
  end

  def confirm_reservation
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_form_params)
    @reservation.room_id = @room.id
    session[:reservation_data] = @reservation.attributes
    render "reservations/confirmation"
  end

  def reservation_form_params
    params.require(:reservation).permit(:check_in, :check_out, :guest, :room_id)
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_details, :image, :price, :place)
  end
end
