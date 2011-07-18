heroku_san_sanity
============

heroku_san_sanity is a sibling task to the heroku_san gem

If you are deploying with Heroku_san, Heroku_san_sanity will sense check all production deploys with an 'Are you sure?' message.

heroku_san_sanity now also checks the status of the heroku platform prior to a deploy, and asks if you want to continue should the platform not be reported as healthy.

Installation
------------

Add the following to your Gemfile:

    group :development do  
      gem 'herok_san_sanity'  
    end

This gem must only be used in applications that use Heroku.

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don’t break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.