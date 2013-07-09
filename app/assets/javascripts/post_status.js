$(document).ready(function() {

  $('form#new_status')
    .bind('ajax:beforeSend', function(event, xhr, settings) {
      $(this).find('textarea').val('');
    })
    .bind('ajax:success', function(event, data, status, xhr) {
      $('ul#statuses').prepend('<li>'+data.text+'</li>');

    });

});
