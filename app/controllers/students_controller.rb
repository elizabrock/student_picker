class StudentsController < ApplicationController
  before_action :load_students

  def index
    @student = Student.new
  end

  def create
    student_params = params.require(:student).permit(:name)
    @student = Student.new(student_params)
    if @student.save
      flash.now[:notice] = "#{@student.name} has been added to the list of students."
      @created_student = @student
      @student = Student.new
    else
      flash.now[:alert] = "Student could not be created."
    end
  end

  def pick
    student = Student.pick!
    flash.notice = "#{student.name} has been picked"
    redirect_to root_path
  end

  protected

  def load_students
    @students = Student.all
  end
end
