import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "../stylesheets/application"
import "../stylesheets/navbar"
import "../stylesheets/sign_in_sign_up"
import "../stylesheets/main"
import "../stylesheets/footer"
import "../stylesheets/user_profile"
import "../stylesheets/edit_registration"
import "../stylesheets/post"
import "../javascript/upload_post_images"

import "dropzone"

require.context('../images', true)


import "../stylesheets/posts_list"