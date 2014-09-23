class Main
  constructor: () ->

  parallax: () ->
    jQuery('.parallax').parallax {
      xparallax: '50%'
      yparallax: false
      xorigin: '110%'
    }
    .trigger('unfreeze');

$ ->
  window.application = new Main()