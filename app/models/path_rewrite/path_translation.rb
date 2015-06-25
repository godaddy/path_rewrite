module PathRewrite
  class PathTranslation < ActiveRecord::Base

    validates_uniqueness_of :old_path

  end
end
