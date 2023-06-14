require 'net/http'
require 'net/https'
module Validatetable
  extend ActiveSupport::Concern

  KEY = ENV['EMAIL_VALIDATION_KEY']
  MIN_QUALITY_SCORE = 0.7

  def validate_mail?(email)
      uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=#{KEY}&email=#{email}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request =  Net::HTTP::Get.new(uri)

      response = http.request(request)
      resp = JSON.parse(response.body)

      response.code == '200' && resp['quality_score'].to_f >= MIN_QUALITY_SCORE
  rescue StandardError => error
      puts "Error (#{ error.message })"
  end
end
