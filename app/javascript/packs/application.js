// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("home/top");
require("kakomon/main");
require('kakomon/index')
require('user/follow');

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/homes";
import "../stylesheets/kakomons";
import "../stylesheets/users";
import "../stylesheets/rooms"
import '@fortawesome/fontawesome-free/js/all';
Rails.start()
Turbolinks.start()
global.FontAwesome.config.mutateApproach = 'sync'


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true);
const imagePath = (name) => images(name, true);
