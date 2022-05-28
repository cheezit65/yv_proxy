class DwnldsController < InheritedResources::Base

  private
def index
  recaptcha_tags
end
    def dwnld_params
      params.require(:dwnld).permit()
    end

end
