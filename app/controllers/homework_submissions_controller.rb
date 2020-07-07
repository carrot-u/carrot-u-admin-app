class HomeworkSubmissionsController < ApplicationController
  before_action :set_student
  before_action :set_homework_submission, only: [:new, :create, :show, :edit, :update, :destroy]
  
  # GET /homework_submissions
  # GET /homework_submissions.json
  def index
    @homework_submissions = HomeworkSubmission.all
  end

  # GET /homework_submissions/1
  # GET /homework_submissions/1.json
  def show
  end

  # GET /homework_submissions/new
  def new
  end

  # GET /homework_submissions/1/edit
  def edit
  end

  # POST /homework_submissions
  # POST /homework_submissions.json
  def create
    @homework_submission.pull_request = homework_submission_params[:pull_request]
    @homework_submission.is_public = true

    respond_to do |format|
      if @homework_submission.save
        format.html { redirect_to @homework_submission, notice: 'Homework submission was successfully created.' }
        format.json { render :show, status: :created, location: @homework_submission }
      else
        format.html { render :new }
        format.json { render json: @homework_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homework_submissions/1
  # PATCH/PUT /homework_submissions/1.json
  def update
    respond_to do |format|
      if @homework_submission.update(homework_submission_params)
        format.html { redirect_to @homework_submission, notice: 'Homework submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework_submission }
      else
        format.html { render :edit }
        format.json { render json: @homework_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homework_submissions/1
  # DELETE /homework_submissions/1.json
  def destroy
    @homework_submission.destroy
    respond_to do |format|
      format.html { redirect_to homework_submissions_url, notice: 'Homework submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework_submission
      if params[:id]
        @homework_submission = HomeworkSubmission.find(params[:id])
      else
        homework_id = params[:homework_id] || homework_submission_params[:homework_id]
        @homework_submission = HomeworkSubmission.find_or_initialize_by(homework_id:homework_id, course_session_participant:@student)
      end  
    end

    # Only allow a list of trusted parameters through.
    def homework_submission_params
      params.require(:homework_submission).permit(:homework_id, :pull_request, :is_public)
    end
end
