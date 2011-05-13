class VotesController < ApplicationController
  def create_vote
    vote = Vote.create(:movie_id => params[:movie_id],
                       :user_id => params[:user_id])
    render :text => vote.id.to_s
  end

  def toggle_vote
    vote = Vote.find(params[:vote_id])
    vote.val = params[:val]
    vote.save!
    render :partial => "votes/vote_row",
           :locals => { :vote => vote }
  end

  def toggle_seen
    vote = Vote.find(params[:vote_id])
    vote.seen = !vote.seen
    vote.save!
    render :partial => "votes/vote_row",
           :locals => { :vote => vote }
  end

  def toggle_want_to_see
    vote = Vote.find(params[:vote_id])
    vote.want_to_see = !vote.want_to_see
    vote.save!
    render :partial => "votes/vote_row",
           :locals => { :vote => vote }
  end

end
