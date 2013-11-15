AppBuildings::Admin.controllers :type_buildings do
  get :index do
    @title = "Type_buildings"
    @type_buildings = TypeBuilding.all
    render 'type_buildings/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'type_building')
    @type_building = TypeBuilding.new
    render 'type_buildings/new'
  end

  post :create do
    @type_building = TypeBuilding.new(params[:type_building])
    if @type_building.save
      @title = pat(:create_title, :model => "type_building #{@type_building.id}")
      flash[:success] = pat(:create_success, :model => 'TypeBuilding')
      params[:save_and_continue] ? redirect(url(:type_buildings, :index)) : redirect(url(:type_buildings, :edit, :id => @type_building.id))
    else
      @title = pat(:create_title, :model => 'type_building')
      flash.now[:error] = pat(:create_error, :model => 'type_building')
      render 'type_buildings/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "type_building #{params[:id]}")
    @type_building = TypeBuilding.find(params[:id])
    if @type_building
      render 'type_buildings/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'type_building', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "type_building #{params[:id]}")
    @type_building = TypeBuilding.find(params[:id])
    if @type_building
      if @type_building.update_attributes(params[:type_building])
        flash[:success] = pat(:update_success, :model => 'Type_building', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:type_buildings, :index)) :
          redirect(url(:type_buildings, :edit, :id => @type_building.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'type_building')
        render 'type_buildings/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'type_building', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Type_buildings"
    type_building = TypeBuilding.find(params[:id])
    if type_building
      if type_building.destroy
        flash[:success] = pat(:delete_success, :model => 'Type_building', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'type_building')
      end
      redirect url(:type_buildings, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'type_building', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Type_buildings"
    unless params[:type_building_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'type_building')
      redirect(url(:type_buildings, :index))
    end
    ids = params[:type_building_ids].split(',').map(&:strip)
    type_buildings = TypeBuilding.find(ids)
    
    if TypeBuilding.destroy type_buildings
    
      flash[:success] = pat(:destroy_many_success, :model => 'Type_buildings', :ids => "#{ids.to_sentence}")
    end
    redirect url(:type_buildings, :index)
  end
end
