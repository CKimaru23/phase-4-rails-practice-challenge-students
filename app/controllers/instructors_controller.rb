class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        instructors = Instructor.all
        render json: instructors, status: :ok
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor, seriailzer: InstructorSerializer, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        instructor.update!(instructor_params)
        render json: instructor, seriailzer:InstructorSerializer, status: :ok
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def render_not_found_response
        render json: {error: "Instructor not found" }, status: :not_found
    end
end
