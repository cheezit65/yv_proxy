class DwnldsController < InheritedResources::Base

  private
    def dwnld_params
      params.require(:dwnld).permit()
    end

end
