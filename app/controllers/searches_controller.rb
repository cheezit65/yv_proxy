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
    @clientip = request.ip[0..2]
    if @clientip == "10."
      redirect_back(fallback_location:"/")
    end
    
    
end

end

