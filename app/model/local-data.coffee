m = require 'mithril'
class LocalData
  @keys =
    qiita:
      token: 'QiitaToken'
      userId: 'QiitaUserId'
  constructor: (key, val = null) ->
    @key = m.prop key
    @val = m.prop val
  @all: ->
    new LocalData localStorage.key, localStorage.getItem localStorage.key i for i in [0...localStorage.length]
  @find: (key) ->
    new LocalData key, localStorage.getItem key
  save: ->
    localStorage.setItem @key(), @val()
  delete: ->
    localStorage.removeItem @key()
  @delete_all: ->
    localStorage.clear()

module.exports = LocalData
