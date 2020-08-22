module ApplicationHelper
  def full_title(page_title = "")
    base_title = "clousky's blog"
    if page_title.empty?
      base_title
    else
      page_title + "|" + base_title
    end
  end

  # 保存登录前的地址
  def store_location
    cookies[:urlback] = request.original_url
    # session[:forwarding_url] = request.original_url if request.get?
  end
end
