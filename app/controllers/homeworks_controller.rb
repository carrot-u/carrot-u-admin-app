class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  before_action :set_lecture, only: [:new, :create]
  respond_to :html, :json

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.all
    respond_with(@homeworks)
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    @homework = @lecture.build_homework
  end

  # GET /homeworks/1/edit
  def edit
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    #@lecture = Lecture.find(params[:format])
    @homework = @lectures.homework.build(homework_params)
    flash[:notice] = "Homework was successfully created." if @homework.save
    respond_with(@homework)
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_with(@homework)
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to lecture_path(lecture_id), notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    def set_lecture
      @lecture = Lecture.find(params[:format])
    end

    # Only allow a list of trusted parameters through.
    def homework_params
      #params.fetch(:homework, {})
      params.require(:homework).permit(:content, :status, :due_date)
    end
end
