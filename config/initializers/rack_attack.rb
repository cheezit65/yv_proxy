class Rack::Attack
  # Block 10.* IPs
  RANGE = (IPAddr.new('10.0.0.0').to_i..IPAddr.new('10.255.255.255').to_i)
  Rack::Attack.blocklist('block_local_network')  do|req|
    RANGE.include?(IPAddr.new(req.ip).to_i)
  end
  LOGGER = Logger.new('log/rack-attack.log')
ActiveSupport::Notifications.subscribe('rack.attack') do |_name, _start, _finish, _request_id, req|
  req = req[:request]
  msg = [req.env['rack.attack.match_type'], req.ip, req.request_method, req.fullpath, ('"' + req.user_agent.to_s + '"')].join(' ')
  if [:throttle, :blocklist].include? req.env['rack.attack.match_type']
    LOGGER.error(msg)
  else
    LOGGER.info(msg)
  end
end
end