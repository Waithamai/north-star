# frozen_string_literal: true

module Sinatra
  module ContentHelpers
    def page_title(title=false)
      section_title = I18n.t("section_titles.#{@section}")
      [title, section_title].select(&:present?).join(" - ")
    end

    def static_url(asset)
      return "/#{asset}" unless Sinatra::Application.production?

      asset_protocol = settings.config[:statics][:use_https] ? "https" : "http"
      asset_host = settings.config[:statics][:domain]
      "#{asset_protocol}://#{asset_host}/#{asset}"
    end

    def partial(partial, locals)
      erb partial.to_sym, {locals: locals}
    end
  end

  helpers ContentHelpers
end