class AppController < ApplicationController


  def texts_change
    if params[:array] and admin
      array = params[:array]
      array += params[:format] if params[:format]
      s = JSON.parse array
      if @s = Text.find_by(id: s['id'])
        @s.content = s['content']
        @s.save
        render body: 'success'
      else
        render body: 'error'
      end
    else redirect_back fallback_location: root_path
    end
  end

  def home
    @title = "Контрактные двигатели, АКПП, МКПП, кузовные запчасти для иномарок из Европы и Америки"
    @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
    @manufacturers = Manufacturer.where.not(id: 1).select(:id, :name, :image).order(name: :asc)
    @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
    @models = @models.count == 0 ? Model.where(id: 1) : @models
    @fuels = Fuel.all.order(id: :asc)
    @carcasses = Carcass.all.order(id: :asc)
    @categories = Category.all.order(id: :asc)
    @colors = Color.all.order(id: :asc)
  end

  def warranties
    @title = "Продажа бу запчастей. Гарантийные условия"
    @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
  end

  def contacts
    @title = "Ищете, где купить контрактный двигатель, АКПП, МКПП? Звоните нам!"
    @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
  end

  def payment_shipping
    @title = "Продажа б/у запчастей. Доставка по России, Казахстану!"
    @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
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
        @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
        @title = @new.title
      else redirect_to root_path, notice: 'Новость не найдена'
      end
    else redirect_to root_path, notice: 'Новость не найдена'
    end
  end



  def news
    @title = "Бу запчасти с доставкой в регионы"
    @news = New.order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC").paginate(page: params[:page], per_page: 15)
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

  def sitemap
    respond_to do |format|
      format.xml { render file: 'public/sitemaps/sitemap.xml' }
      format.html { redirect_to root_url }
    end
  end

  def robots
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
      @a_parts = Part.where("lower(title) like ? or lower(description) like ? or lower(tags) like ? or lower(mark) like ?  or lower(constr_num) like ?", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%").paginate(page: params[:page], per_page: 10).order(id: :desc)
      @a_news = New.where("lower(title) like ? or lower(content) like ?", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%").order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC").paginate(page: params[:page], per_page: 10)
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
    if params[:category]
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
      if params[:category] and params[:category].to_i > 0
        sub = Category.find_by(id: params[:category])
        if sub.name == "ДВС"
          @a_parts = @a_parts.where("lower(title) like ? OR lower(description) like ?  AND category_id = NULL OR lower(title) like ? OR lower(description) like ? AND category_id = NULL", "%#{sub.name.downcase}%", "%#{sub.name.downcase}%", "%двигател%", "%двигател%")
        else
          @a_parts = @a_parts.where("lower(title) like ? OR lower(description) like ?", "%#{sub.name.downcase}%", "%#{sub.name.downcase}%")
        end
      end
      if params[:manufacturer] and  params[:manufacturer].to_i > 1
        @a_parts = @a_parts.where(manufacturer_id: params[:manufacturer])
        @models = Model.where(manufacturer_id: params[:manufacturer]).order(id: :asc)
      end
      if params[:model]
        model = Model.find_by(id: params[:model])
        if model
          mname = model.name.split()
          mstr = ""
          mstr2 = ""
          if mname.length > 1
            mname.each do |m|
              if m['(']
                mstr += m.gsub(/[()]/, "") + " "
                mstr2 += Translit.convert(m.gsub(/[()]/, ""), :russian) + " "
              else
                mstr += m + " "
                mstr2 += Translit.convert(m, :russian) + " "
              end
            end
          else
            mstr = mname[0]
            mstr2 = Translit.convert(mname[0], :russian)
          end
          mstr = mstr.rstrip
          mstr2 = mstr2.rstrip
          @a_parts = @a_parts.where("lower(title) like ? or lower(description) like ? or lower(tags) like ? or lower(title) like ? or lower(description) like ? or lower(tags) like ? or lower(title) like ? or lower(description) like ? or lower(tags) like ? or model_id = ?", "%"+model.name.downcase+"%", "%"+model.name.downcase+"%", "%"+model.name.downcase+"%", "%"+mstr.downcase+"%", "%"+mstr.downcase+"%", "%"+mstr.downcase+"%", "%"+mstr2.downcase+"%", "%"+mstr2.downcase+"%", "%"+mstr2.downcase+"%", model.id)
        end
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
      if params[:volume] and params[:volume] != "no"
        @v = Volume.find_by(name: params[:volume]) ? Volume.find_by(name: params[:volume]).id : 0
        @a_parts = @a_parts.where('volume_id=? or lower(title) like ?', @v, "%#{@v}%")
      end
      if params[:year]
        @a_parts = @a_parts.where('year like ?' , "%#{params[:year]}%")
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
      @sd = Manufacturer.find_by(id: params[:manufacturer])
      if @sd
        @filter[:manufacturer] = Manufacturer.find_by(id: params[:manufacturer]).name if params[:manufacturer]
      else
        @filter[:manufacturer] = "Не задано"
      end
      @m = Model.find_by(id: params[:model])
      if @m
        @filter[:model] =  Model.find_by(id: params[:model]).name if params[:model]
      else
        @filter[:model] = "Не задано"
      end
      @filter[:carcass] = Carcass.find_by(id: params[:carcass]).name if params[:carcass]
      @filter[:color] = Color.find_by(id: params[:color]).name if params[:color]
      @filter[:fuel] = Fuel.find_by(id: params[:fuel]).name if params[:fuel]
      @filter[:volume_from] = volume_from.to_s + '..' + volume_to.to_s if params[:volume_from]
      @filter[:year] = params[:year].to_s
      @filter[:cost_from] = cost_from.to_s + '..' + cost_to.to_s if params[:cost_from]
      @a_parts = @a_parts.order(id: :desc)
      render 'parts'
    else
      redirect_to root_path, notice: 'Заданы пустые параметры'
    end
  end

  def part
    if @part = Part.find_by(id: params[:id])
      @title = @part.title
    else render status: 404
    end
  end

  def buy
    if params[:partId]
      @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
      @title = "Купить комплектацию"
    else redirect_to root_path, notice: "Данная комплектация не найдена"
    end
  end

  def commentary_add
    if params[:text] and params[:newId]
      commentary = Commentary.new
      commentary.text = params[:text]
      commentary.name = params[:name]
      commentary.email = params[:email]
      commentary.new_id = params[:newId]
      commentary.status = 0
      if verify_recaptcha(commentary)
        commentary.save
        DefaultMailer.comment_email(commentary).deliver
        redirect_to new_path(params[:newId]), notice: "Ваш комментарий будет опубликован после модерации"
      else
        redirect_to new_path(params[:newId]), notice: "Заполните капчу!"
      end
    else redirect_back fallback_location: root_path
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
      if verify_recaptcha(commentary)
        commentary.save
        DefaultMailer.feedback_email(commentary).deliver
        redirect_to reviews_path, notice: "Ваше сообщение принято!"
      else
        redirect_to reviews_path, notice: "Заполните капчу!"
      end
    else redirect_back fallback_location: root_path
    end
  end

  def reviews
    @title = "Контрактные двигатели, МКПП, АКПП от ЕвроДеталь - отзывы"
    @news = Feedback.where(status: 1).order(id: :desc).paginate(page: params[:page], per_page: 15)
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
    @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
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
    if params[:privacy] == "on"
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
      if verify_recaptcha(commentary) and q.email.length > 4
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
      else
        redirect_to query_path, notice: 'Заполните все поля и капчу!'
      end
    else redirect_to query_path, notice: 'Вы должны дать согласие на обработку данных'
    end
  end

  def manufacturer
    if params[:name] && @manufacturer = Manufacturer.find_by(name: params[:name])
      @news = New.limit(5).order("ready_date IS NULL DESC,
         (CASE WHEN ready_date IS NULL THEN -id ELSE id END) ASC")
      @title = "Б/у запчасти для автомобилей " + @manufacturer.name
      @meta = {
          'description': @manufacturer.text,
          'keywords': @manufacturer.name
      }
    else redirect_to root_path, notice: 'Производитель не найден'
    end
  end

  def subcategories
    if params[:category]
      @a_parts = Part.paginate(page: params[:page], per_page: 10).order(id: :desc)
      @manufacturers = Manufacturer.where.not(id: 1).order(name: :asc)
      @models = Model.where(manufacturer_id: @manufacturers.take.id).order(id: :asc)
      @models = @models.count == 0 ? Model.where(id: 1) : @models
      @volumes = Volume.all.order(id: :asc)
      @fuels = Fuel.all.order(id: :asc)
      @carcasses = Carcass.all.order(id: :asc)
      @categories = Category.all.order(id: :asc)
      @subcategories = Subcategory.where("category_id = #{params[:category]} or id = 1")
      @colors = Color.all.order(id: :asc)
      @page_config = {
          'title': "Поиск по запросу \"#{params[:query]}\""
      }
      if params[:category] and params[:category].to_i > 0
        sub = Category.find_by(id: params[:category])
        if sub.name == "ДВС"
          @a_parts = @a_parts.where("lower(title) like ? OR (lower(description) like ?  AND category_id = NULL) OR lower(title) like ? OR (lower(description) like ? AND category_id = NULL) or category_id=?", "%#{sub.name.downcase}%", "%#{sub.name.downcase}%", "%двигател%", "%двигател%", sub.id)
        else
          @a_parts = @a_parts.where("lower(title) like ? OR lower(description) like ? or category_id = ?", "%#{sub.name.downcase}%", "%#{sub.name.downcase}%", sub.id)
        end
      end
      if params[:subcategory] and params[:subcategory].to_i > 1
        sub = Subcategory.find_by(id: params[:subcategory])
        @a_parts = @a_parts.where("lower(title) like ? OR lower(description) like ?", "%#{sub.name.downcase}%", "%#{sub.name.downcase}%") if sub
      end
      if params[:manufacturer] and params[:manufacturer].to_i > 1
        @a_parts = @a_parts.where(manufacturer_id: params[:manufacturer])
        @models = Model.where(manufacturer_id: params[:manufacturer]).order(id: :asc)
      end
      if params[:model]
        model = Model.find_by(id: params[:model])
        if model
          mname = model.name.split()
          mstr = ""
          mstr2 = ""
          if mname.length > 1
            mname.each do |m|
              if m['(']
                mstr += m.gsub(/[()]/, "") + " "
                mstr2 += Translit.convert(m.gsub(/[()]/, ""), :russian) + " "
              else
                mstr += m + " "
                mstr2 += Translit.convert(m, :russian) + " "
              end
            end
          else
            mstr = mname[0]
            mstr2 = Translit.convert(mname[0], :russian)
          end
          mstr = mstr.rstrip
          mstr2 = mstr2.rstrip
          @a_parts = @a_parts.where("lower(title) like ? or lower(description) like ? or lower(tags) like ? or lower(title) like ? or lower(description) like ? or lower(tags) like ? or lower(title) like ? or lower(description) like ? or lower(tags) like ? or model_id = ?", "%"+model.name.downcase+"%", "%"+model.name.downcase+"%", "%"+model.name.downcase+"%", "%"+mstr.downcase+"%", "%"+mstr.downcase+"%", "%"+mstr.downcase+"%", "%"+mstr2.downcase+"%", "%"+mstr2.downcase+"%", "%"+mstr2.downcase+"%", model.id)
        end
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
      if params[:year]
        @a_parts = @a_parts.where('year like ?' , "%#{params[:year]}%")
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
      @filter = {'category': Category.find_by(id: params[:category]).name} if Category.find_by(id: params[:category])
      if params[:subcategory] and Subcategory.find_by(id: params[:subcategory])
        @filter = {'subcategory': Subcategory.find_by(id: params[:subcategory]).name}
      end
      @sd = Manufacturer.find_by(id: params[:manufacturer])
      if @sd
        @filter[:manufacturer] = Manufacturer.find_by(id: params[:manufacturer]).name if params[:manufacturer]
      else
        @filter[:manufacturer] = "Не задано"
      end
      @m = Model.find_by(id: params[:model])
      if @m
        @filter[:model] =  Model.find_by(id: params[:model]).name if params[:model]
      else
        @filter[:model] = "Не задано"
      end
      @filter[:carcass] = Carcass.find_by(id: params[:carcass]).name if params[:carcass]
      @filter[:color] = Color.find_by(id: params[:color]).name if params[:color]
      @filter[:fuel] = Fuel.find_by(id: params[:fuel]).name if params[:fuel]
      @filter[:volume_from] = volume_from.to_s + '..' + volume_to.to_s if params[:volume_from]
      @filter[:year] = params[:year].to_s
      @filter[:cost_from] = cost_from.to_s + '..' + cost_to.to_s if params[:cost_from]
      @a_parts = @a_parts.order(id: :desc)
      render 'parts'
    else
      redirect_to root_path
    end
  end



  def modelparser
    require 'open-uri'

    url = 'https://motorlandby.ru/'
    html = open(url)
    require 'nokogiri'
    doc = Nokogiri::HTML(html)
    doc.css('.brands-logo li a').each do |li|
      urls = li['href']
      htmls = open(urls)
      docs = Nokogiri::HTML(htmls)
      docs.css('.bl .bl-row2')[1].css('.accordion-inner a').each do |model|
        @p = Model.new
        @m = Manufacturer.where('lower(name) like ? ', li.children[0]['title'].downcase).take
        if @m
          @p.manufacturer_id = @m.id
          @p.name = model.inner_html
          @p.save
        end
      end
    end
  end

  def parseimg
    require 'open-uri'
    require 'cgi'
    require "down"

    @p = Part.where('image like ?', "%http%").order(id: :asc)
    partimages = ""
    @p.each do |part|
      image = part.image.split(',')
      images = ""
      image.each do |img|
        if img.split('http').length > 0
          img = img.split()[0]
          begin
            download = Down.download(URI.parse(CGI.escape(img).gsub("%3A", ":").gsub("%2F", "/")))
            imagehex = Digest::SHA256.hexdigest download.original_filename
            imagehex = imagehex.slice(0, 10)
            imagehex2 = Digest::SHA256.hexdigest rand(0..100).to_s
            imagehex2 = imagehex2.slice(0, 10)
            imagehex = imagehex2 + imagehex
            File.open(Rails.root.join('public', 'images', imagehex +  download.original_filename), 'wb') do |file|
              file.write(download.read)
              images += imagehex +  download.original_filename
              if img != image.last
                images += ","
              end
            end
          rescue
            nil
          end
        end
      end
      if images.length > 2
        part.image = images
        part.save
      end
    end
    render body: partimages
  end

  def parsernews
    require 'open-uri'
    links = ""
    counter = 0
    (0..53).each do |page|
      url = "https://xn----8sbejcd7btry6i.xn--p1ai/news/p/#{page}"
      html = open(url)
      require 'nokogiri'
      doc = Nokogiri::HTML(html)
      doc.css('td.content-part div').each do |li|
        if li.xpath('./img').length > 0
          urls = li.xpath('./b/a')[0]['href']
          titles = li.xpath('./b/a').text
          img = li.xpath('./img')[0]['src']
          paragraph = ""
          dates = ""
          links += titles + "\n"
          images = ""
          begin
            new = open("https://xn----8sbejcd7btry6i.xn--p1ai" + urls)
            new_page = Nokogiri::HTML(new)
            image = ""
            new_page.css('td.content-part div').each do |div|
              if div.xpath('./img').length > 0
                dates = div.xpath('./text()').text
                if div.xpath('./p').length > 0
                  div.xpath('./p').each{|aas| paragraph += aas.text + "\n" }
                end
                dates = dates.split()[0] + " " +dates.split()[1]
                links += dates + "\n" + paragraph + "\n"
                div.css('td img').select{|img| img['src'] != nil}.each do |img|
                  if img['src'].split('http').length > 1
                    image += img['src'] + ','
                  else
                    image += "https://xn----8sbejcd7btry6i.xn--p1ai" + img['src'] + ','
                  end
                end
                image.split(',').each do |img|
                  if img.split('http').length > 1
                    img = img.split()[0]
                    begin
                      if download = Down.download(URI.parse(CGI.escape(img).gsub("%3A", ":").gsub("%2F", "/")))
                        imagehex = Digest::SHA256.hexdigest download.original_filename
                        imagehex = imagehex.slice(0, 10)
                        imagehex2 = Digest::SHA256.hexdigest rand(0..100).to_s
                        imagehex2 = imagehex2.slice(0, 10)
                        imagehex = imagehex2 + imagehex
                        File.open(Rails.root.join('public', 'news', imagehex +  download.original_filename), 'wb') do |file|
                          file.write(download.read)
                          images += imagehex +  download.original_filename
                          if img != image.last
                            images += ","
                          end
                        end
                      end
                    rescue
                      nil
                    end
                  end
                end
              end
            end
          rescue OpenURI::HTTPError
            nil
          end
          @n = New.new
          @n.title = titles
          @n.content = paragraph
          @n.ready_date = dates
          @n.save
          images.split(',').each do |sad|
            @a = Attachment.new
            @a.new_id = @n.id
            @a.image = sad
            @a.save
          end
          counter += 1
        end
      end
    end
    render body: counter.to_s + "\n" + links
  end

  def reviewsparser
    require 'open-uri'
    links = ""
    counter = 0
    (0..2).reverse_each do |page|
      url = "https://xn----8sbejcd7btry6i.xn--p1ai/voprosy_i_otvety/p/#{page}"
      html = open(url)
      require 'nokogiri'
      doc = Nokogiri::HTML(html)
      doc.css("td.content-part div:not(.ticker):not(.site-path):not(.ticker-wrap)").reverse_each do |li|
        if li.text['201']
          @f = Feedback.new
          @f.name = li.xpath('./b').text
          @f.ready_date = li.xpath('./text()').text.split(':')[0] + ":" + li.xpath('./text()').text.split(':')[1].slice(0..1)
          @f.text =  li.xpath('./text()').text.split(':')[1].slice(2..-1)
          @f.reply = li.xpath('./div').text.split('Ответ:')[1]
          @f.status = 1
          @f.save
        end
      end
    end
    render body: counter.to_s + "\n" + links
  end


  def texts
    if admin
    else redirect_to root_path
    end
  end

  def texts_new
    if admin and params[:action] and params[:counter] and params[:content]
      @s = Text.new
      @s.action = params[:actions]
      @s.counter = params[:counter]
      @s.content = params[:content]
      @s.save
      redirect_to '/texts', notice: 'Added'
    else redirect_to root_path
    end
  end

end
