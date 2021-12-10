class DoctorsController < ApplicationController
         # GET /doctors
  def index
    @doctors = Doctor.page(params[:page])

    # render json: @doctors
  end

  # GET /doctors/1
  def show
    doctor = Doctor.find(params[:id])

    render :json => doctor, status: :ok

  rescue ActiveRecord::RecordNotFound => e
    render json: {
        message: e
    }, status: :not_found
  end

  # POST /doctors
  def create
    @doctors = Doctor.new(doctors_params)

    if @doctors.save
      render json: @doctors, status: :created
    else
      render json: @doctors.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctors/1
  def update
    doctor = Doctor.find(params[:id])

    doctor.update(doctors_params)

    render :json => doctor
  end

  # DELETE /doctors/1
  def destroy
    doctor = Doctor.find(params[:id])

    doctor.destroy

    render :json => {}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @doctors = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctors_params
      params.permit(:doctor_name, :image_path, :speciality, :status, :star, :location_practice, :biography, :education, :price_rate)
    end
  
end
