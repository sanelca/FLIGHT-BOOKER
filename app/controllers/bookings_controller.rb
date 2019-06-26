class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:num_passengers].to_i
    if @num_passengers < 1 || @num_passengers > 4
      @num_passengers = 1
    end
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booking created!"
      redirect_to @booking
    else
      @flight = Flight.find(booking_params[:flight_id])
      @num_passengers = params[:num_passengers]
      render 'new'
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email, :booking_id])
    end
end
