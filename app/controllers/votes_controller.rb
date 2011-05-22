class VotesController < ApplicationController
  def find_or_create_vote(params)
    if (params[:vote_id].length > 0)
      vote = Vote.find(params[:vote_id])
    else
      vote = Vote.create(:movie_id => params[:movie_id],
                         :user_id => params[:user_id])
    end
  end

  def toggle_vote
    vote = find_or_create_vote(params)
    vote.val = params[:val]
    vote.save!
    render :partial => "movies/vote_row",
           :locals => { :vote => vote }
  end

  def toggle_seen
    vote = find_or_create_vote(params)
    vote.seen = !vote.seen
    vote.save!
    render :partial => "movies/vote_row",
           :locals => { :vote => vote }
  end

  def toggle_want_to_see
    vote = find_or_create_vote(params)
    vote.want_to_see = !vote.want_to_see
    vote.save!
    render :partial => "movies/vote_row",
           :locals => { :vote => vote }
  end

end
