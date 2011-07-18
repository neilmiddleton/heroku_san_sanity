require "highline/import"
require 'hpricot'

@exec = false

def check_answer(answer, name)
  @exec = true
  if answer.downcase != name
    raise " !    Input did not match #{name}. Aborted."
    false
  end
  true
end

def check_heroku_integrity(name)
  doc = Hpricot(open("http://status.heroku.com/"))
  incident = doc.search("li.yellow, li.red")
  if incident.size != 0
    puts ""
    puts " !    WARNING: Potentially Unstable Deploy"
    puts " !    "
    puts " !    Heroku is experiencing some issues at present as detailed"
    puts " !    on the heroku status blog http://status.heroku.com"
    puts ""
    puts " !    To continue, type \"OK\""
    puts ""
    answer = ask("> ", String)
    check_answer(answer.downcase, "ok")
  end
end

desc 'Force sanity check on production deploys'
task :before_deploy => :environment do |name, t, args|
  return false if !check_heroku_integrity(name)
  
  each_heroku_app do |name, app, repo|
    if name == 'production' && @exec == false
      puts ""
      puts " !    WARNING: Potentially Destructive Action"
      puts " !    This command will affect the environment: #{name}"
      puts " !    To proceed, type \"#{name}\""
      puts ""
      answer = ask("> ", String)
      check_answer(answer, name)
    end
  end
end