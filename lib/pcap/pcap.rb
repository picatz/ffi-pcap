require 'pcap/ffi'
require 'pcap/data_link'
require 'pcap/handler'

module FFI
  module PCap
    def PCap.open_live(options={})
      device = options[:device]
      promisc = if options[:promisc]
                  1
                else
                  0
                end
      snaplen = (options[:snaplen] || Handler::SNAPLEN)
      to_ms = (options[:timeout] || 0)
      errbuf = MemoryPointer.new(ERRBUF_SIZE)

      ptr = PCap.pcap_open_live(device,snaplen,promisc,to_ms,nil)

      unless ptr
        raise(StandardError,errbuf.get_string(ERRBUF_SIZE),caller)
      end

      return Handler.new(ptr)
    end

    def PCap.open_dead(datalink,snaplen=Handler::SNAPLEN)
      datalink = DataLink[datalink]

      return Handler.new(PCap.pcap_open_dead(datalink,snaplen))
    end

    def PCap.open_offline(path)
      path = File.expand_path(path)
      errbuf = MemoryPointer.new(ERRBUF_SIZE)

      ptr = PCap.pcap_open_offline(path,errbuf)

      unless ptr
        raise(StandardError,errbuf.get_string(ERRBUF_SIZE),caller)
      end

      return Handler.new(ptr)
    end
  end
end
