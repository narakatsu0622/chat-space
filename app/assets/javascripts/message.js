$(function() {
  function buildHTML(message) {
    var html = (`<div class="chat-space">
                 <P class=chatspace-tweet-username>${ message.name }</p>
                 <p class=chatspace-tweet-time>${ message.created_at }</p>
                 <p class=chatspace-tweet-text>${ message.body }</p></div>`);
    return html;
}
$('.js-form').on('sudmit', function(e)) {
  e.preventDefault();
  e.stopPropagation();
  var textField = $('.js-form__text-field');
  var message = textField.val();
  var path_name = location.pathname;
  $.ajax({
    type: 'POST',
    url: path_name,
    data: {
      message: {
        body: message
      }
    },
    dataType: 'json'
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
