class UserNotifierMailer < ApplicationMailer
  default :from => 'company@sparkstart.org'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    attachments.inline['newlogo.png'] = File.read('app/assets/images/newlogo.png')
    mail( :to => @user.email,
         :subject => 'Thanks for signing up for Spark Start!' )
  end
end


