class Form::FixedForm < Form::Base
	attr_accessor :fixed_values

	def initialize(attributes = {})
    super attributes
		fixeds = Fixed.order(created_at: :asc)
		self.fixed_values = fixeds.map { |fixed| FixedValue.new(fixed_id: fixed.id) } unless fixed_values.present?
  end

	def fixed_values_attributes=(attributes)
    self.fixed_values = attributes.map do |_, fixed_value_attributes|
      Form::FixedValues.new(fixed_value_attributes).tap { |v| puts v}
    end

  end

	def valid?
		valid_fixed_values = self.fixed_values.map(&:valid?).all?
		super && valid_fixed_values
	end

	def save
		return false unless valid?
		FixedValue.transaction {
			self.fixed_values.select.each { |fixed_value|
				a1 = FixedValue.new(:fixed_id => fixed_value.fixed_id,
					:year_month => fixed_value.year_month,
					:value => fixed_value.value,
					:description => fixed_value.description)
				a1.save!
			 }
		}
		true
	end

	def target_fixed_values
		self.fixed_values.select { |v| '*' }
	end

end