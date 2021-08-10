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
# Block suspicious requests for '/etc/password' or wordpress specific paths.
# After 3 blocked requests in 10 minutes, block all requests from that IP for 5 minutes.
Rack::Attack.blocklist('fail2ban pentesters') do |req|
  # `filter` returns truthy value if request fails, or if it's from a previously banned IP
  # so the request is blocked
  Rack::Attack::Fail2Ban.filter("pentesters-#{req.ip}", maxretry: 1, findtime: 10.minutes, bantime: 50000000000000.minutes) do
    # The count for the IP is incremented if the return value is truthy
    CGI.unescape(req.query_string) =~ %r{/etc/passwd} ||
    req.path.include?('/etc/passwd') ||
    req.path.include?('wp-admin') ||
    req.path.include?('wp-login')

  end
end
end