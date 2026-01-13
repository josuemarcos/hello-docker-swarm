require "sinatra"
require "socket"

set :bind, "0.0.0.0"
set :port, 4567

set :host_authorization, {
    permitted_hosts: []
}

get "/" do
  hostname = Socket.gethostname
  ip = Socket.ip_address_list.find(&:ipv4_private?)&.ip_address

  <<~RESPONSE
    Olá Mundo!
    Hostname: #{hostname}
    IP: #{ip}
    Timestamp: #{Time.now}
  RESPONSE
end