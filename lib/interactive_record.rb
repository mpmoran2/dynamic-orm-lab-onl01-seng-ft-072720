require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  #check all punctuations and for little dots and all ends and spelling please
  
  def self.table_name
    self.to_s.downcase.pluralize 
  end
  
  def self.column_names
  end 
  
  def initialize()
    options.each do |k, v|
      self.send("#{k}=", v)
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
  
  #did you check the punctiation and spellings?
end