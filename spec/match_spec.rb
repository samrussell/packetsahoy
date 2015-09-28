require 'spec_helper'
require "match"
require "netaddr"

# A Match describes a combination of IP/protocol/port
# that is used to filter network traffic
describe Match do
  let(:match) { Match.new }

  describe '#source_ip' do
    subject(:source_ip) { match.source_ip }

    it { is_expected.to be_a_kind_of(NetAddr::CIDR) }
  end

  describe '#destination_ip' do
    subject(:destination_ip) { match.destination_ip }

    it { is_expected.to be_a_kind_of(NetAddr::CIDR) }
  end

  describe '#source_port' do
    subject(:source_port) { match.source_port }
    
    it { is_expected.to be_a_kind_of(Integer).or be nil }
  end

  describe '#destination_port' do
    subject(:destination_port) { match.destination_port }

    it { is_expected.to be_a_kind_of(Integer).or be nil }
  end

  describe '#protocol' do
    subject(:protocol) { match.protocol }

    it { is_expected.to be_a_kind_of(String).or be nil }
  end
end
