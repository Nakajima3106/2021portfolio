class SearchController < ApplicationController
  def search
    @value = params["search"]["value"]
    @datas = search_for(@value)
  end

  private

  def partical(value)
      User.where("name LIKE ?", "%#{value}%")
  end

  def search_for(value)
      partical(value)
  end
end
