class EpicenterController < ApplicationController
  def feed

      #empty array for holding all tweets
      @following_tweets = []

      #loop thru all the tweets and find the relevant ones
      # TODO: very inefficient query, look at better alternatives
      if user_signed_in?
          Tweet.all.each do |tweet|
              if current_user.following.include?(tweet.user_id)
                  @following_tweets.push(tweet)
              end
          end
      end
  end

  def show_user
      @user = User.find(params[:id])
  end

  def now_following
      #displaying purposes
      @user = User.find(params[:id])

      current_user.following.push(params[:id].to_i)
      #adds user.id of User you want to follow to 'following' array attribute

      current_user.save
      #save to db
  end

  def unfollow
      @user = User.find(params[:id])

      current_user.following.delete(params[:id].to_i)

      current_user.save
  end

  def tag_tweets
    @tag = Tag.find(params[:id])
  end
end


