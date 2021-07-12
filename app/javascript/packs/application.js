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

require.context('../images', true)