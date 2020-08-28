require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  
  def self.table_name
  end
  
  def self.column_names
  end 
  
  def initialize
  end 
  
  def table_name_for_insert
  end 
  
  def col_names_for_insert #make sure to look at spec for method names
  end 
  
  def values_for_insert
  end
  
  def save
  end 
  
  def self.find_by_name
  end 
  
  def self.find_by
  end 
  
end