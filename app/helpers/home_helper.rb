module HomeHelper

    def locale_links
      links = ""
      current_locale = params[:locale] || I18n.default_locale
      I18n.available_locales.each do |locale|
        if locale.to_s == current_locale.to_s
          links += link_to(locale.to_s.upcase, url_for(locale: locale), class: green_btn_disabled)
        else
          links += link_to(locale.to_s.upcase, url_for(locale: locale), class: green_btn)
        end
      end
      links.html_safe
    end


    def green_btn
      'btn btn-success'
    end

    def green_btn_disabled
      green_btn + ' disabled'
    end

end
