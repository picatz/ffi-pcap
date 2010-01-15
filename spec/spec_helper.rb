require 'rubygems'
gem 'rspec', '>=1.2.9'
require 'spec'

require 'pcap-ffi'

include FFI
include FFI::PCap

PCAP_DEV      = ENV['PCAP_DEV'] || 'lo0'
PCAP_TESTFILE = ENV['PCAP_TESTFILE'] || File.expand_path(File.join(File.dirname(__FILE__), 'dumps', 'simple_tcp.pcap'))
PCAP_TESTADDR = ENV['PCAP_TESTADDR'] || '127.0.0.1'

$test_ping_pid = nil

def start_traffic_generator
  if RUBY_PLATFORM != 'java' and $test_ping_pid.nil?
    $test_ping_pid = Process.fork{ `ping #{PCAP_TESTADDR}` }
  end
end

def stop_traffic_generator
  if $test_ping_pid
    Process.kill('TERM', $test_ping_pid)
    $test_ping_pid = nil
  end
end
