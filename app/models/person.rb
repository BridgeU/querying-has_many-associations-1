class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.order_by_location_name
    # joins(:location).order("locations.name")
    # joins(:location).order(Location.arel_table[:name])
    joins(:location).merge(Location.order_by_name)
  end

  def self.with_employees
    # raise joins(:employees).distinct.to_sql
    joins(:employees).distinct
  end

  def self.with_employees_order_by_location_name
    # with_employees.order_by_location_name
    # from(self.with_employees, :people).order_by_location_name
    from(with_employees, arel_table.name).order_by_location_name
  end
end
