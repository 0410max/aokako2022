// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require('kakomon/showComment');
require('kakomon/index');
require('kakomon/new');
require('kakomon/showImage');
require('board/search');
require('user/edit');
require('user/index');
require('user/show');
require('room/show');
require("jquery");
require('rate/jquery.raty');
require("jquery-ui/ui/widgets/datepicker");

window.$ = window.jQuery = require('jquery');
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/public/homes";
import "../stylesheets/public/kakomons";
import "../stylesheets/public/users";
import "../stylesheets/public/rooms"
import "../stylesheets/public/reports";
import "../stylesheets/public/notification";
import "../stylesheets/public/boards";
import "../stylesheets/admin/boards";
import "../stylesheets/admin/end_users";
import '@fortawesome/fontawesome-free/js/all';
Turbolinks.start()
global.FontAwesome.config.mutateApproach = 'sync'


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true);
const imagePath = (name) => images(name, true);
