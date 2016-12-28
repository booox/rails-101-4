class WelcomeController < ApplicationController
	def index
		flash[:notice] = "早安！你好！"
		flash[:warning] = "just a warning info！"
		flash[:alert] = "It's time to go to bed！"
	end
end
