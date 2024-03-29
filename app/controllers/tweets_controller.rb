class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.' 
    else
      render action: "new" 
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update_attributes(params[:tweet])
      format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
    else
      format.html { render action: "edit" }
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url 
  end
end
