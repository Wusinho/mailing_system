class ApplicationController < ActionController::Base
  before_action :set_locale

  def turbo_error_message(instance)
    render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                              locals: { message: instance.errors.full_messages.to_sentence })
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]&.to_sym
    I18n.available_locales.include?(parsed_locale) ? parsed_locale : nil
  end

end
