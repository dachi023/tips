m = require 'mithril'
mq = require 'mithril-qiita'
LocalData = require '../model/local-data'
module.exports = ->
  vm =
    init: ->
      token = LocalData.find LocalData.keys.qiita.token
      userId = LocalData.find LocalData.keys.qiita.userId
      loggedQiita = token.val()? and userId.val()?
      getStocks = ->
        stocks = -> []
        if loggedQiita
          mq.token token.val()
          mq.background true
          mq.initialValue []
          Users = mq.users userId.val()
          stocks = Users.stocks.list()
          stocks.then (stocks) ->
            stocks.map (stock) ->
              stock.deleted = m.prop false
              stock
            m.redraw()
        stocks
      res =
        header:
          active: m.prop app.config.disp.qiita
        loggedQiita: m.prop loggedQiita
        token: token
        stocks: getStocks()
        preview:
          visible: m.prop false
          key: m.prop null
          url: m.prop null
          title: m.prop null
          body: m.prop null
      res.authQiita = ->
        mq.token res.token.val()
        mq.background false
        mq.get '/api/v2/authenticated_user'
        .then (data) ->
          res.token.save()
          userId.val data.id
          userId.save()
          location.reload()
      res.showPreview = (k) ->
        stock = res.stocks()[k]
        res.preview.key k
        res.preview.url stock.url
        res.preview.title stock.title
        res.preview.body m.trust stock.rendered_body
        res.preview.visible true
      res.hidePreview = ->
        res.preview.visible false
        res.preview.key null
        setTimeout ->
          res.preview.url null
          res.preview.title null
          res.preview.body null
        , 500
      res.deleteStock = (k) ->
        stock = res.stocks()[k]
        mq.token token.val()
        mq.background false
        mq.items(stock.id).stock.delete().then -> stock.deleted true
      res.addStock = (k) ->
        stock = res.stocks()[k]
        mq.token token.val()
        mq.background false
        mq.items(stock.id).stock.add().then -> stock.deleted false
      res
  vm.init()
