ActiveAdmin.register Sale do
 # action_item do
  # link_to 'View Website', root_path, :target => "_blank"
# end
        
 action_item :super_action  do
   link_to 'New Horse', new_prawgavp_horse_path
 end


# See permitted parameters documentation:
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
 permit_params :Name, :Location, :website, :StartDate, :SaleCode, :EndDate
# end


end
