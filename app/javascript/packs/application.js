// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("@nathanvda/cocoon")
require('admin-lte')
require("chartkick")
require("chart.js")

import 'bootstrap';
import '../stylesheets/application.scss';
import "@fortawesome/fontawesome-free/js/all";
import 'packs/addtocart.js'
import 'packs/order_show.js'
import 'packs/orderadmin.js'
// import 'packs/pagination.js'

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
});

(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var panel = $(this).parent().parent();
    var messages_list = panel.find('.messages-list');

    panel.find('.panel-body').toggle();
    panel.attr('class', 'panel panel-default');

    if (panel.find('.panel-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
