m = require 'mithril'
module.exports = (ctrl) ->
  m '.container', [
    m '.row.tp-interval-content', [
      m '.col-md-12.text-center', [
        m 'i.fa.fa-search.fa-5x'
        m 'h2', 'Qiitaアカウント未登録'
        m '.col-md-4.col-md-offset-4.text-center', [
          m 'form', [
            m '.form-group', [
              m 'label.sr-only[for="token"]', 'access token'
              m 'input#token.form-control[type="text"][placeholder="個人用アクセストークン"]',
                onchange: m.withAttr 'value', ctrl.token.val
                value: ctrl.token.val()
            ]
            m '.col-md-5.text-right', [
              m 'button.btn.btn-success[type="button"]',
                onclick: -> ctrl.authQiita()
                [
                  m 'i.fa.fa-check'
                  ' トークンを保存'
                ]
            ]
            m '.col-md-5.col-md-offset-1.text-left', [
              m 'a.btn.btn-default[href="https://qiita.com/settings/tokens/new"][target="_blank"]', [
                m 'i.fa.fa-cubes'
                ' トークンを発行'
              ]
            ]
          ]
        ]
      ]
    ]
  ]
