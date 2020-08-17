class CourseSessionsController < ApplicationController
  before_action :set_course_session, only: [:show, :edit, :update, :destroy]

  # GET /course_sessions
  def index
    @course_sessions = CourseSession.all
  end

  # GET /course_sessions/1
  def show
  end

  # GET /course_sessions/new
  def new
    @course_session = CourseSession.new
  end

  # GET /course_sessions/1/edit
  def edit
  end

  # POST /course_sessions
  def create
    @course_session = CourseSession.new(course_session_params)

    respond_to do |format|
      if @course_session.save
        format.html { redirect_to @course_session, notice: 'Course_session was successfully created.' }
        format.json { render :show, status: :created, location: @course_session }
      else
        format.html { render :new }
        format.json { render json: @course_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_sessions/1
  # PATCH/PUT /course_sessions/1.json
  def update
    respond_to do |format|
      if @course_session.update(course_session_params)
        # send an email here if the session is open for applications
        if @course_session.admissions?
          WaitingList.notify_course_session_open(@course_session)
        end
        format.html { redirect_to @course_session, notice: 'Course session was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_session }
      else
        format.html { render :edit }
        format.json { render json: @course_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_session/1
  # DELETE /course_session/1.json
  def destroy
    @course_session.destroy_lectures
    @course_session.destroy
    respond_to do |format|
      format.html { redirect_to course_sessions_url, notice: 'Course_session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_course_session
        @course_session = CourseSession.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def course_session_params
         csp = params.require(:course_session).permit(:name, :description, :start_date, :end_date, :repository_link, :status)
         csp[:status] = params[:course_session][:status].to_i
         return csp
      end

      def destroy_lectures
        self.lectures.destroy_all
      end
  end
