//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).on('turbolinks:load', function() {
    tinymce.init({
      selector: 'textarea.tinymce',
      // Opciones adicionales de configuración
    });
  });
  