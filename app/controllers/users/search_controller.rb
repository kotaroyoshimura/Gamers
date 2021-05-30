class Users::SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how,@model,@value)
  end
  
  private
  
  def match(model, value)
    if model == 'user'
      User.where(name: value)
    elsif model == 'game'
      Game.where(title: value)
    end
  end
  
  def forward(model, value)
    if model == 'user'
      User.where("name LIKE ?", "#{value}%")
    elsif model == 'game'
      Game.where("title LIKE ?", "#{value}%")
    end
  end
  
  def backword(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'game'
      Game.where("title LIKE ?", "%#{value}")
    end
  end
  
  def partical(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'game'
      Game.where("title LIKE ?", "%#{value}%")
    end
  end
  
  def search_for(how,model,value)
    case how
    when 'match'
      match(model,value)
    when 'forward'
      forward(model,value)
    when 'backword'
      backword(model,value)
    when 'partical'
      partical(model,value)
    end
  end
end
