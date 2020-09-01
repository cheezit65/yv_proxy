class BulkUploadsController < InheritedResources::Base
  
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
      @BulkUpload = Farm.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do 
         @sale = Sale.find(params[:e])       
         pdf = ReportPdf.new(@BulkUpload, @sale)
         send_data pdf.render, filename: "#{@BulkUpload.name} Report.pdf",
                type: "application/pdf"
        end
      end
  end
  
 
 def create
    @horse = Horse.new(bulk_upload_params)
  
  
    respond_to do |format|
      if @horse.save
        format.html { redirect_to root_url, notice: 'Horse was successfully created.' }
        format.json { render :show, status: :created, location: @horse }

      else
        format.html { render :new }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    def bulk_upload_params
      params.require(:bulk_upload).permit(:Name, :HipNumber, :Gender, :Gait, :Description, :Sale, :BulkUploadVideoName, :farm, :sire)
    end
end

