class Form::FixedValue < FixedValue
	REGISTRABLE_ATTRIBUTES = %i(fixed_id year_month value description)
	attr_accessor :fixed_id
	attr_accessor :year_month
	attr_accessor :value
	attr_accessor :description
end