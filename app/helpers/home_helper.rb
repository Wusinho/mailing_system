module HomeHelper

    def locale_links
      links = ""
      I18n.available_locales.each do |locale|
        links += link_to(locale.to_s.upcase, root_path(locale: locale), class: green_btn)
      end
      links.html_safe
    end

    def green_btn
      'btn btn-success'
    end

end
