class UsersController < ApplicationController
require 'carrierwave/orm/activerecord'

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def edit
    @farm = Farm.find(params[:id])
  end
 

end