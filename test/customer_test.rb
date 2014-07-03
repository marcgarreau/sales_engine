require_relative 'test_helper.rb'

class CustomerTest<Minitest::Test
  attr_reader :data,
              :customer

  def setup
    @customer = Customer.new(data)
  end

  def data
    { :id => "3",
      :first_name => "Mariah",
      :last_name => "Toy",
      :created_at => "2012-03-27",
      :updated_at => "2012-03-27"
    }
  end

  def test_it_has_attributes
    customer.id
    customer.first_name
    customer.last_name
    customer.created_at
    customer.updated_at
  end

  def test_it_knows_its_id
    assert customer.id == "3"
  end

  def test_it_knows_its_first_name
    assert customer.first_name == "Mariah"
  end

  def test_it_knows_its_last_name
    assert customer.last_name == "Toy"
  end

  def test_it_knows_when_it_was_created
    assert customer.created_at == "2012-03-27"
  end

  def test_it_knows_when_it_was_updated
    assert customer.updated_at == "2012-03-27"
  end
end
