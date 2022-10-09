class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, {:length => { :minimum => 250 }}
    validates :summary, {:length => { :maximum => 250 }}
    validates_inclusion_of :category, :in => %w(Fiction Non-Fiction)
    validate :title_should_contain
    # validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

    TITLE_NOT_CONTAIN = [
        /Won't Believe/i,
        /Secret/i,
        /Top/i,
        /Guess/i

    ]

    def title_should_contain
        if TITLE_NOT_CONTAIN.none? { |word| word.match title}
            errors.add(:title, "Title not clickbaity enough")
        end
    end
end