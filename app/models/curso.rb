class Curso < ApplicationRecord
    has_many :video, :dependent => :destroy
end
