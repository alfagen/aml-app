# frozen_string_literal: true

# Сходу не удалось запустить
# require 'simple_navigation/rails_controller_methods'

# SimpleNavigation.register_renderer :bootstrap_topbar_list => SimpleNavigation::Renderer::BootstrapTopbarList
# render_navigation(level: 1..2, renderer: :bootstrap_topbar_list, expand_all: true)
# SimpleNavigation.config_file_paths << Rails.root.join('app', 'navigation')
# SimpleNavigation.register_renderer sidebar: OperatorMenuRenderer
SimpleNavigation.config.selected_class = 'active'
# SimpleNavigation.config.highlight_on_subpath = true
