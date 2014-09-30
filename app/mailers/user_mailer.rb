class UserMailer < ActionMailer::Base
  default from: 'from@example.com'

  def created_comic_email(user)
    @user = user
    mail(to: @user.email, subject: 'Comic Created!')
  end

end
