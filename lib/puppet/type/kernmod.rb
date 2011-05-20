Puppet::Type.newtype(:kernmod) do

		@doc = "Work with a kernel module"

		ensurable 

		newparam(:name) do
			desc "The kernel module"
		end

end
