require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  #check all punctuations and for little dots and all ends and spelling please
  def initialize(attributes={})
    attributes.each do |property, value|
      self.send("#{property}=", value)
    end
  end 
  
  def save
    sql = "INSERT INTO #{table_name_for_insert} (#{col_names_for_insert}) VALUES (#{values_for_insert})"
    
    DB[:conn].execute(sql)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
  end
  
  def self.table_name
    self.to_s.downcase.pluralize 
  end
  
  def self.column_names
    sql = "PRAGMA table_info('#{table_name}')"
    
    table_info = DB[:conn].execute(sql)
    column_names = []
    table_info.each do |column|
      column_names << column["name"]
    end 
    column_names.compact
  end 

  def table_name_for_insert
    self.class.table_name
  end 
  
  def col_names_for_insert #make sure to look at spec for method names
    self.class.column_names.delete_if{|col_name| col_name == "id"}.join(", ")
  end 
  
  def values_for_insert
    values = []
    self.class.column_names.each do |col_name|
      values << "'#{self.send(col_name)}'" unless send(col_name).nil?
    end
    values.join(",")
  end
 
  def self.find_by_name(name)
    DB[:conn].execute("SELECT * FROM #{table_name} WHERE name = ?", name)
  end 
  
  def self.find_by(attribute)
    column = attribute.keys[0].to_s
    value = attribute.values[0]
    
    DB[:conn].execute("SELECT * FROM #{table_name} WHERE #{column} = ?", value)
  end 
  
  #did you check the punctiation and spellings?
end