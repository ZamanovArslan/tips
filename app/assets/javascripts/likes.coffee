$(document).on 'ajax:success', 'a.fi-like', (status,data,xhr)->
  like_counts = $(".tip-like[data-id=#{data.id}] span.likes-count")
  likes = $(".tip-like[data-id=#{data.id}] a")

  for like in likes
    if $(like).hasClass("unliked")
      $(like).removeClass("unliked")
    else
      $(like).addClass("unliked")

  for like_count in like_counts
    $(like_count).text data.likes_count
