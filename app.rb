require "sinatra/reloader" if development?

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/slow/*' do |path|
  sleep 10
  status, headers, body = call env.merge("PATH_INFO" => path.sub(%r{^/slow}, ''))
  [status, headers, body]
end
