class DwnldsController < InheritedResources::Base
 def new
  # redirect_to :back, notice: "Verified"
# To get the code below to work, make sure that the yaml and aws.rb files are either deleted or have
# the correct access_key_id/secret_access_key/bucket or this will fail.
  # if  !params[:worker]
  # redirect_to "http://curl.se"
    # # redirect_back fallback_location: "http://www.yearlingvideos.com"
  # end
  ####### 2022#
  
  #initiate the client
  s3 = Aws::S3::Client.new({
      region:            'us-east-2',
      access_key_id:     'AKIAI6FXAV2E76ELVK5Q',
      secret_access_key: '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'
  })
  #Get the object
    Aws.use_bundled_cert!
    @horse = Horse.find_by(BulkUploadVideoName: params[:filename])
    Horse.increment_counter(:e_count, @horse.id)
    foldery=params[:filename][0...-4] + "/"
    resp = s3.get_object({ bucket:'yv-output2', key: foldery + params[:filename] }, target: params[:filename])

 send_file params[:filename]
 File.delete(:filename)

end
  
# 
  # private
    # def dwnld_params
      # params.require(:dwnld).permit()
    # end

end
