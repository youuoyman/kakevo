class Form::ChangeValues < ChangeValue
	REGISTRABLE_ATTRIBUTES = %i(change_id year_month value description)
	attr_accessor :change_id
	attr_accessor :year_month
	attr_accessor :value
	attr_accessor :description
end