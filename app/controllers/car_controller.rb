class CarController < ApplicationController

  def fuel
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Fuel.all)
      when 'get'
        if params[:fuel_id]
          fuel = Fuel.find_by(id: params[:fuel_id])
          if fuel
            render json: construct_response(200, 'success', fuel)
          else render json: construct_response(404, 'not_found: fuel')
          end
        else render json: construct_response(204, 'empty: fuel_id')
        end
      when 'add'
        if params[:name]
          fuel = Fuel.find_by(name: params[:name])
          if not fuel
            fuel = Fuel.new
            fuel.name = params[:name]
            fuel.save
            render json: construct_response(201, 'success', fuel.to_json)
          else render json: construct_response(208, 'already exists', fuel.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:fuel_id]
          fuel = Fuel.find_by(id: params[:fuel_id])
          if fuel
            @parts = Part.where(fuel_id: params[:fuel_id]).each do |part|
              part.fuel_id = 1
              part.save
            end
            fuel.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: fuel')
          end
        else render json: construct_response(204, 'empty: fuel_id')
        end
      when 'change'
        if params[:fuel_id] && params[:new_name]
          fuel = Fuel.find_by(id: params[:fuel_id])
          if fuel
            fuel.name = params[:new_name]
            fuel.save
            render json: construct_response(200, 'success', fuel.to_json)
          else render json: construct_response(4040, 'not_found: fuel')
          end
        else render json: construct_response(204, 'empty: fuel_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def carcass
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Carcass.all)
      when 'get'
        if params[:carcass_id]
          carcass = Carcass.find_by(id: params[:carcass_id])
          if carcass
            render json: construct_response(200, 'success', carcass)
          else render json: construct_response(404, 'not_found: carcass')
          end
        else render json: construct_response(204, 'empty: carcass_id')
        end
      when 'add'
        if params[:name]
          carcass = Carcass.find_by(name: params[:name])
          if not carcass
            carcass = Carcass.new
            carcass.name = params[:name]
            carcass.save
            render json: construct_response(201, 'success', carcass.to_json)
          else render json: construct_response(208, 'already exists', carcass.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:carcass_id]
          carcass = Carcass.find_by(id: params[:carcass_id])
          if carcass
            @parts = Part.where(carcass_id: params[:carcass_id]).each do |part|
              part.carcass_id = 1
              part.save
            end
            carcass.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: carcass')
          end
        else render json: construct_response(204, 'empty: carcass_id')
        end
      when 'change'
        if params[:carcass_id] && params[:new_name]
          carcass = Carcass.find_by(id: params[:carcass_id])
          if carcass
            carcass.name = params[:new_name]
            carcass.save
            render json: construct_response(200, 'success', carcass.to_json)
          else render json: construct_response(4040, 'not_found: carcass')
          end
        else render json: construct_response(204, 'empty: carcass_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def volume
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Volume.all)
      when 'get'
        if params[:volume_id]
          volume = Volume.find_by(id: params[:volume_id])
          if volume
            render json: construct_response(200, 'success', volume)
          else render json: construct_response(404, 'not_found: volume')
          end
        else render json: construct_response(204, 'empty: volume_id')
        end
      when 'add'
        if params[:name]
          volume = Carcass.find_by(name: params[:name])
          if not volume
            volume = Volume.new
            volume.name = params[:name]
            volume.save
            render json: construct_response(201, 'success', volume.to_json)
          else render json: construct_response(208, 'already exists', volume.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:volume_id]
          volume = Volume.find_by(id: params[:volume_id])
          if volume
            @parts = Part.where(volume_id: params[:volume_id]).each do |part|
              part.volume_id = 1
              part.save
            end
            volume.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: volume')
          end
        else render json: construct_response(204, 'empty: volume_id')
        end
      when 'change'
        if params[:volume_id] && params[:new_name]
          volume = Volume.find_by(id: params[:volume_id])
          if volume
            volume.name = params[:new_name]
            volume.save
            render json: construct_response(200, 'success', volume.to_json)
          else render json: construct_response(4040, 'not_found: volume')
          end
        else render json: construct_response(204, 'empty: volume_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def color
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Color.all)
      when 'get'
        if params[:color_id]
          color = Color.find_by(id: params[:color_id])
          if color
            render json: construct_response(200, 'success', color)
          else render json: construct_response(404, 'not_found: color')
          end
        else render json: construct_response(204, 'empty: color_id')
        end
      when 'add'
        if params[:name] and params[:color]
          color = Color.find_by(name: params[:name])
          if not color
            color = Color.new
            color.name = params[:name]
            color.hex = params[:color]
            color.save
            render json: construct_response(201, 'success', color.to_json)
          else render json: construct_response(208, 'already exists', color.to_json)
          end
        else render json: construct_response(204, 'empty: name or color')
        end
      when 'delete'
        if params[:color_id]
          color = Color.find_by(id: params[:color_id])
          if color
            @parts = Part.where(color_id: params[:color_id]).each do |part|
              part.color_id = 1
              part.save
            end
            color.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: color')
          end
        else render json: construct_response(204, 'empty: color_id')
        end
      when 'change'
        if params[:color_id] and params[:new_name]
          color = Color.find_by(id: params[:color_id])
          if color
            color.name = params[:new_name]
            # color.hex = params[:color]
            color.save
            render json: construct_response(200, 'success', color.to_json)
          else render json: construct_response(4040, 'not_found: color')
          end
        else render json: construct_response(204, 'empty: color_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def seo
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Seo.all)
      when 'get'
        if params[:seo_id]
          color = Seo.find_by(id: params[:seo_id])
          if color
            render json: construct_response(200, 'success', color)
          else render json: construct_response(404, 'not_found: color')
          end
        else render json: construct_response(204, 'empty: color_id')
        end
      when 'delete'
        if params[:seo_id]
          color = Seo.find_by(id: params[:seo_id])
          if color
            color.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: color')
          end
        else render json: construct_response(204, 'empty: color_id')
        end
      when 'change'
        if params[:seo_id]
          color = Seo.find_by(id: params[:seo_id])
          if color
            color.title = params[:title]
            color.keywords = params[:keywords]
            color.description = params[:description]
            color.save
            render json: construct_response(200, 'success', color.to_json)
          else render json: construct_response(4040, 'not_found: color')
          end
        else render json: construct_response(204, 'empty: color_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def part
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Part.all)
      when 'get'
        if params[:part_id]
          part = Part.find_by(id: params[:part_id])
          if part
            render json: construct_response(200, 'success', part)
          else render json: construct_response(404, 'not_found: part')
          end
        else render json: construct_response(204, 'empty: part_id')
        end
      when 'add'
        if params[:name]
          part = Part.find_by(name: params[:name])
          if not part
            part = Part.new
            part.name = params[:name]
            part.save
            render json: construct_response(201, 'success', part.to_json)
          else render json: construct_response(208, 'already exists', part.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:part_id]
          part = Part.find_by(id: params[:part_id])
          if part
            if part.image
              File.delete(Rails.root.join('public', 'images', part.image)) if File.exist?(Rails.root.join('public', 'images', part.image))
            end
            part.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: part')
          end
        else render json: construct_response(204, 'empty: part_id')
        end
      when 'change'
        if params[:part_id] && params[:new_name]
          part = Part.find_by(id: params[:part_id])
          if part
            part.name = params[:new_name]
            part.save
            render json: construct_response(200, 'success', part.to_json)
          else render json: construct_response(4040, 'not_found: part')
          end
        else render json: construct_response(204, 'empty: part_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def new
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', New.all)
      when 'get'
        if params[:new_id]
          model = New.find_by(id: params[:new_id])
          if model
            render json: construct_response(200, 'success', model)
          else render json: construct_response(404, 'not_found: new')
          end
        else render json: construct_response(204, 'empty: new_id')
        end
      when 'delete'
        if params[:new_id]
          model = New.find_by(id: params[:new_id])
          if model
            @images = Attachment.where(new_id: params[:new_id]).each do |part|
              File.delete(Rails.root.join('public', 'news', part.image)) if File.exist?(Rails.root.join('public', 'images', part.image))
              part.destroy
            end
            model.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: new')
          end
        else render json: construct_response(204, 'empty: new_id')
        end
      when 'change'
        if params[:new_id] && params[:title] && params[:content]
          model = New.find_by(id: params[:new_id])
          if model
            model.name = params[:new_name]
            model.content = params[:content]
            model.save
            render json: construct_response(200, 'success', model.to_json)
          else render json: construct_response(4040, 'not_found: new')
          end
        else render json: construct_response(204, 'empty: new_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def model
    if params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Model.all)
      when 'get'
        if params[:model_id]
          model = Model.find_by(id: params[:model_id])
          if model
            render json: construct_response(200, 'success', model)
          else render json: construct_response(404, 'not_found: model')
          end
        else render json: construct_response(204, 'empty: model_id')
        end
      when 'getByManufacturer'
        if params[:manufacturer_id]
          model = Model.where(manufacturer_id: params[:manufacturer_id])
          if model.count > 0
            render json: construct_response(200, 'success', model)
          else render json: construct_response(200, 'success', nil)
          end
        else render json: construct_response(204, 'empty: manufacturer_id')
        end
      when 'add'
        if params[:name]
          model = Model.find_by(name: params[:name])
          if not model
            model = Model.new
            model.name = params[:name]
            model.save
            render json: construct_response(201, 'success', model.to_json)
          else render json: construct_response(208, 'already exists', model.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:model_id]
          model = Model.find_by(id: params[:model_id])
          if model
            @parts = Part.where(model_id: params[:model_id]).each do |part|
              part.model_id = 1
              part.save
            end
            model.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: model')
          end
        else render json: construct_response(204, 'empty: model_id')
        end
      when 'change'
        if params[:model_id] && params[:new_name]
          model = Model.find_by(id: params[:model_id])
          if model
            model.name = params[:new_name]
            model.save
            render json: construct_response(200, 'success', model.to_json)
          else render json: construct_response(4040, 'not_found: model')
          end
        else render json: construct_response(204, 'empty: model_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def subcategory
    if params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Subcategory.all)
      when 'get'
        if params[:subcategory_id]
          model = Subcategory.find_by(id: params[:subcategory_id])
          if model
            render json: construct_response(200, 'success', model)
          else render json: construct_response(404, 'not_found: model')
          end
        else render json: construct_response(204, 'empty: subcategory_id')
        end
      when 'getByCategory'
        if params[:category_id]
          model = Subcategory.where(category_id: params[:category_id])
          if model.count > 0
            render json: construct_response(200, 'success', model)
          else render json: construct_response(200, 'success', nil)
          end
        else render json: construct_response(204, 'empty: category_id')
        end
      when 'delete'
        if params[:subcategory_id]
          model = Subcategory.find_by(id: params[:subcategory_id])
          if model
            model.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: subcategory')
          end
        else render json: construct_response(204, 'empty: subcategory_id')
        end
      when 'change'
        if params[:subcategory_id] && params[:new_name]
          model = Subcategory.find_by(id: params[:subcategory_id])
          if model
            model.name = params[:new_name]
            model.save
            render json: construct_response(200, 'success', model.to_json)
          else render json: construct_response(4040, 'not_found: model')
          end
        else render json: construct_response(204, 'empty: subcategory_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def category
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Category.all)
      when 'get'
        if params[:category_id]
          model = Category.find_by(id: params[:category_id])
          if model
            render json: construct_response(200, 'success', model)
          else render json: construct_response(404, 'not_found: category')
          end
        else render json: construct_response(204, 'empty: category_id')
        end
      when 'add'
        if params[:name]
          model = Category.find_by(name: params[:name])
          if not model
            model = Category.new
            model.name = params[:name]
            model.save
            render json: construct_response(201, 'success', model.to_json)
          else render json: construct_response(208, 'already exists', model.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:category_id]
          model = Category.find_by(id: params[:category_id])
          if model
            @parts = Part.where(category_id: params[:category_id]).each do |part|
              part.category_id = 0
              part.save
            end
            model.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: category')
          end
        else render json: construct_response(204, 'empty: category_id')
        end
      when 'change'
        if params[:category_id] && params[:new_name]
          model = Category.find_by(id: params[:category_id])
          if model
            model.name = params[:new_name]
            model.save
            render json: construct_response(200, 'success', model.to_json)
          else render json: construct_response(4040, 'not_found: model')
          end
        else render json: construct_response(204, 'empty: category_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def manufacturer
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Manufacturer.all)
      when 'get'
        if params[:manufacturer_id]
          manufacturer = Manufacturer.find_by(id: params[:model_id])
          if manufacturer
            render json: construct_response(200, 'success', manufacturer)
          else render json: construct_response(404, 'not_found: manufacturer')
          end
        else render json: construct_response(204, 'empty: manufacturer_id')
        end
      when 'add'
        if params[:name]
          manufacturer = Manufacturer.find_by(name: params[:name])
          if not manufacturer
            manufacturer = Manufacturer.new
            manufacturer.name = params[:name]
            manufacturer.save
            render json: construct_response(201, 'success', manufacturer.to_json)
          else render json: construct_response(208, 'already exists', manufacturer.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:manufacturer_id]
          manufacturer = Manufacturer.find_by(id: params[:manufacturer_id])
          if manufacturer
            @models = Model.where(manufacturer_id: params[:manufacturer_id]).each do |model|
              model.manufacturer_id = 1
              parts = Part.where(model_id: model.id).each do |part|
                part.model_id = 1
                part.save
              end
              model.save
            end
            @parts = Part.where(manufacturer_id: params[:manufacturer_id]).each do |part|
              part.manufacturer_id = 1
              part.save
            end
            manufacturer.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: manufacturer')
          end
        else render json: construct_response(204, 'empty: manufacturer_id')
        end
      when 'change'
        if params[:manufacturer_id] && params[:new_name]
          manufacturer = Manufacturer.find_by(id: params[:manufacturer_id])
          if manufacturer
            manufacturer.name = params[:new_name]
            manufacturer.save
            render json: construct_response(200, 'success', manufacturer.to_json)
          else render json: construct_response(4040, 'not_found: manufacturer')
          end
        else render json: construct_response(204, 'empty: manufacturer_id')
        end
      when 'changeText'
        if params[:manufacturer_id] && params[:new_name]
          manufacturer = Manufacturer.find_by(id: params[:manufacturer_id])
          if manufacturer
            manufacturer.text = params[:new_name]
            manufacturer.save
            render json: construct_response(200, 'success', manufacturer.to_json)
          else render json: construct_response(4040, 'not_found: manufacturer')
          end
        else render json: construct_response(204, 'empty: manufacturer_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end
end