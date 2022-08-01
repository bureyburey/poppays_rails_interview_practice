# README

### Ruby Version
2.6.9p207

### Rails Version
6.0.5.1

### Initializing database + migrations
$ rails db:create
<br/>
$ rails db:migrate

## Running Tests
https://github.com/rspec/rspec-rails#running-specs
### Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
$ bundle exec rspec

### Run all spec files in a single directory (recursively)
$ bundle exec rspec spec/models

### Run a single spec file
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb

### Run a single example from a spec file (by line number)
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb:8

### See all options for running specs
$ bundle exec rspec --help

---
---
---

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
