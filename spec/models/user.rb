class User < ActiveRecord::Base
  include Sluggify
  sluggify :name, :on=>[:create]
end
