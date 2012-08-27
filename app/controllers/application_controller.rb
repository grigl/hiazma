class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :set_locale

  def set_locale
    detected = extract_locale_from_accept_language_header
    if not I18n.available_locales.include? detected.to_sym
      detected = I18n.default_locale
    end
    I18n.locale = params[:locale] || detected
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
