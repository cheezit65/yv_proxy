ActiveAdmin.register Horse do
config.clear_action_items!
  
action_item :super_action do
   link_to 'View Website', root_path, :target => "_blank"
 end

 action_item :super_action  do
   link_to 'New Horse', new_prawgavp_horse_path
 end
 action_item :only => :index  do
   link_to 'New Sire', new_prawgavp_sire_path
 end
       
config.per_page = 5000
 action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end
  
# action_item do
  # link_to 'Download CSV Template', '../Template.csv', download: ''
# end
         

  collection_action :upload_csv do    
    render "admin/csv/horse/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    errors = Array.new
    CsvDb.convert_save("horse", params[:dump][:file], errors)
    if errors.any? 
    errors.each do |line|
      flash[:notice] = errors
    end
  else
    flash[:success] = "Import Successful!"
  end  
  redirect_to collection_path, notice: "CSV imported successfully!"    
  end

    batch_action :flag do |selection|
    Horse.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Posts flagged!"
  end
permit_params :Name, :HipNumber, :Gender, :Description, :Sale, :PageViews,:sire, :farm, :farm2, :BulkUploadVideoName

csv do
    column :Name
    column :HipNumber
    column :Gender
    column :Description
    column :Sale
    column :sire
    column :farm
    column :farm2
    column :BulkUploadVideoName
    column :fb_count
    column :tw_count
    column :g_count
    column :e_count

end
  index do
     selectable_column
    id_column
    column :Sale do |sale|
      if sale.Sale.to_i > 0
      saleName = Sale.find(sale.Sale)
      saleName.Name
      else
      sale.Sale
      end
    end
    column :HipNumber
    column :Name
    column :PageViews
    column :Gender
    column :sire do |s|
      if s.sire.to_i > 0
      sireName = Sire.find(s.sire)
      sireName.Name      
      else
        s.sire
      end
    end
    column :farm do |farm|
      if farm.farm.to_i > 0
      farmName = Farm.find(farm.farm)
      farmName.name
      else
        farm.farm
      end
    end
    column :farm2 do |farm2|
    if (farm2.farm2).to_i > 0
      farmName = Farm.find(farm2.farm2)
      farmName.name
     else
       farm2.farm2
    end
    end
    column :e_count
    column :g_count
    column :BulkUploadVideoName
      actions
  end
 form do |f|
   Sires = Sire.order(:Name)
   Sales = Sale.order(:Name)
   Farms = Farm.order(:name)
    f.inputs do
      f.input :HipNumber
      f.input :Name
      f.input :Gender, :as => :select, :collection => ["filly","colt", "gelding"]
      f.input :farm, :as => :select, :collection => Farms.map{|u| ["#{u.name}", u.id]}
      f.input :farm2, :as => :select, :collection => Farms.map{|u| ["#{u.name}", u.id]}
      f.input :Description
      f.input :Sale, :as => :select, :collection => Sales.map{|u| ["#{u.Name}", u.id]}
      f.input :sire, :as => :select, :collection => Sires.map{|u| ["#{u.Name}", u.id]}
      f.input :BulkUploadVideoName
    end
    f.actions
     end               
          
      filter :Name
      filter :HipNumber
      filter :Gender, :as => :select, :collection => ["filly","colt", "gelding"]
      filter :farm, :as => :select, :collection => Farm.all.map{|u| ["#{u.name}", u.id]}
      filter :farm2, :as => :select, :collection => Farm.all.map{|u| ["#{u.name}", u.id]}
      filter :Description
      filter :Sale, :as => :select, :collection => Sale.all.map{|u| ["#{u.Name}", u.id]}
      filter :sire, :as => :select, :collection => Sire.all.map{|u| ["#{u.Name}", u.id]}
      filter :BulkUploadVideoName 
      filter :PageViews 
     
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :Name, :HipNumber, :Gender, :Description, :Sale, :PageViews,:sire, :farm, :farm2, :BulkUploadVideoName, :fb_count, :tw_count, :g_count, :e_count

end
