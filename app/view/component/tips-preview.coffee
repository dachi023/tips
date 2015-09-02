m = require 'mithril'
module.exports = (ctrl) ->
  [
    m '.tp-preview.tp-padding-footer', ctrl.preview.body()
  ]
