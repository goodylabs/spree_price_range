Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "add_price_range_configuration_line",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :text => "<%= configurations_sidebar_menu_item(Spree.t('manage_price_filters'), admin_price_filters_url) %>",
                     :disabled => false)
