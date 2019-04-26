class AppController < ApplicationController

  def home
    @title = "Контрактные двигатели, АКПП, МКПП, кузовные запчасти для иномарок из Европы и Америки"
    @news = New.all
    @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
    @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
    @models = @models.count == 0 ? Model.where(id: 1) : @models
    @volumes = Volume.all.order(id: :asc)
    @fuels = Fuel.all.order(id: :asc)
    @carcasses = Carcass.all.order(id: :asc)
    @categories = Category.all.order(id: :asc)
    @colors = Color.all.order(id: :asc)
  end

  def warranties
    @title = "Продажа бу запчастей. Гарантийные условия"
    @news = New.all
  end

  def contacts
    @title = "Ищете, где купить контрактный двигатель, АКПП, МКПП? Звоните нам!"
    @news = New.all
  end

  def payment_shipping
    @title = "Продажа б/у запчастей. Доставка по России, Казахстану!"
    @news = New.all
    @cities = City.all
    render 'payment-shipping'
  end

  def register
    @countries = Country.where.not(id: 1)
  end

  def login; end

  def new
    if params[:id]
      @new = New.find_by(id: params[:id])
      if @new
        @commentaries = Commentary.where(new_id: @new.id, status: 1)
        @news = New.all
        @title = @new.title
      else redirect_to root_path, notice: 'Новость не найдена'
      end
    else redirect_to root_path, notice: 'Новость не найдена'
    end
  end

  def news
    @title = "Бу запчасти с доставкой в регионы"
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
    @title = "Ищете, где купить б.у запчасти? Каталог с ценами здесь!"
    @a_parts = Part.paginate(page: params[:page], per_page: 10).order(id: :desc)
    @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
    @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
    @models = @models.count == 0 ? Model.where(id: 1) : @models
    @volumes = Volume.all.order(id: :asc)
    @fuels = Fuel.all.order(id: :asc)
    @categories = Category.all.order(id: :asc)
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
      @categories = Category.all.order(id: :asc)
      @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
      @a_parts = Part.where("lower(title) like ?", "%#{params[:query].downcase}%").paginate(page: params[:page], per_page: 10).order(id: :desc).order(id: :desc)
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
    @a_parts = Part.paginate(page: params[:page], per_page: 10).order(id: :desc)
    @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
    @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
    @models = @models.count == 0 ? Model.where(id: 1) : @models
    @volumes = Volume.all.order(id: :asc)
    @fuels = Fuel.all.order(id: :asc)
    @carcasses = Carcass.all.order(id: :asc)
    @categories = Category.all.order(id: :asc)
    @colors = Color.all.order(id: :asc)
    @page_config = {
        'title': "Поиск по запросу \"#{params[:query]}\""
    }
    if params[:category] and Integer(params[:category]) > 0
      @a_parts = @a_parts.where(category_id: params[:category])
    end
    if params[:manufacturer] and  Integer(params[:manufacturer]) > 1
      @a_parts = @a_parts.where(manufacturer_id: params[:manufacturer])
    end
    if params[:model]
      @a_parts = @a_parts.where("title like ?", "%"+params[:model]+"%")
    end
    if params[:carcass] and  Integer(params[:carcass]) > 1
      @a_parts = @a_parts.where(carcass_id: params[:carcass])
    end
    if params[:color] and  Integer(params[:color]) > 1
      @a_parts = @a_parts.where(color_id: params[:color])
    end
    if params[:fuel] and  Integer(params[:fuel]) > 1
      @a_parts = @a_parts.where(fuel_id: params[:fuel])
    end
    if params[:volume_from]
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
    end
    if params[:year_from]
      year_from = params[:year_from]
      year_to = Date.today.year.to_s
      if params[:year_from] != ""
        if params[:year_to] != ""
          year_to = params[:year_to]
        end
        @a_parts = @a_parts.where(year: Integer(year_from)..Integer(year_to))
      end
    end
    if params[:cost_from]
      cost_from = params[:cost_from]
      cost_to = Part.maximum(:cost)
      if params[:cost_from] != ""
        if params[:cost_to] != ""
          cost_to = params[:cost_to]
        end
        @a_parts = @a_parts.where(cost: Integer(cost_from)..Integer(cost_to))
      end
    end

    @filter = {'category': Category.find_by(id: params[:category]).name}
    @filter[:manufacturer] = Manufacturer.find_by(id: params[:manufacturer]).name if params[:manufacturer]
    @filter[:model] =  params[:model] if params[:model]
    @filter[:carcass] = Carcass.find_by(id: params[:carcass]).name if params[:carcass]
    @filter[:color] = Color.find_by(id: params[:color]).name if params[:color]
    @filter[:fuel] = Fuel.find_by(id: params[:fuel]).name if params[:fuel]
    @filter[:volume_from] = volume_from.to_s + '..' + volume_to.to_s if params[:volume_from]
    @filter[:year_from] = year_from.to_s + '..' + year_to.to_s if params[:year_from]
    @filter[:cost_from] = cost_from.to_s + '..' + cost_to.to_s if params[:cost_from]
    @a_parts = @a_parts.order(id: :desc)
    render 'parts'
  end

  def part
    if @part = Part.find_by(id: params[:id])
      @title = @part.title
    else render status: 404
    end
  end

  def buy
    if params[:partId]
      @news = New.all.limit(5).order(id: :desc)
      @title = "Купить комплектацию"
    else redirect_to root_path, notice: "Данная комплектация не найдена"
    end
  end

  def commentary_add
    if auth
      if params[:text] and params[:newId]
        commentary = Commentary.new
        commentary.text = params[:text]
        commentary.user_id = session[:auth]['id']
        commentary.new_id = params[:newId]
        commentary.status = 0
        commentary.save
        DefaultMailer.comment_email(commentary).deliver
        redirect_to new_path(params[:newId]), notice: "Ваш комментарий будет опубликован после модерации"
      else redirect_back fallback_location: root_path
      end
    else redirect_to login_path, notice: 'Авторизуйтесь чтобы оставить комментарий'
    end
  end

  def commentary_delete
    if auth
      if params[:id]
        commentary = Commentary.find_by(id: params[:id])
        if commentary.user_id == session[:auth]['id'] or admin
          commentary.destroy
          redirect_back fallback_location: root_path
        else redirect_back fallback_location: root_path
        end
      else redirect_back fallback_location: root_path
      end
    else redirect_to login_path, notice: 'Авторизуйтесь чтобы оставить комментарий'
    end
  end

  def review_add
    if params[:text] && params[:email] && params[:name]
      commentary = Feedback.new
      commentary.text = params[:text]
      commentary.email = params[:email]
      commentary.name = params[:name]
      commentary.save
      DefaultMailer.feedback_email(commentary).deliver
      redirect_to reviews_path, notice: "Ваше сообщение принято!"
    else redirect_back fallback_location: root_path
    end
  end

  def reviews
    @title = "Контрактные двигатели, МКПП, АКПП от ЕвроДеталь - отзывы"
    @news = Feedback.where(status: 1).order(id: :desc)
    @page_config = {
        'title': 'Отзывы'
    }
    render 'reviews'
  end

  def reviews_search
    @title = "Отзывы"
    @news = Feedback.where('lower(text) like ? and status = 1', "%#{params[:query]}%").order(id: :desc)
    @page_config = {
        'title': "Поиск отзывов по запросу \"#{params[:query]}\""
    }
    render 'reviews'
  end

  def query
    @title = "Контрактные двигатели, АКПП, МКПП, кузовные запчасти для иномарок из Европы и Америки"
    @news = New.all
    @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
    @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
    @models = @models.count == 0 ? Model.where(id: 1) : @models
    @volumes = Volume.all.order(id: :asc)
    @fuels = Fuel.all.order(id: :asc)
    @carcasses = Carcass.all.order(id: :asc)
    @categories = Category.all.order(id: :asc)
    @colors = Color.all.order(id: :asc)
  end

  def query_add
    @q = Query.new
    @q.manufacturer_id = params[:manufacturer]
    @q.model = params[:model]
    @q.year = params[:year]
    @q.carcass_id = params[:carcass]
    @q.fuel_id = params[:fuel]
    @q.volume = params[:volume]
    @q.power = params[:power]
    @q.engine = params[:engine]
    @q.changer = params[:changer]
    @q.privod = params[:privod]
    @q.kpp = params[:kpp]
    @q.part = params[:part]
    @q.description = params[:description]
    @q.name = params[:name]
    @q.city = params[:city]
    @q.email = params[:email]
    @q.phone = params[:phone]
    @q.save
    if params[:images]
      params[:images].each do |image|
        imagehex = Digest::SHA256.hexdigest image.original_filename
        imagehex = imagehex.slice(0, 10)
        imagehex2 = Digest::SHA256.hexdigest rand(0..100).to_s
        imagehex2 = imagehex2.slice(0, 10)
        imagehex = imagehex2 + imagehex
        File.open(Rails.root.join('public', 'images', imagehex + image.original_filename), 'wb') do |file|
          file.write(image.read)
          @image = QueryImage.new
          @image.query_id = @q.id
          @image.image = imagehex + image.original_filename
          @image.save
        end
      end
    end
    DefaultMailer.query_email(@q).deliver
    redirect_to query_path, notice: 'Ваш запрос принят! Мы скоро с вами свяжемся!'
  end

  def manufacturer
    if params[:name] && @manufacturer = Manufacturer.find_by(name: params[:name])
      @news = New.limit(5)
    else redirect_to root_path, notice: 'Производитель не найден'
    end
  end

end
