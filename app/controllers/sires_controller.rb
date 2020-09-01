class SiresController < InheritedResources::Base
skip_before_action :verify_authenticity_token

def create
    @sire = Sire.new
    @sire.Name = params[:sire][:Name]
    @sire.gait = params[:sire][:gait]
    @sire.eligibility = params[:sire][:eligibility]
    if @sire.save
       redirect_to :back, notice: "Sire #{@sire.Name} has been successfully created."  
    end
end
  private

    def sire_params
      params.require(:sire).permit(:Name, :gait, :eligibility)
    end
end

