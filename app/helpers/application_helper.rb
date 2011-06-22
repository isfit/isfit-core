# Methods added to this helper will be available to all templates in the application.
require 'digest/md5'

module ApplicationHelper
  def where_am_i(object = nil)
    links = []
    logger.info "app_help session #{session[:whereami].inspect}"
    if not session[:whereami] or session[:whereami][0].eql?("NilClass")
      logger.info "tomt her"
    else
      session_class = Object.const_get(session[:whereami][0])
      session_object = session_class.find_by_id(session[:whereami][1])
      logger.info session_object.inspect.to_s
      object = session_object
    end

    while !object.nil?
      if object.is_a?(Festival)
        session[:festival_year] = object.year
        links << link_to("ISFiT #{object.year}", festival_path(object), :class => :festival)
        object = nil
      elsif object.is_a?(Section)
        links << link_to(object.name_en, section_path(object), :class => :section)
        object = object.festival
      elsif object.is_a?(Group)
        links << link_to(object.name_en, group_path(object), :class => :group)
        object = object.section || object.festival
      else
        raise ArgumentError.new("Unknown object type")
      end
    end

    links << link_to("ISFiT", root_path())   

    '/ ' + links.reverse.join(' / ')
  end
end
module ActiveRecord
  class Base
    def self.to_select(conditions = nil)
      find(:all).collect{ |x| [x.name, x.id] }
    end
  end
end
class Array
  def to_select
    self.collect { |x| [x.name, x.id] }
  end
end
