class SearchesController < InheritedResources::Base
before_action :check_for_cancel, :only => [:create, :update]

def check_for_cancel
  if params[:commit] == "Cancel"
    redirect_to my_page_path
  end
end

def new
  @horse = Horse.new
end

def index
render plain: "You IP address is #{client_ip}"
end
def client_ip
    request.ip.length
  end

end

