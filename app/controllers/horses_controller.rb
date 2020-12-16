class HorsesController < InheritedResources::Base
# require 'carrierwave/orm/activerecord'
  def import
      if Horse.import(params[:file]) == :failed
    redirect_to root_url
  else
    flash[:success] = "Import Successful"
  end  
      redirect_to :back, notice: "Horses successfully added."
  end  


  def index
    @horses = Horse.all
  end

   # def create
# 
        # Aws.use_bundled_cert!
        # s3 = Aws::S3::Resource.new(
        # credentials: Aws::Credentials.new('AKIAI6FXAV2E76ELVK5Q', 'SgoR4/o9vRPip69daNu9CXRYrHHMFBcrjb5j/kev'),
        # region: 'us-east-1'
        # )
          # obj = s3.bucket('depo-input').object(params[:horse][:video].original_filename)
          # obj.upload_file(params[:horse][:video].tempfile.path, acl:'public-read')
          # obj.public_url
#           
        # @horse = Horse.new(horse_params)
        # respond_to do |format|
   # if @horse.save
        # format.html { redirect_to :back, notice: "You have successfully created #{@horse.Name} in sale #{Sale.find(@horse.Sale).Name}." }
      # end
    # end
    # end
    
def edit
  @horse = Horse.find(params[:id])  
end


  def update
  @horse = Horse.find(params[:id])
    respond_to do |format|
      if @horse.update_attributes(horse_params)
        format.html { redirect_to :back, notice: 'Horse was successfully updated. Congratulations.'}
      end
      end
  end


 private     
    def horse_params
      params.required(:horse).permit(:Name, :HipNumber, :Gender, :Description, :Sale, :farm, :farm2, :sire, :BulkUploadVideoName, :video, :fb_count, :tw_count, :g_count, :e_count)
    end

  end
