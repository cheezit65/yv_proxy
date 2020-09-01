class BouncesController < InheritedResources::Base

def index  
 if params[:tag] == "fb_count"
   Horse.increment_counter(:fb_count,  params[:horse_id])
   redirect_to params[:url] + params[:horse_id] 
 elsif  params[:tag] == "tw_count"
   Horse.increment_counter(:tw_count,  params[:horse_id])
   redirect_to params[:url] + params[:horse_id] 
 elsif  params[:tag] == "g_count"
   Horse.increment_counter(:g_count,  params[:horse_id])
   redirect_to params[:url] + params[:horse_id] 
 elsif  params[:id]
   redirect_to edit_user_registration_path(id: params[:id], method: post) 
     
 end
 

end


  def new
# To get the code below to work, make sure that the yaml and aws.rb files are either deleted or have
# the correct access_key_id/secret_access_key/bucket or this will fail.

  #initiate the client
  s3 = Aws::S3::Client.new({
      region:            'us-east-1',
      access_key_id:     'AKIAI6FXAV2E76ELVK5Q',
      secret_access_key: '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'
  })
  #Get the object
    Aws.use_bundled_cert!
  resp = s3.get_object({ bucket:'yv-input', key: params[:filename] }, target: params[:filename])

 #resp.body
 #=> #<StringIO ...> 

 #resp.body.read
 send_file params[:filename]
 #redirect_back(fallback_location: root_path, params: resp)
 end
  
  private
  

end

