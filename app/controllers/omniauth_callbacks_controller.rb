class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      print request.env['omniauth.auth']['extra']['raw_info'].to_yaml
      raw_info = request.env['omniauth.auth']['extra']['raw_info']

      @user.first_name = raw_info['first_name'] ? raw_info['first_name'] : ''
      @user.last_name = raw_info['last_name'] ? raw_info['last_name'] : ''
      @user.birthday = raw_info['birthday'] ? Date.strptime(raw_info['birthday'], '%m/%d/%Y') : DataTime.now.to_date.strftime('%m/%d/%Y')
      @user.gender = raw_info['gender'] ? raw_info['gender'] : ''
      @user.email = raw_info['email'] ? raw_info['email'] : ''

      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end
end
