class PropertiesController < ApplicationController
  def index
    @properties = if params[:keywords]
                 Property.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 Property.all
               end
  end
  
  def show
    @property =  Property.find(params[:id])
  end
  
  def create
    @property = Property.new(params.require(:property).permit(:name,:description,:property_type,:address,:floor))
    if @property.save
      render 'show', status: 201
    else 
      render :nothing => true, :status => 400
    end
  end

  def update
    property = Property.find(params[:id])
    property.update_attributes(params.require(:property).permit(:name,:description,:property_type,:address,:floor))
    head :no_content
  end

  def destroy
    property = Property.find(params[:id])
    property.destroy
    head :no_content
  end
  
end