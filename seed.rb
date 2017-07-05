
require 'active_record'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/post'
require_relative 'models/enquiry'

Post.create location: 'Melbourne'
Post.create location: 'Sydney'
Post.create location: 'Canberra'
Post.create location: 'Perth'

Post.create category: 'Working with animals'
Post.create category: 'Disability care'
Post.create category: 'Education and training'
Post.create category: 'Social support'
