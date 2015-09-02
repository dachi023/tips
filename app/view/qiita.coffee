m = require 'mithril'
module.exports = (ctrl) ->
  [
    require('./component/header')(ctrl)
    if ctrl.loggedQiita()
      require('./component/qiita/logged')(ctrl)
    else
      require('./component/qiita/no-logged')(ctrl)
  ]
