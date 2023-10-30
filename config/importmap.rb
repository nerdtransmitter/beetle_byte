# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js"
pin "js-confetti", to: "https://ga.jspm.io/npm:js-confetti@0.11.0/dist/es/index.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
# Custom files
pin "confetti"
