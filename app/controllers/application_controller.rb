class ApplicationController < ActionController::Base

  def turbo_error_message(instance)
    render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                              locals: { message: instance.errors.full_messages.to_sentence })
  end


end
