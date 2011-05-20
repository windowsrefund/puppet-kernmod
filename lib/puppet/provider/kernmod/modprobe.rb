Puppet::Type.type(:kernmod).provide(:modprobe) do
	
		desc "modprobe support"

		commands :modprobe => 'modprobe'

		def create
			modprobe resource[:name]
		end

		def destroy
			modprobe "-r", resource[:name]
		end

		def exists?
			open('/proc/modules').grep(/^#{resource[:name]}/).length > 0
		end

end
