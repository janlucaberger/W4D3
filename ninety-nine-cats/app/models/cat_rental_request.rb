class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def approve!
    CatRentalRequest.transaction do
      overlapping_pending_requests.each do |request|
        request.update!(status: "DENIED")
      end
      self.update!(status: "APPROVED")
    end
  end

  def deny!
    self.update(status: "DENIED")
  end

  private

  def overlapping_requests
    where_cat = <<-SQL
        cat_id = :self_cat_id AND NOT (
          :self_start > end_date OR start_date > :self_end
        )
    SQL

    CatRentalRequest.select("*").where(where_cat, {self_id: self.id,
      self_cat_id: self.cat_id, self_start: self.start_date, self_end: self.end_date})
      .where.not(id: self.id)
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      self.errors[:base] << "Cat is already rented out"
    end
  end
end
