class ApplicationController < ActionController::Base

  def favorite_text
    return @favorite_exists ? "- 위시리스트에서 빼기" : "+ 위시리스트에 더하기"
  end

  helper_method :favorite_text

end
