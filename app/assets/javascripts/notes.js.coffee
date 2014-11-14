$ ->
  $('#notes > li').click (e) ->
    e.preventDefault()
    location.href = $(this).data 'url'
  $(window).resize( ->
    $(".bootsy_text_area").height $(window).height() - 300
  ).trigger 'resize'

# JQUERY SOLUTION BELOW
#
# $(function() {
#   $('#notes > li').click(function(e) {
#     e.preventDefault();
#     location.href = $(this).data('url');
#   });
#
#   $(window).resize(function() {
#     $(".bootsy_text_area").height( $(window).height() - 300 );
#   }).trigger('resize');
# })
