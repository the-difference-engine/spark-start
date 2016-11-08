# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += ['vue.js', 'vue-router.js', 'vue-resource.js', 'jquery.js', 'bootstrap-sprockets.js', 'jquery_ujs.js', 'jquery.min.js', 'jquery-migrate.min.js', 'jquery.easing.min.js', 'bootstrap.min.js', 'bootstrap-hover-dropdown.min.js', 'raphael-min.js', 'livicons-1.4.min.js', 'raphael-min.js', 'jquery.waypoints.min.js', 'jquery.counterup.min.js', 'owl.carousel.min.js', 'jquery.flexslider-min.js', 'jquery.appear.js', 'modernizr.custom.97074.js', 'jquery.stellar.min.js', 'jquery.BlackAndWhite.js', 'lightbox.min.js', 'jquery.hoverdir.js', 'jquery.sticky.js', 'wow.min.js', 'headroom.js', 'versa.js', 'masterslider.min.js', 'jquery.cubeportfolio.min.js', 'tinymce.js']