class Main
  constructor: () ->
    @parallax()

  parallax: () ->
    jQuery('.parallax').parallax {
      xparallax: '20%'
      yparallax: false
      xorigin: 'right'
    }
    .trigger('unfreeze');

$ ->
  window.application = new Main()