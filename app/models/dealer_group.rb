class DealerGroup < ActiveRecord::Base
  #attr_accessible :subdomain
  attr_protected :created_at

  has_many :dealer_companies

  after_create :create_schema

  def create_schema
    connection.execute("create schema #{subdomain}")
    scope_schema do
      load Rails.root.join("db/schema.rb")
      connection.execute("drop table #{self.class.table_name}")
    end
  end

  def scope_schema(*paths)
    original_search_path = connection.schema_search_path
    connection.schema_search_path = ["#{subdomain}", *paths].join(",")
    yield
  ensure
    connection.schema_search_path = original_search_path
  end
end
