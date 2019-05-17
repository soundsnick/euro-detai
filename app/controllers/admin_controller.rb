class AdminController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'admin'
  require 'net/http'
  require 'open-uri'


  def main
    if admin
      @parts = Part.all.order(id: :asc).limit(10)
      @count = Part.count
    else admin_err
    end
  end

  def parts
    if admin
      @parts = Part.paginate(page: params[:page]).order(id: :desc).order(id: :asc)
      @count = @parts.count
    else admin_err
    end
  end

  def commentaries
    if admin
      @parts = Commentary.where.not(status: 1).order(id: :asc)
      @commentaries = Commentary.where(status: 1).order(id: :asc)
      @count = @parts.count
    else admin_err
    end
  end

  def queries
    if admin
      @parts = Query.all.order(id: :asc)
    else admin_err
    end
  end

  def query
    if admin
      if params[:id] and @new = Query.find_by(id: params[:id])

      else redirect_to admin_path, notice: 'Не найдено'
      end
    else admin_err
    end
  end

  def query_delete
    if admin
      if params[:id]
        model = Query.find_by(id: params[:id])
        if model
          @images = QueryImage.where(query_id: params[:id]).each do |part|
            File.delete(Rails.root.join('public', 'images', part.image)) if File.exist?(Rails.root.join('public', 'images', part.image))
            part.destroy
          end
          model.destroy
          render json: construct_response(410, 'success')
        else render json: construct_response(404, 'not_found: model')
        end
      else render json: construct_response(204, 'empty: id')
      end
    else admin_err
    end
  end

  def orders
    if admin
      @parts = Order.all.order(id: :asc)
      @count = @parts.count
    else admin_err
    end
  end

  def reviews
    if admin
      @parts = Feedback.where(status: nil).order(id: :asc)
      @commentaries = Feedback.where(status: 1).order(id: :asc)
      @count = @parts.count
    else admin_err
    end
  end

  def review_delete
    if auth
      if params[:id]
        commentary = Feedback.find_by(id: params[:id])
        if admin
          commentary.destroy
          render json: construct_response(410, 'success')
        else redirect_back fallback_location: root_path
        end
      else redirect_back fallback_location: root_path
      end
    else redirect_to login_path, notice: 'Авторизуйтесь чтобы оставить комментарий'
    end
  end

  def commentary_delete
    if auth
      if params[:id]
        commentary = Commentary.find_by(id: params[:id])
        if admin
          commentary.destroy
          render json: construct_response(410, 'success')
        else redirect_back fallback_location: root_path
        end
      else redirect_back fallback_location: root_path
      end
    else redirect_to login_path, notice: 'Авторизуйтесь чтобы оставить комментарий'
    end
  end

  def order_delete
    if auth
      if params[:id]
        commentary = Order.find_by(id: params[:id])
        if admin
          commentary.destroy
          render json: construct_response(410, 'success')
        else redirect_back fallback_location: root_path
        end
      else redirect_back fallback_location: root_path
      end
    else redirect_to login_path, notice: 'Авторизуйтесь чтобы оставить комментарий'
    end
  end

  def commentary_publish
    if auth
      if params[:id]
        commentary = Commentary.find_by(id: params[:id])
        if admin
          commentary.status = 1
          commentary.save
          render json: construct_response(200, 'success')
        else redirect_back fallback_location: root_path
        end
      else redirect_back fallback_location: root_path
      end
    else redirect_to login_path, notice: 'Авторизуйтесь чтобы оставить комментарий'
    end
  end

  def review_publish
    if auth
      if params[:id]
        commentary = Feedback.find_by(id: params[:id])
        if admin
          commentary.status = 1
          commentary.save
          render json: construct_response(200, 'success')
        else redirect_back fallback_location: root_path
        end
      else redirect_back fallback_location: root_path
      end
    else redirect_to login_path, notice: 'Авторизуйтесь чтобы оставить комментарий'
    end
  end

  def manufacturers
    if admin
      @page_config = {
          'title': 'Производители',
          'model': Manufacturer,
          'objects': Manufacturer.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/manufacturer.change?manufacturer_id',
          'delete_url': '/api/manufacturer.delete?manufacturer_id'
      }
      render 'options'
    else admin_err
    end
  end

  def news
    if admin
      @news = New.order(id: :desc).paginate(page: params[:page], per_page: 10)
    else admin_err
    end
  end

  def models
    if admin
      @manufacturers = Manufacturer.all.order(id: :asc)
      @page_config = {
          'title': 'Модели',
          'model': Model,
          'objects': Model.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/model.change?model_id',
          'delete_url': '/api/model.delete?model_id'
      }
      render 'options'
    else admin_err
    end
  end

  def subcategories
    if admin
      @categories = Category.all.order(id: :asc)
      @page_config = {
          'title': 'Подкатегории',
          'model': Subcategory,
          'objects': Subcategory.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/subcategory.change?subcategory_id',
          'delete_url': '/api/subcategory.delete?subcategory_id'
      }
      render 'options'
    else admin_err
    end
  end

  def carcasses
    if admin
      @page_config = {
          'title': 'Кузовы',
          'model': Carcass,
          'objects': Carcass.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/carcass.change?carcass_id',
          'delete_url': '/api/carcass.delete?carcass_id'
      }
      render 'options'
    else admin_err
    end
  end

  def fuels
    if admin
      @page_config = {
          'title': 'Типы топлива',
          'model': Fuel,
          'objects': Fuel.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/fuel.change?fuel_id',
          'delete_url': '/api/fuel.delete?fuel_id'
      }
      render 'options'
    else admin_err
    end
  end

  def categories
    if admin
      @page_config = {
          'title': 'Категории',
          'model': Category,
          'objects': Category.where.not(id: 0).order(id: :asc),
          'edit_url': '/api/category.change?category_id',
          'delete_url': '/api/category.delete?category_id'
      }
      render 'options'
    else admin_err
    end
  end

  def category_new
    if admin
      if params[:name]
        manufacturer = Category.new
        manufacturer.name = params[:name]
        if manufacturer.save
          redirect_to acategories_path, notice: 'Успешно добавлено'
        else redirect_to acategories_path, notice: 'Произошла ошибка'
        end
      else redirect_to acategories_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def volumes
    if admin
      @page_config = {
          'title': 'Объемы двигателя',
          'model': Volume,
          'objects': Volume.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/volume.change?volume_id',
          'delete_url': '/api/volume.delete?volume_id'
      }
      render 'options'
    else admin_err
    end
  end

  def colors
    if admin
      @page_config = {
          'title': 'Цвета',
          'model': Color,
          'objects': Color.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/color.change?color_id',
          'delete_url': '/api/color.delete?color_id'
      }
      render 'options'
    else admin_err
    end
  end

  def manufacturer_add
    if admin
      if params[:name]
        manufacturer = Manufacturer.new
        manufacturer.name = params[:name]
        if manufacturer.save
          redirect_to amanufacturers_path, notice: 'Успешно добавлено'
        else redirect_to amanufacturers_path, notice: 'Произошла ошибка'
        end
      else redirect_to amanufacturers_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def model_add
    if admin
      if params[:name]
        model = Model.new
        model.name = params[:name]
        model.manufacturer_id = params[:manufacturer]
        if model.save
          redirect_to amodels_path, notice: 'Успешно добавлено'
        else redirect_to amodel_path, notice: 'Произошла ошибка'
        end
      else redirect_to amodels_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def subcategory_add
    if admin
      if params[:name]
        model = Subcategory.new
        model.name = params[:name]
        model.category_id = params[:category]
        if model.save
          redirect_to asubcategories_path, notice: 'Успешно добавлено'
        else redirect_to asubcategories_path, notice: 'Произошла ошибка'
        end
      else redirect_to asubcategories_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def carcass_add
    if admin
      if params[:name]
        carcass = Carcass.new
        carcass.name = params[:name]
        if carcass.save
          redirect_to acarcasses_path, notice: 'Успешно добавлено'
        else redirect_to acarcass_path, notice: 'Произошла ошибка'
        end
      else redirect_to acarcass_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def fuel_add
    if admin
      if params[:name]
        fuel = Fuel.new
        fuel.name = params[:name]
        if fuel.save
          redirect_to afuels_path, notice: 'Успешно добавлено'
        else redirect_to afuels_path, notice: 'Произошла ошибка'
        end
      else redirect_to afuels_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def volumes_add
    if admin
      if params[:name]
        volume = Volume.new
        volume.name = params[:name]
        if volume.save
          redirect_to avolumes_path, notice: 'Успешно добавлено'
        else redirect_to avolumes_path, notice: 'Произошла ошибка'
        end
      else redirect_to avolume_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def colors_add
    if admin
      if params[:name]
        color = Color.new
        color.name = params[:name]
        color.hex = params[:color]
        if color.save
          redirect_to acolors_path, notice: 'Успешно добавлено'
        else redirect_to acolors_path, notice: 'Произошла ошибка'
        end
      else redirect_to acolors_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def countries_add
    if admin
      if params[:name]
        country = Country.new
        country.name = params[:name]
        if country.save
          redirect_to acountries_path, notice: 'Успешно добавлено'
        else redirect_to acountries_path, notice: 'Произошла ошибка'
        end
      else redirect_to acountries_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def roles_add
    if admin
      if params[:name]
        roles = Role.new
        roles.name = params[:name]
        if roles.save
          redirect_to aroles_path, notice: 'Успешно добавлено'
        else redirect_to aroles_path, notice: 'Произошла ошибка'
        end
      else redirect_to aroles_path, notice: 'Введите название'
      end
    else admin_err
    end
  end

  def part_add
    if admin
      @options = Manufacturer.all.order(id: :asc)
      @models = Model.where(manufacturer_id: @options.take.id).order(id: :asc)
      @volumes = Volume.all.order(name: :asc)
      @categories = Category.all.order(id: :asc)
      @fuels = Fuel.all.order(id: :asc)
      @carcasses = Carcass.all.order(id: :asc)
      @colors = Color.all.order(id: :asc)
    else admin_err
    end
  end

  def part_edit
    if admin && params[:part_id]
      @part = Part.find_by(id: params[:part_id])
      if @part
        @options = Manufacturer.all.order(id: :asc)
        @models = Model.where(manufacturer_id: @part.manufacturer_id).order(id: :asc)
        @models = @models.count == 0 ? Model.where(id: @part.model_id) : @models
        @volumes = Volume.all.order(id: :asc)
        @categories = Category.all.order(id: :asc)
        @fuels = Fuel.all.order(id: :asc)
        @carcasses = Carcass.all.order(id: :asc)
        @colors = Color.all.order(id: :asc)
      else redirect_to aparts_path, notice: 'Не найдено'
      end
    else admin_err
    end
  end

  def part_update
    if admin && params[:part_id]
      @part = Part.find_by(id: params[:part_id])
      if @part
        @part.title = params[:title]
        @part.manufacturer_id = params[:manufacturer]
        @part.model_id = params[:model]
        @part.year = params[:year]
        @part.volume_id = params[:volume]
        @part.fuel_id = params[:fuel]
        @part.carcass_id = params[:carcass]
        @part.color_id = params[:color]
        @part.category_id = params[:category]
        @part.mark = params[:mark]
        @part.description = params[:description]
        @part.meta_description = params[:meta_description]
        @part.meta_keywords = params[:meta_keywords]
        @part.options = params[:options]
        @part.cost = params[:cost]
        if params[:image]
          if @part.image
            File.delete(Rails.root.join('public', 'images', @part.image)) if File.exist?(Rails.root.join('public', 'images', @part.image))
          end
          image = params[:image]
          imagehex = Digest::SHA256.hexdigest image.original_filename
          imagehex = imagehex.slice(0, 10)
          File.open(Rails.root.join('public', 'images', imagehex + image.original_filename), 'wb') do |file|
            file.write(image.read)
            @part.image = imagehex + image.original_filename
          end
        end
        if @part.save
          redirect_to aparts_path, notice: 'Успешно добавлено'
        else
          redirect_to aparts_path, notice: 'Произошла ошибка'
        end
      else redirect_to aparts_path, notice: 'Не найдено'
      end
    else admin_err
    end
  end

  def new_add
    if admin

    else admin_err
    end
  end

  def news_new
    if admin
      if params[:title] and params[:content]
        @new = New.new
        @new.title = params[:title]
        @new.content = params[:content]
        @new.save
        if params[:images]
          params[:images].each do |image|
            imagehex = Digest::SHA256.hexdigest image.original_filename
            imagehex = imagehex.slice(0, 10)
            imagehex2 = Digest::SHA256.hexdigest rand(0..100).to_s
            imagehex2 = imagehex2.slice(0, 10)
            imagehex = imagehex2 + imagehex
            File.open(Rails.root.join('public', 'news', imagehex + image.original_filename), 'wb') do |file|
              file.write(image.read)
              @image = Attachment.new
              @image.new_id = @new.id
              @image.image = imagehex + image.original_filename
              @image.save
            end
          end
        end
        redirect_to anews_path, notice: 'Успешно добавлено!'
      else
        redirect_to newadd_path, notice: 'Заполните все поля'
      end
    else admin_err
    end
  end

  def announcement
    if admin
      @announcement = Announcement.take
      @news = New.limit(10)
    else admin_err
    end
  end

  def announcement_change
    if admin
      if params[:title] && params[:new_id]
        if Announcement.all.count > 0
          @an = Announcement.take
          @an.title = params[:title]
          if @new = New.find_by(id: params[:new_id])
            @an.new_id = params[:new_id]
            @an.save
            redirect_to aannouncements_path, notice: 'Сохранено'
          else redirect_to aannouncements_path, notice: 'Такая новость не найдена'
          end
        else
          @an = Announcement.new
          @an.title = params[:title]
          if @new = New.find_by(id: params[:new_id])
            @an.new_id = params[:new_id]
            @an.save
            redirect_to aannouncements_path, notice: 'Сохранено'
          else redirect_to aannouncements_path, notice: 'Такая новость не найдена'
          end
        end
      else redirect_to aannouncements_path, notice: 'Заполните все поля'
      end
    else admin_err
    end
  end

  def part_new
    if admin
      @part = Part.new
      @part.title = params[:title]
      @part.manufacturer_id = params[:manufacturer]
      @part.model_id = params[:model]
      @part.year = params[:year]
      @part.volume_id = params[:volume]
      @part.fuel_id = params[:fuel]
      @part.carcass_id = params[:carcass]
      @part.color_id = params[:color]
      @part.category_id = params[:category]
      @part.mark = params[:mark]
      @part.description = params[:description]
      @part.meta_description = params[:meta_description]
      @part.meta_keywords = params[:meta_keywords]
      @part.options = params[:options]
      @part.cost = params[:cost]
      if params[:image]
        image = params[:image]
        imagehex = Digest::SHA256.hexdigest image.original_filename
        imagehex = imagehex.slice(0, 10)
        imagehex2 = Digest::SHA256.hexdigest rand(0..100).to_s
        imagehex2 = imagehex2.slice(0, 10)
        imagehex = imagehex2 + imagehex
        File.open(Rails.root.join('public', 'images', imagehex + image.original_filename), 'wb') do |file|
          file.write(image.read)
          @part.image = imagehex + image.original_filename
        end
      end
      if @part.save
        redirect_to partadd_path, notice: 'Успешно добавлено'
      else
        redirect_to partadd_path, notice: 'Произошла ошибка'
      end
    else admin_err
    end
  end

  def users
    if admin
      @page_config = {
          'title': 'Пользователи',
          'objects': User.where.not(id: session[:auth]['id']).order(id: :asc),
          'toggleadmin_url': '/api/user.toggleAdmin?user_id',
          'delete_url': '/api/user.delete?user_id'
      }
    else admin_err
    end
  end

  def countries
    if admin
      @page_config = {
          'title': 'Страны',
          'model': Country,
          'objects': Country.where.not(id: 1).order(id: :asc),
          'edit_url': '/api/country.change?country_id',
          'delete_url': '/api/country.delete?country_id'
      }
      render 'options'
    else admin_err
    end
  end

  def roles
    if admin
      @page_config = {
          'title': 'Привилегии',
          'model': Role,
          'objects': Role.all.order(id: :asc),
          'edit_url': '/api/role.change?role_id',
          'delete_url': '/api/role.delete?role_id'
      }
      render 'options'
    else admin_err
    end
  end

  def order_new
    if params[:partId] && params[:name] && params[:phone] && params[:city] && params[:email]
      @p = Order.new
      @p.part_id = params[:partId]
      @p.name = params[:name]
      @p.phone = params[:phone]
      @p.city = params[:city]
      @p.email = params[:email]
      @p.additional = params[:additional]
      @p.save
      DefaultMailer.order_email(@p).deliver
      redirect_to root_path, notice: "Спасибо! Ваш запрос отправлен! Ожидайте ответа на e-mail!"
    else redirect_to root_path, notice: 'Заполните все пункты'
    end
  end

  def seo
    @items = Seo.all
  end

  def seo_new
    if params[:actions] and params[:title] and params[:keywords] and params[:description]
      @s = Seo.new(params.permit(:title, :keywords, :description))
      @s.action = params[:actions]
      @s.save
      redirect_to aseo_path, notice: 'Добавлено!'
    else
      redirect_to aseo_path, notice: 'Заполните все поля'
    end
  end


  def parser
    require 'creek'

    workbook = Creek::Book.new Rails.root.join('public', 'documents', 'data.xlsx')
    worksheets = workbook.sheets

    @body = ""
    count = 0

    worksheets.each do |worksheet|
      @categories = Category.all
      @manufacturers = Manufacturer.all
      worksheet.rows.each do |row|
        if row.values[0] != nil
          r = row.values
          @part = Part.new
          @part.title = r[0]
          # Определение производителя
          @manufacturers.each do |m|
            if (r[3]!= nil and r[3].downcase[m.name.downcase]) or (r[2]!= nil and r[2].downcase[m.name.downcase]) or (r[0]!= nil and r[0].downcase[m.name.downcase])
              @part.manufacturer_id = m.id
              break
            end
          end
          if @part.manufacturer_id == nil and r[0] != nil
            @part.manufacturer_id = 1
          end
          # Image
          @part.image = r[1]
          @part.tags = r[2]
          @part.description = r[3]
          @part.cost = r[4]
          if (@v = Volume.find_by(name: r[5]))
            @part.volume_id = @v.id
          else
            @v = Volume.new
            @v.name = r[5]
            @v.save
            @part.volume_id = @v.id
          end
          if (@f = Fuel.find_by(name: r[6]))
            @part.fuel_id = @f.id
          else
            @f = Fuel.new
            @f.name = r[6]
            @f.save
            @part.fuel_id = @f.id
          end
          @part.mark = r[7]
          @part.privod = r[8]
          @part.year = r[10]
          @part.model_id = 1
          @part.color_id = 1
          @categories.each do |m|
            if (r[0]!= nil and r[0].downcase[m.name.downcase])
              @part.category_id = m.id
              break
            end
          end
          if @part.category_id == nil
            @part.category_id = 0
          end
          @part.carcass_id = 1
          @part.save
        end
      end
    end
    redirect_to '/parser_two'
  end

  private

  def admin_err
    render body: 'Вы не являетесь администратором'
  end
end