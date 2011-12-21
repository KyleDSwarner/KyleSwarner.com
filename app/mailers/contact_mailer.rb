class ContactMailer < ActionMailer::Base
  default :from => "KyleDSwarner@gmail.com",
          :to => "Swarn3r@gmail.com"
  
  def email_form(name, email, phone, message)
    @userName = name
    @userEmail = email
    @userPhone = phone
    @userMessage = message
    @sent_on = Time.now
    mail(:subject => "Message submitted via KyleSwarnerDotCom!")
  end
  
end
