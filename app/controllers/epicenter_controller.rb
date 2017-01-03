class EpicenterController < ApplicationController
  def feed
  	# initialize array that holds tweets from current
  	# users you are following.
  	@following_tweets = []

  	# iterate through and find associated user tweets 
  	# from array.
  	Tweet.all.each do |tweet|
  		if current_user.following.include?(tweet.user_id)
  			@following_tweets.push(tweet)
  			# those tweets are pushed into the following tweets 
  			# array with will power the view.
  		end
  	end
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  	# for display purposes.
  	@user = User.find(params[:follow_id])

  	# here's some back-end work
  	current_user.following.push(params[:follow_id].to_i)
  	# added the user.id of the Uswer you want to follow
  	# to your 'following' array.

  	current_user.save
  	#then we save to the db.
  end

  def unfollow
  end
end
