class UndefinedRateError < StandardError
  def initialize(msg='Rental subclass must define rate attribute')
    super
  end
end