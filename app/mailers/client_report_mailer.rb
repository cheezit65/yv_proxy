class ClientReportMailer < ApplicationMailer
  default from: 'do-not-reply@yearlingvideos.com'
 
   def email_client(email1, farm, sale)
    @email1 = email1
    @farm = farm
    @sale = sale
    pdf =  ReportToClientPdf.new(@farm, @sale)
    @saleID = Sale.find(sale)
    pdf.render_file "app/report/#{@saleID.Name}.pdf"
    attachments["#{@saleID.Name}.pdf"] = File.read("app/report/#{@saleID.Name}.pdf")
    mail(to: @email1, subject: 'Yearling Videos: Horse Views Report', cc: @email1, bcc: 'rubykim1965@gmail.com', from: "do-not-reply@yearlingvideos.com")
  end

end
