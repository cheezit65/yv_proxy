ActiveAdmin.register_page "Dashboard" do
  
 action_item :super_action do
   link_to 'View Website', root_path, :target => "_blank"
 end
        
 # action_item :super_action  do
   # link_to 'New Horse', new_prawgavp_horse_path
 # end
  
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  menu parent: 'Reports'
  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    section "Yearling Video Horse Dashboard" do
      
columns do
  column do
    panel "Info" do
      para "Notes for Admins."
    end
  end
end
      
    end
end
end
