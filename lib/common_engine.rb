module CommonEngine
	class Engine < Rails::Engine

		# CONFIGURATION OPTIONS
		# http://edgeapi.rubyonrails.org/classes/Rails/Engine.html

		engine_name "CommonEngine"

		# this means that all MVC components are accessible only when the Engine's
		# namespace is referenced. For example, CommonEngine::User.first_name
		isolate_namespace CommonEngine
		
		config.app_generators.orm :active_record

		# reduntant, but helpful
		paths["app/controllers"] = "app/controllers"
		paths["app/models"] = "app/models"
		paths["app/views"] = "app/views"
	end
end