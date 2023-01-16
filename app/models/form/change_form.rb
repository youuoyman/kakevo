class Form::ChangeForm < Form::Base
	attr_accessor :change_values

	def initialize(attributes = {})
    super attributes
		changes = Change.order(created_at: :asc)
		self.change_values = changes.map { |change| ChangeValue.new(change_id: change.id) } unless change_values.present?
  end

	def change_values_attributes=(attributes)
    self.change_values = attributes.map do |_, change_value_attributes|
      Form::ChangeValues.new(change_value_attributes).tap { |v| puts v}
    end

  end

	def valid?
		valid_change_values = self.change_values.map(&:valid?).all?
		super && valid_change_values
	end

	def save
		return false unless valid?
		ChangeValue.transaction {
			self.change_values.select.each { |change_value|
				a1 = ChangeValue.new(:change_id => change_value.change_id,
					:year_month => change_value.year_month,
					:value => change_value.value,
					:description => change_value.description)
				a1.save!
			 }
		}
		true
	end

	def target_change_values
		self.change_values.select { |v| '*' }
	end

end