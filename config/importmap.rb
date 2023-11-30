# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@zxing/library", to: "https://ga.jspm.io/npm:@zxing/library@0.20.0/esm/index.js"
pin "ts-custom-error", to: "https://ga.jspm.io/npm:ts-custom-error@3.3.1/dist/custom-error.mjs"
