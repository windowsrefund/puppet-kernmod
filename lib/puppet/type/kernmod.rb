Puppet::Type.newtype(:kernmod) do

		@doc = "Work with a kernel module"

		ensurable do

			newvalue(:present) do
				provider.create
			end

			newvalue(:absent) do
				provider.destroy
			end

			defaultto :present

		end

		newparam(:name) do
			desc "The kernel module"
		end

		newparam(:params) do
			desc "Any module parameters

					kernmod { 'loop': params => [ 'max_loops=2' ]"
			
			validate do |value|
				raise ArgumentError, "Parameters must be passed as an array" unless value.to_a.respond_to?('each')

				value.each do |val|
					raise ArgumentError, "Parameters must be passed in key=value format" unless val =~ /^\w+=\w/
				end

			end

		end

end

