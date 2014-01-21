# define module() {
#   exec { "install-module-$name":
#     cwd => "/var/www/drupal/sites/all/modules",
#     command => "/usr/local/bin/drush dl $name",
#     creates => "/var/www/drupal/sites/all/modules/$name",
#   }
# }

# class drupal::modules {
#   drupal::module {
#         [
#             "admin_menu",
#             "cck",
#             "comment_notify",
#             "contact_forms",
#             "filefield",
#             "google_analytics",
#             "imagecache",
#             "nodewords",
#             "views",
#             "views_attach",
#             "views_bulk_operations",
#             "weblinks"
#         ]:
#     }
# }
