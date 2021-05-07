class BulkAddsController < InheritedResources::Base
require 'csv'
  
  def new
    file = "#{Rails.root}/public/dataUploads/horse_data.csv"
    headers = ["farm", "HipNumber", "Name", "Gender", "sire", "Sale","BulkUploadVideoName","Description"]
    CSV.open(file, 'w', write_headers: true, headers: headers) do |csv|
        csv << [params[:farm],params[:HipNumber],params[:Name],params[:Gender],params[:sire],params[:Sale],params[:BulkUploadVideoName],params[:Description]]
    end
  end


  private

    def bulk_add_params
      params.require(:bulk_add, :bulk_adder1[:Name,:HipNumber,:farm,:Gender,:sire,:Sale,:BulkUploadVideoName,:Description],:bulk_adder2[:Name,:HipNumber,:farm,:Gender,:sire,:Sale,:BulkUploadVideoName,:Description]).permit()
      permit_params :Name, :HipNumber, :Gender, :Description, :Sale, :PageViews,:sire, :farm, :farm2, :BulkUploadVideoName, :fb_count, :tw_count, :g_count, :e_count
    end

end
