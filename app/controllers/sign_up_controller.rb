class SignUpController < ApplicationController
	
	def show
	end

	def create
		@mentor = Mentor.new(mentor_params)

		respond_to do |format|
		  if @mentor.save
		    format.html { redirect_to @mentor, notice: 'Mentor was successfully created.' }
		    format.json { render :show, status: :created, location: @mentor }
		  else
		    format.html { render :new }
		    format.json { render json: @mentor.errors, status: :unprocessable_entity }
		  end
		end
	end

end
