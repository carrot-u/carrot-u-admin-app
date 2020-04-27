# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login

  def new
    redirect_to "/auth/saml?redirectUrl=#{URI::encode(request.base_url)}"
  end

  def dev
    user = User.find_by_email(params[:email]) || User.first
    session[:user_id] = user.id
    redirect_to root_path
  end

  def create
    if session[:previous_url]
      redirect_path_from_session = session[:previous_url]
      session[:previous_url] = nil
    else
      redirect_path_from_session = users_path
    end

    email = email_from_provider.downcase
    
    unless email.end_with?('@instacart.com')
      flash[:notice] = 'Please login with an Instacart account.'
      redirect_to root_path
      return
    end

    user = User.find_by_email(email)
    session[:user_id] = user.id
    user.update_attribute(:signed_in_at, Time.zone.now)

    redirect_to redirect_path_from_session
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Come back soon, ok?'
    redirect_to root_path
  end

  private

  def email_from_provider
    response = OneLogin::RubySaml::Response.new(params[:SAMLResponse], { skip_subject_confirmation: true, settings: saml_settings })
    if response.is_valid?
      response.name_id
    else
      ''
    end
  end

  def saml_settings
    settings = OneLogin::RubySaml::Settings.new
    settings.issuer                         = ENV['OKTA_SAML_ISSUER'] || 'http://www.okta.com/exk3nfjulavskxsah357'
    settings.idp_sso_target_url             = ENV['OKTA_SAML_IDP_SSO_TARGET_URL'] || 'https://instacart.okta.com/app/instacart_carrotu_1/exk3nfjulavskxsah357/sso/saml'
    settings.idp_cert                       = ENV['OKTA_SAML_IDP_CERT']
    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
    settings
  end
end
