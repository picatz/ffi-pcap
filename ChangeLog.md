### 0.2.1 / 2010-08-04
* Experimental selectable IO support
* Added Marshal support to Packet objects
* Irrelevent tweaks made to project dev environment/pkg mgmt

### 0.2.0 / 2010-04-22

* emonti fork merged back into sophsec/ffi-pcap 
* ... ignore that whole "caper" thing.  It will return as another lib entirely.

### 0.1.4 / 2010-04-20 (emonti/ffi-pcap)

* Fixes and example for pcap dumper

### 0.1.3 / 2010-03-05 (emonti/ffi-pcap)

* Minor fixes for ruby 1.9 compatability

### 0.1.2 / 2010-01-03 (emonti/ffi-pcap)

* Branched from sophsec/ffi-pcap by emonti
* Using ffi_dry for common struct interface
* Redesigned  the pcap-specific pcap_pkthdr struct.
* Dismantled all other network packet parsing code. 
* 'Handlers' have been split out into type-specific 'Wrappers' by features.
* The namespace 'Handler' has been reused instead for pcap_handler abstraction
* Added filtering support and interfaces for compiling filters into bpf code.
* Added packet injection on Live pcap interfaces.
* Tackled some minor Jruby compatability issues.
* Lots of documentation added throughout with yardoc tags.
* Lots of misc namespace mods and such, and some general refactoring.
* Lots of other stuff I'm probably forgetting.
* specs all pass on OS X, Linux, and Win32(except 1 which is a known issue)

### 0.1.0 / 2009-04-29 (sophsec/ffi-pcap)

* Initial release. 
