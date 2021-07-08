class BouncesController < InheritedResources::Base

def index  
 # if params[:tag] == "fb_count"
   # Horse.increment_counter(:fb_count,  params[:horse_id])
   # redirect_to params[:url] + params[:horse_id] 
 # elsif  params[:tag] == "tw_count"
   # Horse.increment_counter(:tw_count,  params[:horse_id])
   # redirect_to params[:url] + params[:horse_id] 
 # elsif  params[:tag] == "g_count"
   # Horse.increment_counter(:g_count,  params[:horse_id])
   # redirect_to params[:url] + params[:horse_id] 
 if  params[:id]
   redirect_to edit_user_registration_path(id: params[:id], method: post)      
 elsif params[:saleid]
   folder_path = "#{Rails.root}/public/downloads/"
   zipfile_name = "#{Rails.root}/public/archive.zip"
   FileUtils.remove_dir(folder_path) if Dir.exist?(folder_path)
   FileUtils.remove_entry(zipfile_name) if File.exist?(zipfile_name)
   Dir.mkdir("#{Rails.root}/public/downloads")
   @horses = Horse.where(Sale: params[:saleid])
   s3 = Aws::S3::Client.new({
      region:            'us-east-1',
      access_key_id:     'AKIAI6FXAV2E76ELVK5Q',
      secret_access_key: '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'
   })
   Aws.use_bundled_cert!
   @horses.each do |horse|  
        resp = s3.get_object({ bucket:'yv-input', key: horse.BulkUploadVideoName }, target: folder_path + horse.BulkUploadVideoName)
   end
   input_filenames = Dir.entries(folder_path).select {|f| !File.directory? f}
   Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |attachment|
         zipfile.add(attachment,File.join(folder_path,attachment))
      end
   end
   send_file(File.join("#{Rails.root}/public/", 'archive.zip'), :type => 'application/zip', :filename => "#{Time.now.to_date}.zip")
   FileUtils.remove_dir(folder_path) if Dir.exist?(folder_path)
 end
end


  def new
# To get the code below to work, make sure that the yaml and aws.rb files are either deleted or have
# the correct access_key_id/secret_access_key/bucket or this will fail.
 if !params[:token]
   redirect_back fallback_location: "https://www.google.com"
 end
 if !params[:token] == 'random'
   redirect_back fallback_location: "https://www.google.com"
 end
   redirect_to edit_user_registration_path(id: params[:id], method: post)  
  #initiate the client
  s3 = Aws::S3::Client.new({
      region:            'us-east-1',
      access_key_id:     'AKIAI6FXAV2E76ELVK5Q',
      secret_access_key: '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'
  })
  #Get the object
    Aws.use_bundled_cert!
    foldery=params[:filename][0...-4] + "/"
    resp = s3.get_object({ bucket:'yv-output2', key: foldery + params[:filename] }, target: params[:filename])

 # #resp.body
 # #=> #<StringIO ...> 
# 
 # #resp.body.read
 send_file params[:filename]
 #redirect_back(fallback_location: root_path, params: resp)
 end
  
  private
  

end

