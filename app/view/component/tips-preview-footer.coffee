m = require 'mithril'
module.exports = (ctrl) ->
  [
    m "footer.tp-preview-footer#{if ctrl.preview.visible() then '.open' else ''}", [
      m '.container', [
        m '.row', [
          m '.col-md-1', [
            m 'p', [
              if ctrl.preview.key()? && !ctrl.stocks()[ctrl.preview.key()].deleted()
                m 'button.btn.btn-success[type="button"]',
                  onclick: -> ctrl.deleteStock ctrl.preview.key()
                  m 'i.fa.fa-trash.fa-fw'
              else
                m 'button.btn.btn-danger[type="button"]',
                  onclick: -> ctrl.addStock ctrl.preview.key()
                  m 'i.fa.fa-bookmark.fa-fw'
            ]
            m 'p', [
              m 'button.btn.btn-default[type="button"]',
                onclick: ctrl.hidePreview
                m 'i.fa.fa-eye-slash.fa-fw'
            ]
          ]
          m '.col-md-11', [
            m 'h4', ctrl.preview.title()
            m 'small', m "a[href='#{ctrl.preview.url()}'][target='_blank']", [
              m 'i.fa.fa-external-link'
              " #{ctrl.preview.url()}"
            ]
          ]
        ]
      ]
    ]
  ]
