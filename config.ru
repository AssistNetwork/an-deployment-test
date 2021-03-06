require 'rack'
require 'json'
app = Proc.new do |env|
  if env['HTTP_CONTENT_TYPE'] == 'application/json'
    request_json = {
      verb: env["REQUEST_METHOD"],
      uri:  env["REQUEST_URI"],
      body: env["rack.input"].read,
      protcol: env["SERVER_PROTOCOL"],
      headers: Hash[env.select {|k, v| k.start_with?("HTTP_") }.map {|k, v| [k[5..-1], v] }]
    }.to_json

    [200, {'Content-Type' => "application/json", 'Content-Length' => request_json.length.to_s}, [request_json]]
  else
    [200, {'Content-Type' => "application/xml"}, ['<foo><bar>baz</bar></foo>']]
  end
end

run app
