json.extract! homework_submission, :id, :course_session_participant_id, :homework_id, :pull_request, :is_public, :created_at, :updated_at
json.url homework_submission_url(homework_submission, format: :json)
