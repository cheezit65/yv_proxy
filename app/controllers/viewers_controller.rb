class ViewersController < InheritedResources::Base

  private

    def viewer_params
      params.require(:viewer).permit()
    end

end
