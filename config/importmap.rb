# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js"
pin "js-confetti", to: "https://ga.jspm.io/npm:js-confetti@0.11.0/dist/es/index.js"
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.2/dist/esm/index.js"
# pin "@hotwired/turbo-rails", to: "https://ga.jspm.io/npm:@hotwired/turbo-rails@7.3.0/app/javascript/turbo/index.js"
pin "@rails/actioncable/src", to: "https://ga.jspm.io/npm:@rails/actioncable@7.1.1/src/index.js"

# Custom files
pin "confetti"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
