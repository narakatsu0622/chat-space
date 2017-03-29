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
  var message = $('.js-form__text-field').val();
  var formData = new FormData( form );
  $.ajax({
    type: 'POST',
    url: group_messages,
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
