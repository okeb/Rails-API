class ApplicationController < ActionController::API
  include Pagy::Backend
  include JsonApiRender

  # def page_number
  #   params.dig(:page, :number) || 1
  # end

  # def page_size
  #   params.dig(:page, :size) || Pagy::DEFAULT[:items]
  # end
end