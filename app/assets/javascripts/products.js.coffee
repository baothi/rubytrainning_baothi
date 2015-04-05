$("#btn_submit").click ->
  product_id_value = $("#product_id").val()
  comment_content_value = $("#comment_content").val()
  # alert(comment_content_value)
  $.ajax
    type: "GET"
    url: " /products/comments"
    data: {product_id: product_id_value, comment_content: comment_content_value}
    success: (data) ->
      $("#comment_conetent").val("")
      $("#comments_content").html data
    error: (data) ->