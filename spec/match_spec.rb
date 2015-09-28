require 'spec_helper'
require "match"
require "netaddr"

# A Match describes a combination of IP/protocol/port
# that is used to filter network traffic
describe Match do
  let(:empty_match) { Match.new }
  let(:full_match) { Match.new(source_ip = NetAddr::CIDR.create("1.2.3.4/32"),
                               destination_ip = NetAddr::CIDR.create("3.57.120.0/24"),
                               source_port = 23,
                               destination_port = 1094,
                               protocol = "tcp")
                   }

  describe '#source_ip' do
    it "should be CIDR(0.0.0.0/0)" do
      expect(empty_match.source_ip).to eq(NetAddr::CIDR.create("0.0.0.0/0"))
    end

    it "should be CIDR(1.2.3.4/32)" do
      expect(full_match.source_ip).to eq(NetAddr::CIDR.create("1.2.3.4/32"))
    end
  end

  describe '#destination_ip' do
    it "should be CIDR(0.0.0.0/0)" do
      expect(empty_match.destination_ip).to eq(NetAddr::CIDR.create("0.0.0.0/0"))
    end

    it "should be CIDR(3.57.120.0/24)" do
      expect(full_match.destination_ip).to eq(NetAddr::CIDR.create("3.57.120.0/24"))
    end
  end

  describe '#source_port' do
    it "should be nil" do
      expect(empty_match.source_port).to be nil
    end

    it "should be 23" do
      expect(full_match.source_port).to eq(23)
    end
  end

  describe '#destination_port' do
    it "should be nil" do
      expect(empty_match.destination_port).to be nil
    end

    it "should be 1094" do
      expect(full_match.destination_port).to eq(1094)
    end
  end

  describe '#protocol' do
    it "should be nil" do
      expect(empty_match.protocol).to be nil
    end

    it "should be 'tcp'" do
      expect(full_match.protocol).to eq("tcp")
    end
  end
end
