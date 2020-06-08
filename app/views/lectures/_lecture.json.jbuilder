json.extract! lecture, :id, :lecture_name, :lecture_content, :video_link, :homework, :teacher, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
