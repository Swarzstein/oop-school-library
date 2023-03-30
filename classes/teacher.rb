require_relative 'person'
require 'securerandom'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', id = SecureRandom.uuid, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
