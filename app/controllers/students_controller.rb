class StudentsController < ApplicationController
  before_action :load_students

  def index
    @student = Student.new
  end

  def create
    student_params = params.require(:student).permit(:name)
    @student = Student.new(student_params)
    if @student.save
      flash.notice = "#{@student.name} has been added to the list of students."
      redirect_to root_path
    else
      flash.now[:alert] = "Student could not be created."
      render :index
    end
  end

  protected

  def load_students
    @students = Student.all
  end
end
