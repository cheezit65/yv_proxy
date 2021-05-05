class BulkAddsController < InheritedResources::Base

  private

    def bulk_add_params
      params.require(:bulk_add).permit()
    end

end
