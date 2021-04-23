class ViewersController < InheritedResources::Base
   def index
    respond_to do |format|
      format.html
      format.pdf do 
        @sale = Sale.find(params[:e])       
        pdf = ReportPdf.new(@farm, @sale)
        send_data pdf.render, filename: "1Report.pdf",
                type: "application/pdf"
      end
      end
  end
  def show
      @Viewers = Farm.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do 
         @sale = Sale.find(params[:e])       
         pdf = ReportPdf.new(@Viewers, @sale)
         send_data pdf.render, filename: "#{@Viewers.name} Report.pdf",
                type: "application/pdf"
        end
      end
  end
  

end
