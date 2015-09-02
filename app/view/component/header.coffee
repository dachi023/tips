m = require 'mithril'
module.exports = (ctrl) ->
  links =
    left: [
      {name: app.config.disp.qiita, href: "#{app.config.base}qiita.html"}
    ]
  m 'nav.navbar.navbar-inverse.navbar-fixed-top', [
    m '.container', [
      m '.navbar-header', [
        m 'button.navbar-toggle.collapsed[data-toggle="collapse"][data-target="#tp-global-nav"][aria-expanded="false"]',
          m 'i.fa.fa-bars.fa-lg'
        m "a.navbar-brand[href='#{app.config.base}']", [
          m 'i.fa.fa-trash.fa-lg'
          " #{app.config.appName}"
        ]
      ]
      m '#tp-global-nav.collapse.navbar-collapse', [
        m 'ul.nav.navbar-nav', links.left.map (v) ->
          m "li#{if v.name is ctrl.header.active() then '.active' else ''}",
            m "a[href='#{v.href}']", v.name
        m 'ul.nav.navbar-nav.navbar-right', [
          m 'li',
            m 'a[href="https://github.com/dachi023/tips-poi"][data-toggle="tooltip"][data-placement="bottom"][title="GitHub"][target="_blank"]',
              m 'i.fa.fa-github. fa-lg'
        ]
      ]
    ]
  ]
