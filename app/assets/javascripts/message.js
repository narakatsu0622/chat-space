$(function() {
  function buildHTML(message) {
    var html = (`<div class="chat-space">
                 <P class=chatspace-tweet-username>${ message.name }</p>
                 <p class=chatspace-tweet-time>${ message.created_at }</p>
                 <p class=chatspace-tweet-text>${ message.body }</p></div>`);
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
      var html = buildHTML(data,message);
      $('.text-field').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
