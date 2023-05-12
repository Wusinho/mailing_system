module HomeHelper

    def locale_links
      links = ""
      I18n.available_locales.each do |locale|
        links += link_to(locale.to_s.upcase, root_path(locale: locale), class: 'nav-link')
      end
      links.html_safe
    end

end
