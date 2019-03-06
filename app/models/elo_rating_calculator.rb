class EloRatingCalculator
  def run
    if winner === team_a
      new_a_rating = team_a.rating.to_f + adjusted_k_value(home_team_score - away_team_score) * (1 - expected_team_a)
      new_b_rating = team_b.rating.to_f + adjusted_k_value(home_team_score - away_team_score) * (0 - expected_team_b)
    elsif winner === team_b
      new_a_rating = team_a.rating.to_f + adjusted_k_value(away_team_score - home_team_score) * (0 - expected_team_a)
      new_b_rating = team_b.rating.to_f + adjusted_k_value(away_team_score - home_team_score) * (1 - expected_team_b)
    else
      new_a_rating = team_a.rating.to_f + k_value * (0.5 - expected_team_a)
      new_b_rating = team_b.rating.to_f + k_value * (0.5 - expected_team_b)
    end

    team_a.update(rating: new_a_rating.round)
    team_b.update(rating: new_b_rating.round)
  end

  def initialize(match)
    @team_a = match.home_team
    @team_b = match.away_team
    @home_team_score = match.home_team_score
    @away_team_score = match.away_team_score
    @winner = match.winner
    @k_value = 30
  end

  def adjustment(point_spread)
    if point_spread > 2.9
      return (point_spread - 2.0) ** (1.0 / 3.0)
    end

    return 1.0
  end

  def adjusted_k_value(point_spread)
    k_value * adjustment(point_spread)
  end

  def expected_team_a
    (
      1.0 / (1.0 + (10.0 ** ((team_b.rating.to_f - team_a.rating.to_f) / 400.0)))
    ).round(2)
  end

  def expected_team_b
    (
      1.0 / (1.0 + (10.0 ** ((team_a.rating.to_f - team_b.rating.to_f) / 400.0)))
    ).round(2)
  end

  private

  attr_reader :team_a, :team_b, :k_value, :winner, :home_team_score, :away_team_score
end
