require 'rails/generators'
require 'highline/import'
require 'bundler'
require 'bundler/cli'
require 'thor'

module CommonEngine
  module Generators
  	class InstallGenerator < Rails::Generators::Base
  		# see the Spree generators for a good example
  		# https://github.com/spree/spree/blob/master/core/lib/generators/spree/install/install_generator.rb

  		class_option :migrate, :type => :boolean, :default => true, :banner => 'Run CommonEngine migrations'
  		class_option :lib_name, :type => :string, :default => 'common_engine'

  		def self.source_paths
  			
  		end

  		def prepare_options
  			@run_migrations = options[:migrate]
  			@lib_name = options[:lib_name]
  		end

#   		def additional_tweaks
#   		return unless File.exists? 'public/robots.txt' 
#   			append_file "public/robots.txt", <<- ROBOTS			
# User-agent: *  
# Disallow: /users
#   			ROBOTS
#   			end
#   		end

  	# def setup_assets
  	# 	@lib_name = 'common_engine'
  	# 	%w{javascripts stylesheets images}.each do |path|
   #      empty_directory "app/assets/#{path}/store"
   #      empty_directory "app/assets/#{path}/admin"
   #    end
  	# end

  	def install_migrations
  		say_status :copying, "migrations"
        silence_stream(STDOUT) do
          silence_warnings { rake 'railties:install:migrations' }
        end
      end
  	end

  	def create_database
  		say_status :creating, "database"
        silence_stream(STDOUT) do
          silence_stream(STDERR) do
            silence_warnings { rake 'db:create' }
          end
        end
      end
  	end

  	def run_migrations
  		if @run_migrations
          say_status :running, "migrations"
          quietly { rake 'db:migrate' }
        else
          say_status :skipping, "migrations (don't forget to run rake db:migrate)"
        end
      end
    end

    def notify_about_routes
      insert_into_file File.join('config', 'routes.rb'), :after => "Application.routes.draw do\n" do
        %Q{
# This line mounts CommonEngine's routes at the root of your application.
# This means, any requests to URLs such as /user, will go to 
# CommonEngine::UserController. If you would like to change where this engine
# is mounted, simply change the :at option to something different.
#
# We ask that you don't use the :as option here, as CommonEngine relies on it being
# the default of "common_engine"
mount CommonEngine::Engine, :at => '/'
        }
      end

      unless options[:quiet]
        puts "*" * 50
        puts "We added the following line to your application's config/routes.rb file:"
        puts " "
        puts "    mount CommonEngine::Engine, :at => '/'"
      end
    end

    def complete
      unless options[:quiet]
        puts "*" * 50
        puts "CommonEngine has been installed successfully. You're all ready to go!"
        puts " "
        puts "Enjoy!"
      end
    end



end