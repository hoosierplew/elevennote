# Not a great example of how to name a class, but a good example of CS classes nonetheless.
class Note
  constructor: ->
    @handleClicks()
    @resizeBootsy()

  handleClicks: ->
    $('#notes > li').click (e) ->
      e.preventDefault()
      location.href = $(this).data 'url'

  resizeBootsy: ->
    $(window).resize( ->
      $(".bootsy_text_area").height $(window).height() - 300
    ).trigger 'resize'

$ ->
  new Note()

# Easier to read CoffeeScript
#
# $ ->
#   $('#notes > li').click (e) ->
#     e.preventDefault()
#     location.href = $(this).data 'url'
#   $(window).resize( ->
#     $(".bootsy_text_area").height $(window).height() - 300
#   ).trigger 'resize'
#
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
