class EmailNotify  < ActionMailer::Base
 default from: 'do-not-reply@yearlingvideos.com'
 
 def email_notify(horse)
    @horse = horse
    mail(to: "fostershomeemail@yahoo.com", subject: 'New Horse Uploaded on YearlingVideos.com', from: "do-not-reply@yearlingvideos.com")
   end
end
