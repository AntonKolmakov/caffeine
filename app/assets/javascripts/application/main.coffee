class Main
  constructor: () ->
    @lightbox()

  parallax: () ->
    jQuery('.parallax').parallax {
      xparallax: '50%'
      yparallax: false
      xorigin: '110%'
    }
    .trigger('unfreeze');

  lightbox: () ->
    $(document).delegate "*[data-toggle=\"lightbox\"]", "click", (event) ->
      event.preventDefault()
      $(this).ekkoLightbox()
      return


$ ->
  window.application = new Main()