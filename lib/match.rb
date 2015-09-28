require 'netaddr'

class Match
  attr_accessor :source_ip
  attr_accessor :destination_ip
  attr_accessor :source_port
  attr_accessor :destination_port
  attr_accessor :protocol

  def initialize(source_ip = nil,
                 destination_ip = nil,
                 source_port = nil,
                 destination_port = nil,
                 protocol = nil)
    if source_ip
      @source_ip = source_ip
    else
      @source_ip = NetAddr::CIDR.create("0.0.0.0/0")
    end

    if destination_ip
      @destination_ip = destination_ip
    else
      @destination_ip = NetAddr::CIDR.create("0.0.0.0/0")
    end

    if source_port
      @source_port = source_port
    else
      @source_port = nil
    end

    if destination_port
      @destination_port = destination_port
    else
      @destination_port = nil
    end

    if protocol
      @protocol = protocol
    else
      @protocol = nil
    end
  end
end
