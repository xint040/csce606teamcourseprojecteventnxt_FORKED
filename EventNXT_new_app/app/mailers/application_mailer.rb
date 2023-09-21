class ApplicationMailer < ActionMailer::Base
  # <!--===================-->
  # <!--to set the default mailer address-->
  default from: "eventnxtapp@gmail.com"   # same email can be found at "/config/environments/development.rb"
  # <!--===================-->
  
  
  layout "mailer"
  
  
  # <!--===================-->
  # <!--to set the default mailer address-->
  def send_email(to, subject, body)
    mail(to: to, subject: subject, body: body)
  end
  # <!--===================-->
end
