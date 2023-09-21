class NotificationMailer < ApplicationMailer
  default from: 'hola@entradium.com'

  def welcome_email
    @worker = params[:worker]
    @url  = 'http://example.com/login'
    mail(to: @worker.email, subject: 'Welcome to My Awesome Site')
  end
end
