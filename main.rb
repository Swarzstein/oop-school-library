require_relative 'app'

def main
  app = App.new
  app.start
  puts 'Thank you for using this app!'
end

main
