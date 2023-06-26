class EmailReport  < ActionMailer::Base
 default from: 'do-not-reply@yearlingvideos.com'
 
   def email_client(email1, farm, sale)
    @email1 = email1
    @farm = farm
    @sale = sale
    pdf =  ReportToClientPdf.new(@farm, @sale)
    #filename = File.join(Rails.root, "app/report", "x.pdf")
    pdf.render_file "app/report/x.pdf"
    #attachments["x.pdf"] = File.read("app/report/x.pdf")
    #attachments["report.pdf"] = { :mime_type => 'application/pdf', :content => "app/report/x.pdf" }
    mail(to: @email1, subject: 'Yearling Video Horse', cc: @email1, bcc: 'rubykim1965@gmail.com', from: "do-not-reply@yearlingvideos.com")
  end
  end