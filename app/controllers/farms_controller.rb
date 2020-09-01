class FarmsController < InheritedResources::Base
   
 
  def index
    @farms = Farm.all
  end
  
  def update
    @farm = Farm.find(params[:id])
    respond_to do |format|
      if @farm.update_attributes(farm_params)
        format.html { redirect_to :back, notice: 'Farm was successfully updated. Congratulations.'}
      end
      end
  end
  
  
  def show
      @farm = Farm.find(params[:id])
      @sale = Sale.all
    respond_to do |format|
      format.html
      format.pdf do
        sale = Sale.find(params[:e])
        pdf = FarmPdf.new(@farm, sale)
        send_data pdf.render, filename: "Farm_#{@farm.name}.pdf",
                type: "application/pdf"
      end
    end
 
  end

  
  private

    def farm_params
      params.require(:farm).permit(:name, :address, :city, :state, :zipcode, :phonenumber, :website, :email, :FarmCode)
    end
end
