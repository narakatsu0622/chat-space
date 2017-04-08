$(function() {
  function buildHTML(message) {
    var html = (`<div class="ajax-chatspace" data-message_id=${message.id}>
                 <P class=chatspace-tweet-username>${ message.name }</p>
                 <p class=chatspace-tweet-time>${ message.created_at }</p>
                 <p class=chatspace-tweet-text>${ message.body }</p>
                 <image src= ${ message.image.url }</div>`);
    return html;
  }


  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var textField = $('.text-field');
    var form = $('.js-form').get()[0];
    var message = textField.val();
    var formData = new FormData( form );
    $.ajax({
      type: 'POST',
      url: location.pathname,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data.message);
      $('.chatspace').append(html);
      textField.val('');
      $('.chatspace').delay(100).animate({
      scrollTop: $(document).height()
    },1500);
    })
    .fail(function() {
      alert('error');
    });
  });
  $('#image_input').on("click", function() {
    $('#image_input_origin').click();
  });

  var setIV = setInterval(function(){
  var path_name = location.pathname;
  var last_message_id = $('.ajax-chatspace').last().data('message_id');
    if ( path_name.match( /messages/ )) {
        $.ajax({
          type: 'GET',
          url: path_name,
          data: { last_message_id: last_message_id },
          dataType: 'json',
        })
        .done(function(data) {
          $.each( data.update_message, function( i, message ) {
            var html = buildHTML(message);
            $('.chatspace').append(html);
          });
        })
        .fail(function() {
          alert('error');
        });
    } else {
        clearInterval(setIV);
      }
    }, 1000);
});
