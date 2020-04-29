OmniAuth.config.logger = Rails.logger

if File.exist?(Rails.root.join('conf/okta.cert'))
  ENV['OKTA_SAML_IDP_CERT'] = File.read(Rails.root.join('conf/okta.cert'))
elsif File.exist?('/conf/okta.cert')
  ENV['OKTA_SAML_IDP_CERT'] = File.read('/conf/okta.cert')
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
    :skip_subject_confirmation => true, 
    :issuer                         => ENV['OKTA_SAML_ISSUER'] || 'http://www.okta.com/exk3nfjulavskxsah357',
    :idp_sso_target_url                 => ENV['OKTA_SAML_IDP_SSO_TARGET_URL'] || 'https://instacart.okta.com/app/instacart_carrotu_1/exk3nfjulavskxsah357/sso/saml',
    :idp_cert                           => ENV['OKTA_SAML_IDP_CERT'],
    :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress",
    :idp_sso_target_url_runtime_params  => {:redirectUrl => :RelayState}
end
