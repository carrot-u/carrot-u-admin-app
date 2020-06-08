# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CourseSession.create(name: 'CarrotU Fall 2019', repository_link: 'https://github.com/carrot-u')


Lecture.create(lecture_name: 'Orientation', lecture_content: 'Program overview and disucss syllabus', video_link: 'N/A', homework_id: '1', teacher_id: 1, created_at: Time.now.utc, updated_at: Time.now.utc, course_session_id: 1)
