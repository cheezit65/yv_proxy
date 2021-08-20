class DownloadsController < InheritedResources::Base
def index
  recaptcha_tags  
end
  private

    def download_params
      params.require(:download).permit()
    end
end

