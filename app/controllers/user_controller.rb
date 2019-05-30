class UserController < ApplicationController

  require 'digest'

  def authorisation
    if not auth
      if params[:phone] && params[:password]
        user = User.find_by(phone: params[:phone])
        if user
          param_password = Digest::SHA256.hexdigest params[:password]
          if user.password == param_password
            session[:auth] = user
            redirect_to root_path
          else auth_error "Неправильный пароль"
          end
        else
          if params[:country]
            if params[:privacy] == "on"
              user = User.new
              user.country_id = params[:country]
              user.phone = params[:phone]
              user.password = Digest::SHA256.hexdigest params[:password]
              user.email = params[:email]
              user.name = params[:name]
              user.role_id = 0
              if user.save
                session[:auth] = user
                redirect_to root_path
                # render json: construct_response(200, 'successful_auth',{:user => {:country => user.country, :phone => user.phone, :password => "filtered", :role => user.role}})
              else
                render json: construct_response(200, 'not_existent_country')
              end
            else auth_error "Вы не дали согласие на обработку данных"
            end
          else auth_error "Заполните все поля"
          end
        end
      else auth_error "Заполните все поля"
      end
    else redirect_to root_path
    end
  end

  def user
    if params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', User.all.select(:id, :phone, :country_id, :role_id, :created_at, :updated_at))
      when 'get'
        if params[:user_id]
          user = User.select(:id, :phone, :country_id, :role_id, :created_at, :updated_at).find_by(id: params[:user_id])
          if user
            render json: construct_response(200, 'success', user)
          else render json: construct_response(404, 'not_found: user')
          end
        else render json: construct_response(204, 'empty: user_id')
        end
      when 'delete'
        if params[:user_id]
          user = User.select(:id, :phone, :country_id, :role_id, :created_at, :updated_at).find_by(id: params[:user_id])
          if user
            user.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: user')
          end
        else render json: construct_response(204, 'empty: user_id')
        end
      when 'toggleAdmin'
        if params[:user_id]
          user = User.select(:id, :phone, :country_id, :role_id, :created_at, :updated_at).find_by(id: params[:user_id])
          if user
            user.toggle(:role_id)
            user.save
            render json: construct_response(200, 'success')
          else render json: construct_response(404, 'not_found: user')
          end
        else render json: construct_response(204, 'empty: user_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method')
    end
  end

  def logout
    session[:auth] = nil
    redirect_to root_path, notice: 'Вы вышли из аккаунта'
  end

  def country
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Country.all)
      when 'get'
        if params[:country_id]
          country = Country.find_by(id: params[:country_id])
          if country
            render json: construct_response(200, 'success', country)
          else render json: construct_response(404, 'not_found: country')
          end
        else render json: construct_response(204, 'empty: country_id')
        end
      when 'add'
        if params[:name]
          country = Country.find_by(name: params[:name])
          if not country
            country = Country.new
            country.name = params[:name]
            country.save
            render json: construct_response(201, 'success', country.to_json)
          else render json: construct_response(208, 'already exists', country.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:country_id]
          country = Country.find_by(id: params[:country_id])
          if country
            @users = User.where(country_id: params[:country_id]).each do |user|
              user.country_id = 1
              user.save
            end
            country.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: country')
          end
        else render json: construct_response(204, 'empty: country_id')
        end
      when 'change'
        if params[:country_id] && params[:new_name]
          country = Country.find_by(id: params[:country_id])
          if country
            country.name = params[:new_name]
            country.save
            render json: construct_response(200, 'success', country.to_json)
          else render json: construct_response(4040, 'not_found: country')
          end
        else render json: construct_response(204, 'empty: country_id')
        end
      else render json: construct_response(404, 'not_found: method')
      end
    else render json: construct_response(204, 'empty: method or not_admin')
    end
  end

  def role
    if admin && params[:method]
      case params[:method]
      when 'all'
        render json: construct_response(200, 'success', Role.all)
      when 'get'
        if params[:role_id]
          role = Role.find_by(id: params[:role_id])
          if role
            render json: construct_response(200, 'success', role)
          else render json: construct_response(404, 'not_found: role')
          end
        else render json: construct_response(204, 'empty: role_id')
        end
      when 'add'
        if params[:name]
          role = Role.find_by(name: params[:name])
          if not role
            role = Role.new
            role.name = params[:name]
            role.save
            render json: construct_response(201, 'success', role.to_json)
          else render json: construct_response(208, 'already exists', role.to_json)
          end
        else render json: construct_response(204, 'empty: name')
        end
      when 'delete'
        if params[:role_id]
          role = Role.find_by(id: params[:role_id])
          if role
            role.destroy
            render json: construct_response(410, 'success')
          else render json: construct_response(404, 'not_found: role')
          end
        else render json: construct_response(204, 'empty: role_id')
        end
      when 'change'
        if params[:role_id] && params[:new_name]
          role = Role.find_by(id: params[:role_id])
          if role
            role.name = params[:new_name]
            role.save
            render json: construct_response(200, 'success', role.to_json)
          else render json: construct_response(4040, 'not_found: role')
          end
        else render json: construct_response(204, 'empty: role_id or new_name')
        end
      else render json: construct_response(404, 'not_found: action')
      end
    else render json: construct_response(204, 'empty: action or not_admin')
    end
  end
end