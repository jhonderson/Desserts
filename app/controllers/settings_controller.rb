class SettingsController < ApplicationController
  def change_locale
  	puts "------------>change_locale"
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    puts "------------>change_locale I18n.available_locales.include?(l): #{I18n.available_locales.include?(l)} ... locale: #{l}"
    cookies.permanent[:educator_locale] = l
    redirect_to request.referer || root_url
  end
end
