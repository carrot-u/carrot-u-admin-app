class HelpController < ApplicationController
  def show
    render template: "help/#{params[:page]}"
  end
end
