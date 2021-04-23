class ViewersController < InheritedResources::Base
  def index
  end

  def show
    ## The report is printed using app/PDFs/report_pdf.rb
      @ViewReport = Farm.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do 
         @sale = Sale.find(params[:e])       
         pdf = ReportPdf.new(@ViewReport, @sale)
         send_data pdf.render, filename: "#{@ViewReport.name} Report.pdf",
                type: "application/pdf"
        end
      end
  end

end
