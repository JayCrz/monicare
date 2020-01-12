module Teacher::EatHelper
  def cover_meal_pic_image_tag(dashboard)
    if dashboard.admin_sign?
      image_tag dashboard.admin_sign.thumb.url, id: 'preview_meal_pic'
    else
      image_tag fake_meal_image, id: 'preview_meal_pic', class: 'preview_meal_pic_new'
    end
  end

  def show_meal_pic_image(dashboard)
    if dashboard.admin_sign?
      dashboard.admin_sign
    else
      fake_meal_image
    end
  end
  private
  def fake_meal_image
    "https://fakeimg.pl/300x300/FFA488/D2D2D2/?text=圖片&font=noto"
  end
end
