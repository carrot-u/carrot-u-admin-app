class ApplicationQuestionsController < ApplicationController
  before_action :set_application_question, only: [:show, :edit, :update, :destroy]

  # GET /application_questions
  def index
      @application_questions = ApplicationQuestion.all
  end

  # GET /application_questions/1
  def show
  end

  # GET /application_questions/new
  def new
    @application_question = ApplicationQuestion.new
    render :edit
  end

  # GET /application_questions/1/edit
  def edit
    render :edit
  end

  # POST /application_questions
  def create
    params[:application_question][:created_at] = Time.now
    params[:application_question][:updated_at] = Time.now
    @application_question = ApplicationQuestion.new(application_question_params)

    respond_to do |format|
      if @application_question.save
        format.html { redirect_to @application_question, notice: 'Application Question was successfully created.' }
        format.json { render :show, status: :created, location: @application_question }
      else
        format.html { render :edit }
        format.json { render json: @application_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_questions/1
  def update
    params[:application_question][:updated_at] = Time.now
    respond_to do |format|
      if @application_question.update(application_question_params)
        format.html { redirect_to @application_question, notice: 'Application Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @application_question }
      else
        format.html { render :edit }
        format.json { render json: @application_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_questions/1
  def destroy
    @application_question.destroy
    respond_to do |format|
      format.html { redirect_to application_question_url, notice: 'Application Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_application_question
    @application_question = ApplicationQuestion.find_by(id: params[:id])
  end

  def application_question_params
      params.require(:application_question).permit(:text, :created_at, :updated_at, :role, :current)
  end

end
