m = require 'mithril'
module.exports = (ctrl) ->
  [
    m '.container', [
      m '.row.tp-interval-content', [
        m '.col-md-8', [
          m '.row', [
            m '.col-md-12', [
              if ctrl.preview.visible()
                require('../tips-preview')(ctrl)
            ]
          ]
        ]
        m '.col-md-4', [
          m '.tp-padding-footer', [
            ctrl.stocks().map (v, k) ->
              m '.row', [
                unless k is 0 then m 'hr'
                m '.col-md-12', [
                  m 'p', m '.btn-group.btn-group-sm[role="group"]', [
                    if !v.deleted? or !v.deleted()
                      m 'button.btn.btn-success[type="button"]',
                        onclick: -> ctrl.deleteStock k
                        m 'i.fa.fa-trash.fa-fw'
                    else
                      m 'button.btn.btn-danger[type="button"]',
                        onclick: -> ctrl.addStock k
                        m 'i.fa.fa-bookmark.fa-fw'
                    if k is ctrl.preview.key()
                      m 'button.btn.btn-default[type="button"]',
                        onclick: ctrl.hidePreview
                        m 'i.fa.fa-eye-slash.fa-fw'
                    else
                      m 'button.btn.btn-default[type="button"]',
                        onclick: -> ctrl.showPreview k
                        m 'i.fa.fa-eye.fa-fw'
                  ]
                  m 'h5', v.title
                  m 'small', m "a[href='#{v.url}'][target='_blank']", [
                    m 'i.fa.fa-external-link'
                    " #{v.url}"
                  ]
                ]
              ]
          ]
        ]
      ]
    ]
    require('../tips-preview-footer')(ctrl)
  ]
