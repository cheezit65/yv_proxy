class SearchesController < InheritedResources::Base
before_filter :check_for_cancel, :only => [:create, :update]

def check_for_cancel
  if params[:commit] == "Cancel"
    redirect_to my_page_path
  end
end

def new
  @horse = Horse.new
end


end

