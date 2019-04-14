class AppController < ApplicationController

  def home
    @news = New.all
  end
  def login
    @countries = Country.where.not(id: 1)
  end

  def new
    if params[:id]
      @new = New.find_by(id: params[:id])
      if @new
        @news = New.all
      else redirect_to root_path, notice: 'Новость не найдена'
      end
    else redirect_to root_path, notice: 'Новость не найдена'
    end
  end

  def news
    @news = New.all
    @page_config = {
        'title': 'Новости'
    }
  end

  def news_search
    if params[:query]
      @news = New.where('lower(title) like ?', "%#{params[:query]}%")
      @page_config = {
          'title': "Поиск по запросу \"#{params[:query]}\""
      }
      render 'news'
    else redirect_to news_path, notice: 'Ничего не найдено'
    end
  end

  def parts
    @a_parts = Part.all.limit(10).order(id: :desc)
    @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
    @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
    @models = @models.count == 0 ? Model.where(id: 1) : @models
    @volumes = Volume.all.order(id: :asc)
    @fuels = Fuel.all.order(id: :asc)
    @carcasses = Carcass.all.order(id: :asc)
    @colors = Color.all.order(id: :asc)
    @page_config = {
        'title': 'Новые запчасти'
    }
  end

  def search
    if not params[:query]
      redirect_to parts_path
    else
      @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
      @a_parts = Part.where("lower(title) like ?", "%#{params[:query].downcase}%").order(id: :desc)
      @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
      @models = @models.count == 0 ? Model.where(id: 1) : @models
      @volumes = Volume.all.order(id: :asc)
      @fuels = Fuel.all.order(id: :asc)
      @carcasses = Carcass.all.order(id: :asc)
      @colors = Color.all.order(id: :asc)
      @page_config = {
          'title': "Поиск по запросу \"#{params[:query]}\""
      }
      render 'parts'
    end
  end

  def advanced_search
    @a_parts = Part.all
    @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
    @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
    @models = @models.count == 0 ? Model.where(id: 1) : @models
    @volumes = Volume.all.order(id: :asc)
    @fuels = Fuel.all.order(id: :asc)
    @carcasses = Carcass.all.order(id: :asc)
    @colors = Color.all.order(id: :asc)
    @page_config = {
        'title': "Поиск по запросу \"#{params[:query]}\""
    }
    if Integer(params[:manufacturer]) > 1
      @a_parts = @a_parts.where(manufacturer_id: params[:manufacturer])
    end
    if Integer(params[:model]) > 1
      @a_parts = @a_parts.where(model_id: params[:model])
    end
    if Integer(params[:carcass]) > 1
      @a_parts = @a_parts.where(carcass_id: params[:carcass])
    end
    if Integer(params[:color]) > 1
      @a_parts = @a_parts.where(color_id: params[:color])
    end
    if Integer(params[:fuel]) > 1
      @a_parts = @a_parts.where(fuel_id: params[:fuel])
    end
    volume_from = params[:volume_from]
    volume_to = Volume.where.not(id: 1).maximum(:name)
    if params[:volume_from] != ""
      if params[:volume_to] != ""
        volume_to = params[:volume_to]
      end
      volumes = Volume.where(name: Float(volume_from)..Float(volume_to)).where.not(id: 1)
      ids = []
      volumes.each do |volume|
        ids.push volume.id
      end
      @a_parts = @a_parts.where(volume_id: ids)
    end
    year_from = params[:year_from]
    year_to = Date.today.year.to_s
    if params[:year_from] != ""
      if params[:year_to] != ""
        year_to = params[:year_to]
      end
      @a_parts = @a_parts.where(year: Integer(year_from)..Integer(year_to))
    end
    cost_from = params[:cost_from]
    cost_to = Part.maximum(:cost)
    if params[:cost_from] != ""
      if params[:cost_to] != ""
        cost_to = params[:cost_to]
      end
      @a_parts = @a_parts.where(cost: Integer(cost_from)..Integer(cost_to))
    end
    @filter = {
      'manufacturer': Manufacturer.find_by(id: params[:manufacturer]).name,
      'model': Model.find_by(id: params[:model]).name,
      'carcass': Carcass.find_by(id: params[:carcass]).name,
      'color': Color.find_by(id: params[:color]).name,
      'fuel': Fuel.find_by(id: params[:fuel]).name,
      'volume': volume_from.to_s + '..' + volume_to.to_s,
      'year': year_from.to_s + '..' + year_to.to_s,
      'cost': cost_from.to_s + '..' + cost_to.to_s
    }
    @a_parts = @a_parts.order(id: :desc)
    render 'parts'
  end

  def part
    if @part = Part.find_by(id: params[:id])
      @title = @part.title
    else render status: 404
    end
  end

end