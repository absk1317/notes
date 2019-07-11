// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("autosize")
require("chosen-js")
import 'bootstrap'
import './src/application.scss'
import "chosen-js/chosen.css"
import "chosen-js/chosen-sprite.png"

$('document').ready(function() {
  setTimeout(function() {
    $('.alert-success').slideUp();
  }, 2000);
});

$(function () {
  autosize($('#note_body'));
});

$('document').ready(function () {
  $('#note_tag_ids').chosen({
    allow_single_deselect: true,
    width: '100%'
  })
});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
