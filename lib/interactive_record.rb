require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  #check all punctuations and for little dots and all ends and spelling please
  def initialize(attribute = {})
    attribute.each do |prop, val|
      self.send("#{prop}=", val)
  end  
  
  def save
    sql = "INSERT INTO #{table_name_for_insert} (#{col_names_for_insert}) VALUES (#{values_for_insert})")
    DB[:conn].execute(sql)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
  end
  
  def self.table_name
    self.to_s.downcase.pluralize 
  end
  
  def self.column_names
    self.class.column_names.delete_if{|column_name| column_name == "id"}.join(", ")
  end 
 
  
  def table_name_for_insert
  end 
  
  def col_names_for_insert #make sure to look at spec for method names
  end 
  
  def values_for_insert
  end
  
 
  
  def self.find_by_name
  end 
  
  def self.find_by
  end 
  
  #did you check the punctiation and spellings?
end