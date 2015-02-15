module ApplicationHelper

	def doattend_sync
		JSON.parse RestClient.get(Doattend)
	end

end
