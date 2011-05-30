; $Id$
;
; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.

core = 6.x

; API version
; ------------
; Every makefile needs to declare it's Drush Make API version. This version of
; drush make uses API version `2`.

api = 2

; Core project
; ------------
; In order for your makefile to generate a full Drupal site, you must include
; a core project. This is usually Drupal core, but you can also specify
; alternative core projects like Pressflow. Note that makefiles included with
; install profiles *should not* include a core project.

; Use pressflow instead of Drupal core:
;projects[pressflow][type] = "core"
;projects[pressflow][download][type] = "get"
;projects[pressflow][download][url] = "http://launchpad.net/pressflow/6.x/6.20.97/download/pressflow-6.20.97.tar.gz"
;projects[pressflow][download][url] = "http://files.pressflow.org/pressflow-6-current.tar.gz"



projects[] = drupal

; Projects
; --------

; Base Modules
projects[] = views
projects[] = cck
projects[] = ctools
projects[] = panels
projects[] = features
projects[] = strongarm

; CCK Modules
projects[] = date
projects[] = email

projects[] = filefield
projects[] = imageapi
projects[] = imagefield
projects[] = imagecache

projects[] = matrix
projects[] = galleryformatter
projects[] = content_complete
projects[] = computed_field
projects[] = calendar
projects[] = barcode
projects[] = autocomplete_widgets

projects[swfupload] = 2.0-beta7

; Additional Modules

projects[openlayers] = 1.x-dev
projects[] = conditional_fields
projects[] = context
projects[] = link
projects[] = noderelationships
projects[] = urlfill
projects[] = panel_style
projects[] = modalframe
projects[] = jqp
projects[] = admin_menu
projects[] = content_access
projects[] = rules
projects[] = adminrole
projects[] = backup_migrate
projects[] = pathauto
projects[] = token
projects[] = spacial
projects[] = schema


; Clone CIS modules from github.

;projects[cis][type] = module
;projects[cis][download][type] = git
;projects[cis][download][url] = git://github.com:geomemes/cis.git
;projects[cis][download][url] = git@github.com:geomemes/cis.git
;projects[cis][download][url] = https://github.com/geomemes/cis
