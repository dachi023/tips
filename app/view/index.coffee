m = require 'mithril'
module.exports = (ctrl) ->
  [
    require('./component/header.coffee')(ctrl)
    m '.container', [
      m '.row.tp-interval-content', [
        m '.col-md-12.text-center', [
          m 'h2', [
            m 'i.fa.fa-trash.fa-3x'
            " #{app.config.appName}"
          ]
          m 'h5', 'Tipsをポイっと捨てる為のサービスです'
          m 'small', 'Remove your tips'
        ]
      ]
      m '.row.tp-interval-content', [
        m '.col-md-4.text-center', [
          m 'i.fa.fa-clock-o.fa-3x'
          m 'h4', '時間はかけずに削除'
          m 'p', 'こんなことに時間をかけたくないので'
          m 'p', '少ないタップ数で消せるようにしました'
        ]
        m '.col-md-4.text-center', [
          m 'i.fa.fa-search.fa-3x'
          m 'h4', '必要な情報を探しやすく'
          m 'p', 'いらないものを消していくと'
          m 'p', '探しものをするときに楽になります'
        ]
        m '.col-md-4.text-center', [
          m 'i.fa.fa-globe.fa-3x'
          m 'h4', '対応済み or 予定'
          m 'p', [
            m 'i.fa.fa-check'
            ' Qiita'
          ]
          m 'p', [
            m 'i.fa.fa-times'
            ' はてブ'
            ', GitHub'
          ]
        ]
      ]
      m '.row.tp-interval-content', [
        m '.col-md-4.text-center', [
          m 'i.fa.fa-github-alt.fa-3x'
          m 'h4', 'ゆっくり作ってます'
          m 'p', '削除は素早いけど開発はゆっくりです'
          m 'p', 'ごめんなさい'
        ]
        m '.col-md-4.text-center', [
          m 'i.fa.fa-question.fa-3x'
          m 'h4', '何かあったときは'
          m 'p', 'お問い合わせフォームはないです'
          m 'p', 'TwitterかGitHubでお願いします'
        ]
        m '.col-md-4.text-center', [
          m 'i.fa.fa-child.fa-3x'
          m 'h4', 'わたし'
          m 'p', [
            m 'a[href="https://twitter.com/dachi_023"][target="_blank"]', [
              m 'i.fa.fa-twitter-square'
              ' Twitter'
            ]
          ]
          m 'p', [
            m 'a[href="https://github.com/dachi023"][target="_blank"]', [
              m 'i.fa.fa-github-square'
              ' GitHub'
            ]
          ]
        ]
      ]
    ]
  ]
