class PredictionGenerator
  def initialize(match)
    @match = match
    @home_team = match.home_team.team
    @away_team = match.away_team.team
  end

  def run
    Prediction.create(
      match: match,
      home_team_guess: expected_home_team,
      away_team_guess: expected_away_team,
      winner_guess: expected_winner,
      correct: correct,
    )
  end

  def expected_home_team
    (
      1.0 / (1.0 + (10.0 ** ((away_team.rating.to_f - home_team.rating.to_f) / 400.0)))
    ).round(2)
  end

  def expected_away_team
    (
      1.0 / (1.0 + (10.0 ** ((home_team.rating.to_f - away_team.rating.to_f) / 400.0)))
    ).round(2)
  end

  def expected_winner
    if expected_home_team > expected_away_team
      return home_team
    end
    if expected_away_team > expected_home_team
      return away_team
    end
  end

  def correct
    if expected_winner == match.winner
      return true
    end
    return false
  end

  private

  attr_accessor :match, :home_team, :away_team
end
