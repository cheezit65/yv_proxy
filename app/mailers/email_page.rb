class EmailPage  < ActionMailer::Base
 default from: 'do-not-reply@yearlingvideos.com'
 
  def email_friend(email1, email2, id, horsename, hip)
    @email1 = email1
    @email2 = email2
    @hip = hip
    @id = id
    @horsename = horsename
    @url = 'http://www.yearlingvideos.com/horses' + '/' + @id
    mail(to: @email2, subject: 'Yearling Video Horse', cc: @email1, bcc: 'rubykim1965@gmail.com', from: "do-not-reply@yearlingvideos.com")
  end
  
end
