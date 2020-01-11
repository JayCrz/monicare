module Teacher::MiscHelper
  def cover_misc_pic_image_tag(dashboard)
    if dashboard.admin_sign?
      image_tag dashboard.admin_sign.thumb.url, id: 'preview_misc_pic'
    else
      image_tag fake_image, id: 'preview_misc_pic', class: 'preview_misc_pic_new'
    end
  end

  def show_misc_pic_image(dashboard)
    if dashboard.admin_sign?
      dashboard.admin_sign
    else
      fake_image
    end
  end
  private
  def fake_image
    "https://fakeimg.pl/300x300/FFDD55/FFA488/?text=圖片&font=noto"
  end
end
