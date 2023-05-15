class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  before_action :set_user, only: %i[create update destroy]
  before_action :check_user, only: %i[update destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @reservations = @user.reservations.includes(:car)
    else
      @reservations = Reservation.all
    end
    render json: @reservations, status: 200
  end

  def show
    render json: @reservation, status: 200
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = params[:user_id]
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: 400
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation, status: 200
    else
      render json: { errors: @reservation.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @reservation
      @reservation.destroy
      render json: { message: 'Reservation deleted successfully.' }, status: 204
    else
      render error: { errors: @reservation.errors.full_messages }, status: 404
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def check_user
    return unless @user != @reservation.user

    render json: { errors: 'You are not authorized to update this reservation.' }, status: :unauthorized
  end

  def reservation_params
    params.require(:reservation).permit(:car_id, :reservation_date, :city)
  end
end
