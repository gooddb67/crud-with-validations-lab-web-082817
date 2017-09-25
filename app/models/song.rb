class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, unless: Proc.new {|a|a.released == false}
  validate :in_future?
  validates :title, uniqueness: { scope: :release_year }



  def in_future?
  if release_year
    if self.release_year > Date.today.year
        self.errors[:release_year] << "Year is in future"
    else
      return
      end
    end
  end

end
