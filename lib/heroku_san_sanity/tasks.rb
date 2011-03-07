require "highline/import"

@exec = false

def check_answer(answer, name)
  @exec = true
  if answer.downcase != name
    raise " !    Input did not match #{name}. Aborted."
    false
  end
  true
end

desc 'Force sanity check on production deploys'
task :before_deploy => :environment do |name, t, args|
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