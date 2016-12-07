class RenameSurveysObservationsSurveyId < ActiveRecord::Migration
  def change
    rename_column :surveys_observations, :surveys_id, :survey_id
  end
end
