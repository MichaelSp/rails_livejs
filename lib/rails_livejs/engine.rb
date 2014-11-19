require 'rails_livejs/view_helper'

module RailsLivejs
  class Engine < ::Rails::Engine
    initializer "rails_livejs.view_helpers" do
      ActionView::Base.send :include, ViewHelper
    end
  end
end