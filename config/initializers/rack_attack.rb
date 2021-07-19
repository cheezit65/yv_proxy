class Rack::Attack
  # Block 10.* IPs
  RANGE = (IPAddr.new('10.0.0.0').to_i..IPAddr.new('10.255.255.255').to_i)
  Rack::Attack.blocklist('block_local_network')  do|req|
    RANGE.include?(IPAddr.new(req.ip).to_i)
  end
end