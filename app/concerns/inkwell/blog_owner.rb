module Inkwell
  module BlogOwner
    extend ActiveSupport::Concern

    included do
      has_many :blog_items, class_name: 'Inkwell::BlogItem', as: :blogging_owner

      def blog(page: 1, per_page: nil)
        blog_items.includes(:blogged_item).page(page).per(per_page || blog_items_per_page).map(&:blogged_item)
      end

      def blog_items_per_page
        10
      end
    end
  end
end