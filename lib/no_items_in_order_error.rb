class NoItemsInOrderError < StandardError
  def initialize(msg='The order must have at least 1 item')
    super
  end
end