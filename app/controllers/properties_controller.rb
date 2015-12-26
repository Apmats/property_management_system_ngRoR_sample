class PropertiesController < ApplicationController
  def index
  end
end


class PropertiesController < ApplicationController
  def index
    @propertiess = if params[:keywords]
                 Property.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end
end