class BulkAddsController < InheritedResources::Base
require 'csv'
  
  def new
    @ccontr=current_user.id
    file = "#{Rails.root}/public/dataUploads/horse_data.csv"
    headers = ["farm", "HipNumber", "Name", "Gender", "sire", "Sale","BulkUploadVideoName","Description"]
    CSV.open(file, 'w', write_headers: true, headers: headers) do |csv|
        break if params[:Name1].length == 0 
        csv << [params[:farm1],params[:HipNumber1],params[:Name1],params[:Gender1],params[:sire1],params[:Sale1],params[:BulkUploadVideoName1],params[:Description1]]
        Horse.create(g_count: @ccontr, Name: params[:Name1], HipNumber: params[:HipNumber1], Gender: params[:Gender1].downcase, Sale: (Sale.find_by(Name: params[:Sale1])).id, farm: params[:farm1], farm2: params[:farm21], sire: params[:sire1] )
        break if params[:Name2].length == 0 
        csv << [params[:farm2],params[:HipNumber2],params[:Name2],params[:Gender2],params[:sire2],params[:Sale2],params[:BulkUploadVideoName2],params[:Description2]]
        Horse.create(g_count: @ccontr, Name: params[:Name2], HipNumber: params[:HipNumber2], Gender: params[:Gender2], Sale: (Sale.find_by(Name: params[:Sale2])).id, farm: params[:farm2], farm2: params[:farm22], sire: params[:sire2] )
        break if params[:Name3].length == 0 
        csv << [params[:farm3],params[:HipNumber3],params[:Name3],params[:Gender3],params[:sire3],params[:Sale3],params[:BulkUploadVideoName3],params[:Description3]]
        Horse.create(g_count: @ccontr, Name: params[:Name3], HipNumber: params[:HipNumber3], Gender: params[:Gender3], Sale: (Sale.find_by(Name: params[:Sale3])).id, farm: params[:farm3], farm2: params[:farm23], sire: params[:sire3] )
        break if params[:Name4].length == 0 
        csv << [params[:farm4],params[:HipNumber4],params[:Name4],params[:Gender4],params[:sire4],params[:Sale4],params[:BulkUploadVideoName4],params[:Description4]]
        Horse.create(g_count: @ccontr, Name: params[:Name4], HipNumber: params[:HipNumber4], Gender: params[:Gender4], Sale: params[:Sale4], farm: params[:farm4], farm2: params[:farm24], sire: params[:sire4] )
        break if params[:Name5].length == 0 
        csv << [params[:farm5],params[:HipNumber5],params[:Name5],params[:Gender5],params[:sire5],params[:Sale5],params[:BulkUploadVideoName5],params[:Description5]]
        Horse.create(g_count: @ccontr, Name: params[:Name5], HipNumber: params[:HipNumber5], Gender: params[:Gender5], Sale: params[:Sale5], farm: params[:farm5], farm2: params[:farm25], sire: params[:sire5] )
        break if params[:Name6].length == 0 
        csv << [params[:farm6],params[:HipNumber6],params[:Name6],params[:Gender6],params[:sire6],params[:Sale6],params[:BulkUploadVideoName6],params[:Description6]]
        Horse.create(g_count: @ccontr, Name: params[:Name6], HipNumber: params[:HipNumber6], Gender: params[:Gender6], Sale: params[:Sale6], farm: params[:farm6], farm2: params[:farm26], sire: params[:sire6] )
        break if params[:Name7].length == 0 
        csv << [params[:farm7],params[:HipNumber7],params[:Name7],params[:Gender7],params[:sire7],params[:Sale7],params[:BulkUploadVideoName7],params[:Description7]]
        Horse.create(g_count: @ccontr, Name: params[:Name7], HipNumber: params[:HipNumber7], Gender: params[:Gender7], Sale: params[:Sale7], farm: params[:farm7], farm2: params[:farm27], sire: params[:sire7] )
        break if params[:Name8].length == 0 
        csv << [params[:farm8],params[:HipNumber8],params[:Name8],params[:Gender8],params[:sire8],params[:Sale8],params[:BulkUploadVideoName8],params[:Description8]]
        Horse.create(g_count: @ccontr, Name: params[:Name8], HipNumber: params[:HipNumber8], Gender: params[:Gender8], Sale: params[:Sale8], farm: params[:farm8], farm2: params[:farm28], sire: params[:sire8] )
        break if params[:Name9].length == 0 
        csv << [params[:farm9],params[:HipNumber9],params[:Name9],params[:Gender9],params[:sire9],params[:Sale9],params[:BulkUploadVideoName9],params[:Description9]]
        Horse.create(g_count: @ccontr, Name: params[:Name9], HipNumber: params[:HipNumber9], Gender: params[:Gender9], Sale: params[:Sale9], farm: params[:farm9], farm2: params[:farm92], sire: params[:sire9] )
        break if params[:Name10].length == 0 
        csv << [params[:farm10],params[:HipNumber10],params[:Name10],params[:Gender10],params[:sire10],params[:Sale10],params[:BulkUploadVideoName10],params[:Description10]]
        Horse.create(g_count: @ccontr, Name: params[:Name10], HipNumber: params[:HipNumber10], Gender: params[:Gender10], Sale: params[:Sale10], farm: params[:farm10], farm2: params[:farm210], sire: params[:sire10] )
    end

  end


  private

    def bulk_add_params
      params.require(:bulk_add, :bulk_adder1[:Name,:HipNumber,:farm,:Gender,:sire,:Sale,:BulkUploadVideoName,:Description],:bulk_adder2[:Name,:HipNumber,:farm,:Gender,:sire,:Sale,:BulkUploadVideoName,:Description]).permit()
      permit_params :Name, :HipNumber, :Gender, :Description, :Sale, :PageViews,:sire, :farm, :farm2, :BulkUploadVideoName, :fb_count, :tw_count, :g_count, :e_count
    end

end
