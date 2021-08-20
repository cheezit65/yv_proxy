class DownloadsController < InheritedResources::Base


  private

    def download_params
      params.require(:download).permit()
    end
end

