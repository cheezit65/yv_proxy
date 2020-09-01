ActiveAdmin.register User do
    index do
     selectable_column
    id_column
    column :email
    column :farm
    column :business
    column :role
      actions
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
# end

 permit_params :email, :password, :farm, :business, :role
end
