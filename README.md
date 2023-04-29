# README.MD

## Walkthrough

1. `rails new food_app` to create a new rails app.
1. Run `rails g scaffold Entry meal_type:string calories:integer proteins:integer carbohydrates:integer fats:integer` to create a new scaffold.
1. Run `rails db:migrate` to migrate pending db operations we haven't dealt with yet.
1. Add `root to: "entries#index"` to routes.rb file for now.
1. Have an eager instict of always checking rails/info/routes web endpoint.
1. Run `bundle install` every time you add a gem writing to `gemfile` or running `gem add gem_name`.
1. Add [bulma](https://bulma.io/) to `application.html.erb`.
1. Code *html.erb using bulma css.
1. Run `rails g controller archives index`
1. Code archives_controller.
1. Code tests setting fixtures in `entries.yml` and coding `test/system/entries_test.rb`.
1. Add a system test by running `rails g system_test archives`.
1. Code `archives_test.rb`.

## Make things easier

1. Add `"emmet.includeLanguages": { "erb": "html" }` to `settings.json` so as to make things easier when editing *html.erb files.
1. Do [this](https://github.com/railsjazz/rails_live_reload).
