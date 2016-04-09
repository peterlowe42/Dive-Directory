class Vote < Acviterecord::Base
  belongs_to :votable, polymorphic: true
end
