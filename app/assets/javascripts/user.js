$(function() {
  var list = $("#user-list");
  var preWord;

  function appendList(user) {
    var item = $(`<li class="list" data-user_name=${user.name} data-user_id=${user.id}>
                    ${user.name}
                    <a class="add-user"> 追加 </a>
                    </li>`);
    list.append(item);
  }

  function add_user_result(name,user_id) {
    var member = $(`<li class="chat-group-user">
                           <input name="group[user_ids][]" type="hidden" value=${user_id}>
                           ${ name }
                           <a class="remove-user"> 削除 </a>
                    </li>`);
      $('.field-input').append(member);
  }

  function editElement(element) {
    var result = "%" + element + "%";
    return result;
  }

  $("#keyword").on("keyup", function() {
    var input = $("#keyword").val();
    var inputs = input.split(" ").filter(function(e) { return e; });
    var newInputs = inputs.map(editElement);
    var word = newInputs.join("|");
    $.ajax({
      type: 'GET',
      url: '/users',
      data: {
        user_name: word
      },
      dataType: 'json'
    })
    .done(function(data) {
      var users_info = (data.user_list.user);
      $(".list").remove();
      if(word != preWord && input.length !== 0){
        $.each(users_info, function(i, user) {
          appendList(user);
        });
        if($(".list").length === 0) {
          appendList("一致するメンバーはいません");
        }
      }
    })
    .fail(function(){
      alert('error');
    });
  });

  $("#user-list").on('click','.add-user', function(){
      $(this).parent().remove();
      var name = $(this).parent().data('user_name');
      var user_id = $(this).parent().data('user_id');
      add_user_result(name, user_id);
  });

  $(".field-input").on('click', '.remove-user', function() {
    $(this).parent().remove();
  });
});
